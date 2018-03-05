//
//  MVVMController.swift
//  SVR
//
//  Created by Arkady Smirnov on 3/6/18.
//  Copyright © 2018 Arkady Smirnov. All rights reserved.
//

import Foundation

open class MVVMController<ViewModel: ViewModelProtocol>: BaseViewController, Screen {
    
    open static func factoryMethod() -> Screen {
        return super.factoryMethod() as! Screen
    }
    
    
    open var viewModel: ViewModel?
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        viewModel = ViewModel()
        bind()
        viewModel?.loadData()
    }
    
    open func getPresentation() -> Presentable {
        return self
    }
    
    open func bind() {
        
    }
}
