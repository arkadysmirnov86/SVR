//
//  Wrapper.swift
//  SVP
//
//  Created by Arkady Smirnov on 3/6/18.
//  Copyright © 2018 Arkady Smirnov. All rights reserved.
//

import Foundation

class Wrapper<T> {
    var wrapped: T
    init(_ w: T) {
        wrapped = w
    }
}
