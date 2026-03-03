# Contributing

All types in this repo that mirror documentation on <https://ai.google.dev/api> must be placed in folder with a name appropriately matching the page on the aforementioned site.
For example, `BidiGenerateContentToolCall` is documented on <https://ai.google.dev/api/live#bidigeneratecontenttoolcall>, so the type representing `BidiGenerateContentToolCall` in this repo is located at `Sources/Gemini/Live/BidiGenerateContentToolCall.swift`.

All types in this repo must include a [DocC](<https://www.swift.org/documentation/docc>)-style documentation comment including (reasonably) the same contents as the documentation found on <https://ai.google.dev/api> for the type. When appropriate, the DocC comments should use double backticks to [link to symbols](<https://www.swift.org/documentation/docc/linking-to-symbols-and-other-content#Navigate-to-a-Symbol>) within the Package. The last line of the comment should include a link to the Google/ Gemini page where the type was documented. This allows contributors to more quickly validate type information, as well as allow consumers of this Package to more easily view the context in the original documentation.

For example, <https://ai.google.dev/api/live#sessionresumptionconfig> looks approximately like so:

> ### SessionResumptionConfig
>
> Session resumption configuration.
>
> This message is included in the session configuration as `BidiGenerateContentSetup.sessionResumption`. If configured, the server will send `SessionResumptionUpdate` messages.

The DocC comment in this repo representing this type looks like so:

```swift
/// Session resumption configuration.
///
/// This message is included in the session configuration as ``BidiGenerateContentSetup/sessionResumption``.
/// If configured, the server will send ``SessionResumptionUpdate`` messages.
///
/// <https://ai.google.dev/api/live#sessionresumptionconfig>
public struct SessionResumptionConfig: Codable, Sendable {
```

Including this documentation within the Package allows consumers of this Package to more easily understand how types and components fit together, especially if they have not previously read the Google/ Gemini documentation directly.

## Conformances

In general, all `struct` types, especially those conforming to `Codable`, should conform to `Sendable`. This is the default in Swift for `struct` types where possible - we want to add this conformance explicitly both to clarify to the compiler and to more easily resolve why when a type does not conform to `Sendable`.
Many of the types in this Package are used to interact with asynchronous API, so it is common that they will be sent across isolation contexts (i.e. requiring `Sendable`).

## Formatting

For consistency, all code in this repo should use the Xcode default formatting, which is:

- indent width = 4 spaces
- no trailing white-space unless the line is indentation-only (i.e. lines should not have extra tab or space characters at the end; "blank" lines should always have indentation such that adding a non-space character to the line would put that character at the expected indentation level)
