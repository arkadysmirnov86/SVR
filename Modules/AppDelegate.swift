//
//  AppDelegate.swift
//  Modules
//
//  Created by Arkady Smirnov on 3/1/18.
//  Copyright © 2018 Arkady Smirnov. All rights reserved.
//

import UIKit
import SVP
typealias VoidClosure = () -> Void

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        configurePages()
        
        return true
    }
    
    func configurePages(){
        Container.shared.registerSсreen(FirstScreen.self, as: FirstViewController.self)
        Container.shared.registerSсreen(ThirdScreen.self, as: ThirdPresenter<ThirdViewController>.self)
    }
//    
//    func configureDI() {
//        Container.shared.register(FirstScreen.self, closure: {
//            return FirstViewController.instantiate(from: UIStoryboard(name: "Main", bundle: nil))
//        })
//        
//        Container.shared.register(ThirdScreen.self, closure: {
//            return ThirdPresenter<ThirdViewController>()
//        })
//        
//    }

}

