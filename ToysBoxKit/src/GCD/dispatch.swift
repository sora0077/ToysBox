//
//  dispatch.swift
//  ToysBoxKit
//
//  Created by 林達也 on 2015/06/13.
//  Copyright (c) 2015年 林達也. All rights reserved.
//

import Foundation

//MARK: GCD helpers

public func sync_main(block: dispatch_block_t!) {
    if NSThread.isMainThread() {
        block?()
    } else {
        dispatch_sync(dispatch_get_main_queue(), block)
    }
}

public func async_main(block: dispatch_block_t!) {
    dispatch_async(dispatch_get_main_queue(), block)
}

public func async_after(when: NSTimeInterval, _ block: dispatch_block_t!) {
    async_after(when, dispatch_get_main_queue(), block)
}

public func async_after(when: NSTimeInterval, _ queue: dispatch_queue_t, _ block: dispatch_block_t!) {
    let when = dispatch_time(DISPATCH_TIME_NOW, Int64(when * Double(NSEC_PER_SEC)))
    dispatch_after(when, queue, block)
}

public func sync(queue: dispatch_queue_t, _ block: dispatch_block_t!) {
    
    let queue_label = dispatch_queue_get_label(queue)
    let current_label = dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL)
    if queue_label != current_label {
        dispatch_sync(queue, block)
    } else {
        block?()
    }
}

public func async(queue: dispatch_queue_t, _ block: dispatch_block_t!) {
    dispatch_async(queue, block)
}

public func async(block: dispatch_block_t!) {
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_DEFAULT, 0), block)
}
