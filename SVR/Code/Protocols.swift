//
//  Protocols.swift
//  SVR
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

public protocol Presentable {
    func presentation<T>(type: T.Type) -> T
}

public protocol ScreenLoader {
    func push<S>(type: S.Type, beforePresent: ((S) -> Void)?)
}

public extension ScreenLoader {
    func push<S>(type: S.Type) {
        push(type: type, beforePresent: nil)
    }
}

