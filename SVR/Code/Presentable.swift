//
//  Presentable.swift
//  SVR
//
//  Created by Arkady Smirnov on 3/6/18.
//  Copyright © 2018 Arkady Smirnov. All rights reserved.
//

import Foundation


public protocol Presentable {
    func presentation<T>(type: T.Type) -> T
}

