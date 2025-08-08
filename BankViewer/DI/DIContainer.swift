//
//  DIContainer.swift
//  BankViewer
//
//  Created by Анастасия Кутняхова on 08.08.2025.
//

final class DIContainer {
    private var dependencies = [ObjectIdentifier: Any]()
    
    static let shared = DIContainer()
    
    func register<T>(
        identifier: T.Type,
        factory: @escaping () -> T
    ) {
        let id = ObjectIdentifier(identifier)

        dependencies[id] = factory
    }
    
    func register<T>(
        identifier: T.Type,
        factory: @escaping (_ parameters: Any) -> T
    ) {
        let id = ObjectIdentifier(identifier)

        dependencies[id] = factory
    }

    func resolve<T>(identifier: T.Type) -> T {
        let id = ObjectIdentifier(identifier)

        guard let factory = dependencies[id] as? () -> T else {
            fatalError("No registered factory without parameters for \(identifier)")
        }

        return factory()
    }

    func resolve<T>(identifier: T.Type, parameters: Any) -> T {
        let id = ObjectIdentifier(identifier)

        guard let factory = dependencies[id] as? (Any) -> T else {
            fatalError("No registered factory with parameters for \(identifier)")
        }
        
        return factory(parameters)
    }
}
