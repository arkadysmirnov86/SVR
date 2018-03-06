//
//  Screen.swift
//  Modules
//
//  Created by Arkady Smirnov on 3/6/18.
//  Copyright © 2018 Arkady Smirnov. All rights reserved.
//

import Foundation

public protocol Screen: class {
    static func factoryMethod() -> Screen
    func getPresentation() -> Presentable
    //func configure(with params: Dictionary<AnyHashable, Any>) -> Presentable
}
