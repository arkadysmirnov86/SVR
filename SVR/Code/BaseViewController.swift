//
//  BaseViewController.swift
//  SVR
//
//  Created by Arkady Smirnov on 3/6/18.
//  Copyright © 2018 Arkady Smirnov. All rights reserved.
//

import UIKit


open class BaseViewController: UIViewController {
    
    static var storyboardName: String {
        return "Main"
    }
    
    static func factoryMethod() -> UIViewController {
        let storyboard = UIStoryboard(name: BaseViewController.storyboardName, bundle: nil)
        return self.instantiate(from: storyboard)
    }
    
    private class var nibName: String {
        let className = String(describing: self)
        
        return className.substring(to: className.index(of: "<") ?? className.endIndex)
    }
    
    private class func _instantiate<Controller: BaseViewController>(from storyboard: UIStoryboard) -> Controller {
        
        guard let result = storyboard.instantiateViewController(withIdentifier: nibName) as? Controller else {
            let className = (String(describing: Controller.self))
            fatalError("No controller of \(className) class with \"\(nibName)\" identifier in storyboard")
        }
        
        return result
    }
    
    class func instantiate(from storyboard: UIStoryboard) -> Self {
        return _instantiate(from: storyboard)
    }
    
}

extension BaseViewController: ScreenLoader {
    
    public func push<S>(type: S.Type, beforePresent: ((S) -> Void)?){
        if let screen = Container.shared.resolveScreen(S.self) {
            beforePresent?(screen as! S)
            let controller = screen.getPresentation().presentation(type: UIViewController.self)
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
    public func presentation<T>(type: T.Type) -> T {
        return self as! T
    }
}
