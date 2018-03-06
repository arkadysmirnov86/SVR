//
//  Screens.swift
//  Modules
//
//  Created by Arkady Smirnov on 3/1/18.
//  Copyright © 2018 Arkady Smirnov. All rights reserved.
//

import Foundation
import UIKit
import SVR

struct SomeData {
    var value: String
}

protocol FirstScreen: Screen {
    
}


protocol SecondScreen: Screen {
    
}

protocol ThirdScreen: Screen {
    var communicationObject: SomeData! { get set }
}
