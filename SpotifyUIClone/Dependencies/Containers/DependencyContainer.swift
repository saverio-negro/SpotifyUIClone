//
//  DependencyContainer.swift
//  SpotifyUIClone
//
//  Created by Saverio Negro on 4/3/26.
//

import SwiftUI

protocol Dependency {}
extension UserManager: Dependency {}
extension ProductManager: Dependency {}

@MainActor
class DependencyContainer {
    
    private enum DependencyContainerError: LocalizedError {
        case unbalancedKeysAndDependencies(errorMessage: String)
    }
    
    private var dependencies: [String: Dependency] = [:]
    
    func register(_ type: Dependency.Type, dependency: Dependency) {
        let key = String(describing: type)
        self.dependencies[key] = dependency
    }
    
    func register(_ type: Dependency.Type, dependency: () -> Dependency) {
        let key = String(describing: type)
        self.dependencies[key] = dependency()
    }
    
    func register(_ types: Dependency.Type..., dependencies: Dependency...) throws {
        
        if (types.count != dependencies.count) {
            throw DependencyContainerError.unbalancedKeysAndDependencies(errorMessage: "The number of keys does not balance with the number of dependencies")
        }
        
        for (index, type) in types.enumerated() {
            let key = String(describing: type)
            self.dependencies[key] = dependencies[index]
        }
    }
    
    func resolve<D: Dependency>(_ type: D.Type) -> D? {
        let key = String(describing: type)
        return self.dependencies[key] as? D
    }
}
