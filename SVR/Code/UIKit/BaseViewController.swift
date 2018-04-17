//
//  BaseViewController.swift
//  SVR
//
//  Created by Arkady Smirnov on 3/6/18.
//  Copyright © 2018 Arkady Smirnov. All rights reserved.
//

import UIKit

open class BaseViewController: UIViewController {
    
    open class var storyboardName: String {
        return "Main"
    }
    
    static func factoryMethod() -> UIViewController {
        let storyboard = UIStoryboard(name: self.storyboardName, bundle: nil)
        return self.instantiate(from: storyboard)
    }
    
    
    
    public var container: Container?
}


extension BaseViewController: ScreenLoader {
    
    open func push<S>(type: S.Type, beforePresent: ((S) -> Void)?){
        if let screen = container?.resolveScreen(S.self) {
            beforePresent?(screen as! S)
            let controller = screen.presentable.presentation(type: BaseViewController.self)
            controller.container = self.container
            if let navcontroller = self.navigationController {
                navcontroller.pushViewController(controller, animated: true)
            } else {
                self.present(controller, animated: true, completion: {
                    
                })
            }
        }
    }
}

extension BaseViewController: Presentable {
    open func presentation<T>(type: T.Type) -> T {
        return self as! T
    }
}
