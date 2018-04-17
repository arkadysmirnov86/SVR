//
//  UIViewController+SVR.swift
//  SVR
//
//  Created by Arkady Smirnov on 4/17/18.
//  Copyright © 2018 Arkady Smirnov. All rights reserved.
//

import UIKit

extension UIViewController {
    private class var nibName: String {
        let className = String(describing: self)
        
        return className.substring(to: className.index(of: "<") ?? className.endIndex)
    }
    
    private class func _instantiate<Controller: UIViewController>(from storyboard: UIStoryboard) -> Controller {
        
        guard let result = storyboard.instantiateViewController(withIdentifier: nibName) as? Controller else {
            let className = (String(describing: Controller.self))
            fatalError("No controller of \(className) class with \"\(nibName)\" identifier in storyboard")
        }
        
        return result
    }
    
    public class func instantiate(from storyboard: UIStoryboard) -> Self {
        return _instantiate(from: storyboard)
    }
}
