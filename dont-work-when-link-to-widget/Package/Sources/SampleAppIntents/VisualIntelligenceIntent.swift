#if canImport(VisualIntelligence)
import AppIntents
import UIKit
import CoreVideo
import VisualIntelligence

@available(iOS 26.0, *)
@AppIntent(schema: .visualIntelligence.semanticContentSearch)
struct VisualIntelligenceIntent {
    static let title: LocalizedStringResource = "Items Image Search"

    var semanticContent: SemanticContentDescriptor

    func perform() async throws -> some IntentResult {
        return .result()
    }
}

@available(iOS 26.0, *)
struct VisualIntelligenceIntentValueQuery: IntentValueQuery {
    func values(for input: SemanticContentDescriptor) async throws -> [ItemEntity] {
        return (0..<100).map {
            ItemEntity(item: Item(id: $0))
        }
    }
}

#endif
