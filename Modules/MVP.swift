//
//  Presenter.swift
//  Modules
//
//  Created by Arkady Smirnov on 3/2/18.
//  Copyright © 2018 Arkady Smirnov. All rights reserved.
//

import Foundation
import UIKit
import SVR

class ThirdPresenter<T: ThirdView>: BasePresenter<T>, ThirdScreen {
    
    var communicationObject: SomeData!

    override func activate() {
        self.view?.onButtonTap = self.buttonTap
        self.view?.displayUI(string: communicationObject.value)
    }
    
    func buttonTap() {
        self.view?.displayUI(string: "tapped")
    }
    
}

protocol ThirdView: MVPView {
    func displayUI(string: String)
    var onButtonTap: VoidClosure? { get set }
}

class ThirdViewController: MVPController, ThirdView {
    
    @IBOutlet weak var label: UILabel?
    
    @IBAction func buttonTap() {
        onButtonTap?()
    }
    
    func displayUI(string: String) {
        container?.resolve(SomeInjectedComponent.self)?.printHello()
        label?.text = string
    }
    
    var onButtonTap: VoidClosure?
    
}

