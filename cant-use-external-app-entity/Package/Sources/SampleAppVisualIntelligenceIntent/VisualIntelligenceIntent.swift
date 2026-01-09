#if canImport(VisualIntelligence)
import AppIntents
import UIKit
import CoreVideo
import SampleAppIntents
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

// compiler can't find OpenIntent for ItemEntity, which is inside of `SampleAppIntents` module.
// 🔴 error: IntentValueQuery 'SampleAppVisualIntelligenceIntent.VisualIntelligenceIntentValueQuery' with SemanticContentDescriptor input has a result type 'ItemEntity' that is not openable. 'AppEnum', 'AppEntity', or 'UnionValue' of enums and entities returned by visual search queries must be associated with an OpenIntent.
@available(iOS 26.0, *)
struct VisualIntelligenceIntentValueQuery: IntentValueQuery {
    func values(for input: SemanticContentDescriptor) async throws -> [ItemEntity] {
        return (0..<100).map {
            ItemEntity(item: Item(id: $0))
        }
    }
}

#endif
