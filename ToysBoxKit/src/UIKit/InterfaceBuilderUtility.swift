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
}

/**
load view controller from storyboard

:param: clazz UIViewController class

:returns: typed view controller
*/
public func from_storyboard<T: UIViewController where T: Storyboardable>(clazz: T.Type) -> T! {
    
    let identifier = T.storyboardIdentifier
    let name = T.storyboardName
    
    let storyboard = UIStoryboard(name: name, bundle: nil)
    return storyboard.instantiateViewControllerWithIdentifier(identifier) as? T
}

/**
* from_xib()
*/
public protocol Xibable {
    
    static var xibName: String { get }
}

/**
load view from xib

:param: clazz   UIView class
:param: owner   owner
:param: options options
:param: index   index

:returns: typed view
*/
public func from_xib<T: AnyObject where T: Xibable>(clazz: T.Type, owner: AnyObject? = nil, options: [NSObject: AnyObject]? = nil, atIndex index: Int = 0) -> T! {
    
    let name = T.xibName
    
    let xib = UINib(nibName: name, bundle: nil)
    return xib.instantiateWithOwner(owner, options: options)[index] as? T
}