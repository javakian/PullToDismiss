//
//  Config.swift
//  Demo
//
//  Created by James Avakian on 11/15/16.
//  Copyright © 2016 Optical Automation, LLC. All rights reserved.
//

import Foundation
import PullToDismiss

class Config {
    static let shared: Config = Config()
    
    var background: PullToDismiss.Background = PullToDismiss.Background.defaultShadow
    var dismissableHeightPercentage: CGFloat = PullToDismiss.Defaults.dismissableHeightPercentage
    
    func adaptSetting(pullToDismiss: PullToDismiss?) {
        pullToDismiss?.background = background
        pullToDismiss?.dismissableHeightPercentage = dismissableHeightPercentage
    }
}
