//
//  MVPController.swift
//  SVR
//
//  Created by Arkady Smirnov on 3/6/18.
//  Copyright © 2018 Arkady Smirnov. All rights reserved.
//

import Foundation


open class MVPController: BaseViewController, MVPView {
    
    public static func factoryMethod() -> MVPView {
        return super.factoryMethod() as! MVPView
    }
    
    public var activatePresenter: VoidClosure?
    
    public var presenterStrongRef: Any?
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        activatePresenter?()
    }
    
}
