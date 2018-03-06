//
//  ViewController.swift
//  Modules
//
//  Created by Arkady Smirnov on 3/1/18.
//  Copyright © 2018 Arkady Smirnov. All rights reserved.
//

import UIKit
import SVR

class StartViewController: BaseViewController, FirstScreen {
    
    static func factoryMethod() -> Screen {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return self.instantiate(from: storyboard) as! Screen
    }
    
    func getPresentation() -> Presentable {
        return self
    }
    
    
    @IBAction func goToSecond() {
        push(type: SecondScreen.self)
    }
    
}
