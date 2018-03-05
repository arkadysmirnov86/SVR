//
//  Container.swift
//  SVR
//
//  Created by Arkady Smirnov on 3/2/18.
//  Copyright © 2018 Arkady Smirnov. All rights reserved.
//

import Foundation

public class Container {
    typealias creator = () -> Any
    public static var shared = Container()
    private var container = Dictionary<AnyHashable, Any>()
    
    private init() {
        
    }
    
    public func register<Type> (_ type: Type.Type, closure: @escaping () -> Type) {
        self.container[Metatype(type)] = closure
    }
    
    public func registerSсreen<Type, Type2: Screen> (_ type: Type.Type, as registerType: Type2.Type) {
        self.container[Metatype(type)] = registerType
    }
    
    public func resolve<T>(_ type: T.Type) -> T? {
        return (container[Metatype(T.self)] as? creator)?() as? T
    }
    
    public func resolveScreen<T>(_ type: T.Type) -> Screen? {
        let instanceType = container[Metatype(T.self)] as! Screen.Type
        let result = instanceType.factoryMethod()
        return result
    }
}
