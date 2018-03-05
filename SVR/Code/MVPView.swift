//
//  MVPView.swift
//  SVR
//
//  Created by Arkady Smirnov on 3/6/18.
//  Copyright © 2018 Arkady Smirnov. All rights reserved.
//

import Foundation

public protocol MVPView: AnyObject, Presentable {
    static func factoryMethod() -> MVPView
    var presenterStrongRef: Any? {get set}
    var activatePresenter: (() -> Void)? { get set }
}
