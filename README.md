# Gemini-Swift

A Swift Package providing a Swift interface for the [Gemini API](https://ai.google.dev/api).

## Who should use this Package

Google provides the `FirebaseAI` product in <https://github.com/firebase/firebase-ios-sdk>.
Similarly to this repo, `FirebaseAI` provides a Swift interface for many of the Gemini capabilities. Unlike this repo, `FirebaseAI` is officially maintained.

If you already use Firebase in your project, use Vertex AI, or aren't sure which dependency to use: you should likely use the Firebase SDK.

The package in this repo is designed to provide a low-level interface for the Gemini API.
This package is well suited if you would like to interact more directly with the Gemini API, including from non-Darwin platforms.

## Stability

Currently, this project does not provide Swift types mirroring all features/ capabilities of the Gemini API. For this reason, this repo does not yet have tagged releases.
If you're adding this repo as a dependency, I suggest using the `revision` dependency mode in Swift Package Manager or the "commit" dependency Rule in an Xcode project.
For example:

```swift
    dependencies: [
        .package(url: "https://github.com/leptos-null/Gemini-Swift", revision: "bc689418acad746af6f2e24e6bef640e411d9bd7")
    ]
```

While I make an effort to not make API breaking changes in the `main` branch, this is not guaranteed.
