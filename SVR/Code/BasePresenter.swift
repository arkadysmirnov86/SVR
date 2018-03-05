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
    
    weak var viewWrapper: Wrapper<T>?
    
    public var view: T? {
        return viewWrapper?.wrapped
    }
    
    public func configure() -> Presentable {
        let configuredView = T.factoryMethod() //Container.shared.resolve(type) as! MVPView
        configuredView.presenterStrongRef = self
        configuredView.activatePresenter = activate
        viewWrapper = Wrapper(configuredView as! T)
        return configuredView
    }
    
    open func activate() {
        
    }
}
