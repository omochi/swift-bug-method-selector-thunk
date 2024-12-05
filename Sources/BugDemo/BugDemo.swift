public protocol PageURL {
    associatedtype Post
}

public protocol Controller {
    static func register(into registry: some ControllerRoutesRegistry<Self>)
}

public protocol ControllerRoutesRegistry<ControllerType> {
    associatedtype ControllerType: Controller

    func post<URL: PageURL>(
        selector: @Sendable @escaping (ControllerType.Type) ->
            (ControllerType) -> (URL, URL.Post) async throws -> Void
    )
}

public struct FormActionPost<each V> {
    public init(action: String, _ v: repeat (each V)?) {
        self.action = action
        self.v = (repeat each v)
    }

    public var action: String
    public var v: (repeat (each V)?)
}

public struct UserEditFields: Codable {}

public struct UserEditURL: PageURL {
    public typealias Post = FormActionPost<UserEditFields>
}

public struct UserEditController: Controller {
    public static func register(into r: some ControllerRoutesRegistry<Self>) {
        r.post { $0.postEdit }
    }

    public func postEdit(url: UserEditURL, content post: UserEditURL.Post) async throws -> Void {
        fatalError()
    }
}
