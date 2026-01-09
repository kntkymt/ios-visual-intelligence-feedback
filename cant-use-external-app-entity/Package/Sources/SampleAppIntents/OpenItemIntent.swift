import AppIntents

public struct OpenItemIntent: OpenIntent {
    public static let title: LocalizedStringResource = "Open Item Detail"

    public init(target: ItemEntity) {
        self.target = target
    }

    public init() {}

    @Parameter(title: "Item")
    public var target: ItemEntity

    public static var isDiscoverable: Bool {
        false
    }

    public func perform() async throws -> some IntentResult {
        return .result()
    }
}
