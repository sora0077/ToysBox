//
//  InterfaceBuilderUtility.swift
//  ToysBoxKit
//
//  Created by 林達也 on 2015/06/06.
//  Copyright (c) 2015年 林達也. All rights reserved.
//

import Foundation

/**
*  from_storyboard
*/
public protocol Storyboardable {
    
    static var storyboardIdentifier: String { get }
    static var storyboardName: String { get }
    
    static var storyboardBundle: NSBundle? { get }
}

public extension Storyboardable where Self: UIViewController {
    
    static var storyboardIdentifier: String {
        return "\(self)"
    }
    
    static var storyboardBundle: NSBundle? {
        return nil
    }
    
    static func instantiate() -> Self {
        return from_storyboard(self)
    }
}

/**
load view controller from storyboard

- parameter clazz: UIViewController class

- returns: typed view controller
*/
public func from_storyboard<T: UIViewController where T: Storyboardable>(clazz: T.Type) -> T! {
    
    let identifier = T.storyboardIdentifier
    let name = T.storyboardName
    let bundle = T.storyboardBundle
    
    let storyboard = UIStoryboard(name: name, bundle: bundle)
    return storyboard.instantiateViewControllerWithIdentifier(identifier) as? T
}

/**
* from_xib()
*/
public protocol Xibable {
    
    static var xibName: String { get }
}

public extension Xibable where Self: UIView {
    
    static var xibName: String {
        return "\(self)"
    }
    
    static func instantiate(owner owner: AnyObject? = nil, options: [NSObject: AnyObject]? = nil, atIndex index: Int = 0) -> Self {
        return from_xib(self, owner: owner, options: options, atIndex: index)
    }
}

/**
load view from xib

- parameter clazz:   UIView class
- parameter owner:   owner
- parameter options: options
- parameter index:   index

- returns: typed view
*/
public func from_xib<T: AnyObject where T: Xibable>(clazz: T.Type, owner: AnyObject? = nil, options: [NSObject: AnyObject]? = nil, atIndex index: Int = 0) -> T! {
    
    let name = T.xibName
    
    let xib = UINib(nibName: name, bundle: nil)
    return xib.instantiateWithOwner(owner, options: options)[index] as? T
}