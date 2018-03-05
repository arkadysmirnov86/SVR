//
//  MVVM.swift
//  Modules
//
//  Created by Arkady Smirnov on 3/2/18.
//  Copyright © 2018 Arkady Smirnov. All rights reserved.
//

import Foundation
import UIKit
import SVR

class FirstViewModel: ViewModelProtocol {
    
    var text: String = "" {
        didSet {
            self.textChanged?()
        }
    }
    
    var values: [Int]? {
        didSet {
            valuesChanged?()
        }
    }
    
    var textChanged: VoidClosure?
    var valuesChanged: VoidClosure?
    
    required init() {
        
    }
    
    func loadData() {
        self.text = "tewtewe"
    }
    
}

class FirstViewController: MVVMController<FirstViewModel>, FirstScreen {
    
    @IBOutlet weak var label: UILabel?
    
    override func bind() {
        viewModel?.textChanged = {
            [weak self] in
            
            self?.label?.text = self?.viewModel?.text
        }
    }
    
    @IBAction func goToThird() {
        self.push(type: ThirdScreen.self) {
            (screen) in
            screen.communicationObject = SomeData(value: "hello world")
        }
    }
    
}
