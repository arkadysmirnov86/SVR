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
    
    var sic: SomeInjectedComponent?  {
        return container?.resolve(SomeInjectedComponent.self)
    }
    
    class var shared: MyAppManager {
        return (UIApplication.shared.delegate as! AppDelegate).appManager
    }
    
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, WindowProvider {

    var window: UIWindow?

    var appManager: MyAppManager!
    
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
        
        container.register(SomeInjectedComponent.self) {
            return SomeInjectedComponent()
        }
        
        return container
    }

}

class SomeInjectedComponent {
    func printHello() {
        print("hello")
    }
}
