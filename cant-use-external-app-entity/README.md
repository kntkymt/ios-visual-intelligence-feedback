FB21555498

# Environment

Xcode Version 26.2 (17C52)

# Problem

The compiler can't find `OpenIntent` for the result `AppEntity` type of `IntentValueQuery.values(for:)` when the type is defined in an external module. resulted in compilation error.

in module `SampleAppIntents`

```swift
import AppIntents

public struct ItemEntity: AppEntity { ... }

public struct OpenItemIntent: OpenIntent {
    @Parameter(title: "Item")
    public var target: ItemEntity
    
    ...
}
```

in module `SampleAppVisualIntelligenceIntent`

```swift
import SampleAppIntents

// 🔴 error: IntentValueQuery 'SampleAppVisualIntelligenceIntent.VisualIntelligenceIntentValueQuery' with SemanticContentDescriptor input has a result type 'ItemEntity' that is not openable. 'AppEnum', 'AppEntity', or 'UnionValue' of enums and entities returned by visual search queries must be associated with an OpenIntent.
struct VisualIntelligenceIntentValueQuery: IntentValueQuery {
    func values(for input: SemanticContentDescriptor) async throws -> [ItemEntity] {
        ...
    }
}
```

# Background

There is a valid strategy separating modules: a regular intent package (`SampleAppIntents`) and a visual intelligence intent package (`SampleAppVisualIntelligenceIntent`).  This separation allows only the former to be shared across multiple app extensions (for example, the main app and its widget).

# Workaround

It's possible to pass compilation if I define another `OpenIntent` in module `SampleAppVisualIntelligenceIntent`. However, is it valid? I think `OpenIntent` should be unique for a single entity. (I got error message if I define multiple `OpenIntent` in a single module.)

```swift
import SampleAppIntents

struct VisualIntelligenceIntentValueQuery: IntentValueQuery {
    func values(for input: SemanticContentDescriptor) async throws -> [ItemEntity] {
        ...
    }
}

// define another OpenIntent for `ItemEntity`
public struct OpenItemIntent2: OpenIntent {
    public static let title: LocalizedStringResource = "Open Item Detail 2"

    public init(target: ItemEntity) {
        self.target = target
    }

    public init() {}

    @Parameter(title: "Item")
    public var target: ItemEntity
}
```
