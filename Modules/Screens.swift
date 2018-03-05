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

struct FirstTransferObject {
    var value: String
}

protocol FirstScreen: Screen {
    
}

protocol ThirdScreen: Screen {
    var transferObj: FirstTransferObject! { get set }
}

