//
//  Notification.swift
//  ToysBoxKit
//
//  Created by 林達也 on 2015/07/08.
//  Copyright (c) 2015年 林達也. All rights reserved.
//

import Foundation

public class Notification {
    
    public enum Condition {
        case One
        case Always
        case Count(Int)
    }
    
    public typealias NotificationBlock = NSNotification -> Void
    
    public let name: String
    public private(set) var condition: Condition
    
    var block: NotificationBlock!
    
    private weak var object: AnyObject?
    
    private let center: NSNotificationCenter
    
    public init(name: String, with condition: Condition = .Always, center: NSNotificationCenter = NSNotificationCenter.defaultCenter(), object: AnyObject? = nil, _ block: NotificationBlock) {
        self.name = name
        self.condition = condition
        self.block = block
        self.object = object
        self.center = center
        
        center.addObserver(self, selector: "notification:", name: name, object: object)
    }
    
    deinit {
        
        self.center.removeObserver(self)
    }
    
    @objc
    func notification(noti: NSNotification) {
        
        let block = self.block
        
        switch self.condition {
        case .One:
            self.block = nil
        case let .Count(num) where num > 1:
            self.condition = .Count(num - 1)
        case let .Count(num) where num == 1:
            self.block = nil
        default:
            break
        }
        
        block?(noti)
    }
}
