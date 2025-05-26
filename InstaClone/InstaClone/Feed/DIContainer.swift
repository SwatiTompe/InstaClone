
import Foundation

final class DIContainer {
    static let shared = DIContainer()

    private var services: [ObjectIdentifier: Any] = [:]

    private init() {}

    func register<T>(_ service: T, for type: T.Type = T.self) {
        let key = ObjectIdentifier(type)
        services[key] = service
    }

    func resolve<T>(_ type: T.Type = T.self) -> T {
        let key = ObjectIdentifier(type)
        guard let service = services[key] as? T else {
            fatalError("No registered service for type \(type)")
        }
        return service
    }
}
