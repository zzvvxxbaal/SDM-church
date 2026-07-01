import SwiftUI

public protocol RouteType: Hashable, Codable {
    associatedtype Destination: View
    
    var id: UUID { get }
    var parameters: RouteParameter { get set }
    
    @ViewBuilder
    func destination() -> Destination
    
    func deepLinkPath() -> String
    func canHandle(deepLink: URL) -> Bool
}

public extension RouteType {
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.id == rhs.id && lhs.parameters.description == rhs.parameters.description
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(deepLinkPath())
    }
}

public struct AnyRoute: RouteType {
    public var id: UUID
    public var parameters: RouteParameter
    
    private let destinationBuilder: () -> AnyView
    private let pathBuilder: () -> String
    private let deepLinkChecker: (URL) -> Bool
    
    public init<R: RouteType>(
        route: R,
        destination: @escaping () -> R.Destination
    ) {
        self.id = route.id
        self.parameters = route.parameters
        self.destinationBuilder = { AnyView(destination()) }
        self.pathBuilder = { route.deepLinkPath() }
        self.deepLinkChecker = { route.canHandle(deepLink: $0) }
    }
    
    @ViewBuilder
    public func destination() -> some View {
        destinationBuilder()
    }
    
    public func deepLinkPath() -> String {
        pathBuilder()
    }
    
    public func canHandle(deepLink: URL) -> Bool {
        deepLinkChecker(deepLink)
    }
    
    public enum CodingKeys: CodingKey {
        case id
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(UUID.self, forKey: .id)
        self.parameters = .empty
        self.destinationBuilder = { AnyView(EmptyView()) }
        self.pathBuilder = { "" }
        self.deepLinkChecker = { _ in false }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
    }
}
