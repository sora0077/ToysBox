//
//  InspectorLayerViewController.swift
//  ToysBoxKit
//
//  Created by 林達也 on 2015/11/19.
//  Copyright © 2015年 林達也. All rights reserved.
//

import Foundation
import UIKit

public final class InspectorLayerView: UIView {
    
    public override func hitTest(point: CGPoint, withEvent event: UIEvent?) -> UIView? {
        
        let view = super.hitTest(point, withEvent: event)
        
        if view == self {
            return nil
        }
        
        return view
    }
}

/// InspectorLayerViewController
public final class InspectorLayerViewController: UIViewController {
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func loadView() {
        self.view = InspectorLayerView()
    }
}
