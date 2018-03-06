//
//  AppDelegate.swift
//  Modules
//
//  Created by Arkady Smirnov on 3/1/18.
//  Copyright © 2018 Arkady Smirnov. All rights reserved.
//

import UIKit
import SVR

typealias VoidClosure = () -> Void

class MyAppManager: AppManager {
    
    class DataSevice {}
    
    var dataService: DataSevice?  {
        return container?.resolve(DataSevice.self)
    }
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, WindowProvider {

    var window: UIWindow?

    var appManager: AppManager!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let container = configurePages()
        
        appManager = MyAppManager(container: container)
        appManager.push(type: FirstScreen.self)
        
        return true
    }
    
    func configurePages() -> Container {
        let container = Container()
        container.registerSсreen(FirstScreen.self, as: StartViewController.self)
        container.registerSсreen(SecondScreen.self, as: SecondViewController.self)
        container.registerSсreen(ThirdScreen.self, as: ThirdPresenter<ThirdViewController>.self)
        return container
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
