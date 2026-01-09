# Overview

This repository contains sample projects that reproduce issues I reported via Feedback Assistant.

# Issues

- [cant-use-external-app-entity](./cant-use-external-app-entity/): An issue that the compiler can't find `OpenIntent` for the result `AppEntity` type of `IntentValueQuery.values(for:)` when the type is defined in an external module. reuslted in compiler error.
- [dont-work-when-link-to-widget](./dont-work-when-link-to-widget): An issue where Visual Intelligence displays an error when an intent is linked to both an app and a widget and is executed while the app is terminated.