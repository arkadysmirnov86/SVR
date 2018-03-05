//
//  Protocols.swift
//  SVR
//
//  Created by Arkady Smirnov on 3/6/18.
//  Copyright © 2018 Arkady Smirnov. All rights reserved.
//

import Foundation



public protocol Screen {
    static func factoryMethod() -> Screen
    func configure() -> Presentable
    //func configure(with params: Dictionary<AnyHashable, Any>) -> UIViewController
}

public protocol Presentable {
    func presentation<T>(type: T.Type) -> T
}

public protocol ViewModelProtocol {
    init()
    func loadData()
}


public protocol ScreenLoader {
    func push<S>(type: S.Type)
}

extension BaseViewController: Presentable {
    public func presentation<T>(type: T.Type) -> T {
        return self as! T
    }
}
