//
//  BasePresenter.swift
//  SVR
//
//  Created by Arkady Smirnov on 3/6/18.
//  Copyright © 2018 Arkady Smirnov. All rights reserved.
//

import Foundation

open class BasePresenter<T: MVPView>: Screen {
    
    public static func factoryMethod() -> Screen {
        return self.init() as Screen
    }
    
    public required init() {
        
    }
    
    public private (set) weak var view: T?
    
    public func getPresentation() -> Presentable {
        let configuredView = T.factoryMethod() 
        configuredView.presenterStrongRef = self
        configuredView.activatePresenter = activate
        view = configuredView as? T
        return configuredView
    }
    
    open func activate() {
        
    }
}

extension BasePresenter: ScreenLoader {
    
    public func push<S>(type: S.Type, beforePresent: ((S) -> Void)?) {
        (self.view as? ScreenLoader)?.push(type: type, beforePresent: beforePresent)
    }
    
    public var container: Container? {
        return (self.view as? ScreenLoader)?.container
    }
}
