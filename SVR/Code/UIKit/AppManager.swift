//
//  AppManager.swift
//  Modules
//
//  Created by Arkady Smirnov on 3/6/18.
//  Copyright © 2018 Arkady Smirnov. All rights reserved.
//

import UIKit

public protocol WindowProvider {
    var window: UIWindow? { get }
}

open class AppManager : ScreenLoader {
    
    public private (set) var container: Container?
    
    var appDelegate: WindowProvider? {
        return UIApplication.shared.delegate as? WindowProvider
    }
    
    public init(container: Container) {
        self.container = container
    }
    
    public func push<S>(type: S.Type, beforePresent: ((S) -> Void)?) {
        if let screen = container?.resolveScreen(S.self) {
            beforePresent?(screen as! S)
            let controller = screen.getPresentation().presentation(type: BaseViewController.self)
            controller.container = self.container
            self.appDelegate?.window?.rootViewController = controller
        }
    }
    
}
