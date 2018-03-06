//
//  ScreenLoader.swift
//  Modules
//
//  Created by Arkady Smirnov on 3/6/18.
//  Copyright © 2018 Arkady Smirnov. All rights reserved.
//

import Foundation

public protocol ScreenLoader {
    var container: Container? { get }
    func push<S>(type: S.Type, beforePresent: ((S) -> Void)?)
}

public extension ScreenLoader {
    func push<S>(type: S.Type) {
        push(type: type, beforePresent: nil)
    }
}
