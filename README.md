<p align="center">
  <img
    width="300px"
    src="https://user-images.githubusercontent.com/9600228/102414461-e3b92b00-3ff6-11eb-9c96-5f37c4d5e02c.png#gh-light-mode-only"
    alt="Vitamin Decathlon Design System logo" />
  <img
    width="300px"
    src="https://user-images.githubusercontent.com/9600228/147513091-66fcc204-279b-4140-9be5-c16744c0f637.png#gh-dark-mode-only"
    alt="Vitamin Decathlon Design System logo" />
</p>

<h1 align="center">Vitamin iOS</h1>

<p align="center">Decathlon Design System libraries for iOS & iPadOS applications</p>

<p align="center">
  <a href="https://www.decathlon.design">Website</a>
</p>

<p align="center">
  <a aria-label="contributors graph" href="https://github.com/Decathlon/vitamin-ios/graphs/contributors">
    <img src="https://img.shields.io/github/contributors/Decathlon/vitamin-ios.svg">
  </a>
  <a aria-label="last commit" href="https://github.com/Decathlon/vitamin-ios/commits">
    <img alt="" src="https://img.shields.io/github/last-commit/Decathlon/vitamin-ios.svg">
  </a>
  <a aria-label="license" href="https://github.com/Decathlon/vitamin-ios/blob/main/LICENSE">
    <img src="https://img.shields.io/github/license/Decathlon/vitamin-ios.svg" alt="">
  </a>
  <a aria-label="Quality Gate Status" href="https://sonarcloud.io/dashboard?id=Decathlon_vitamin-ios">
    <img src="https://sonarcloud.io/api/project_badges/measure?project=Decathlon_vitamin-ios&metric=alert_status" alt="" />
  </a>
  <a aria-label="Bitrise Build Status" href="https://app.bitrise.io/app/c0b012b2a9e1cb6e">
    <img src="https://app.bitrise.io/app/c0b012b2a9e1cb6e/status.svg?token=y1VZkNa676yImmtWrEHVLw&branch=main" alt="" />
  </a>
  <a aria-label="slack" href="https://join.slack.com/t/decathlon-design/shared_invite/zt-13kxb50ar-iHzqV~Olsu4~NCkEPj5c4g">
    <img src="https://img.shields.io/badge/slack-Decathlon%20Design%20System-purple.svg?logo=slack" alt="">
  </a>
</p>

## Introduction

[Decathlon Design System](https://decathlon.design) is the framework that helps our ecosystem to design and develop consistent and quality experiences.  
For its [Digital section](https://www.decathlon.design/726f8c765/p/6145b2-overview), it is called Vitamin.

## Install

### SPM

```swift
dependencies: [
    .package(url: "https://github.com/Decathlon/vitamin-ios.git", .exact("0.8.0"))
]
```

### Cocoapods
```ruby
# for UIKitVersion
pod 'Vitamin', '= 0.8.0'

# for SwiftUI version
pod 'VitaminSwiftUI', = '0.8.0'
```

## Available elements

This library provides two types of elements: Foundations and Components.  
Foundations are core bricks of Vitamin Design System, and Components are high level elements, built upon Foundations.

### Foundations
The following foundations are available :
| Element | Description | Documentation |
|---------|-------------|---------------|
|Assets   | Set of graphic assets usable in the Design System. | [UIKit](./Sources/VitaminUIKit/Foundations/Assets#readme) [SwiftUI](./Sources/VitaminSwiftUI/Foundations/Assets#readme)|
|Colors   | Semantics and base colors of the Design System. | [UIKit](./Sources/VitaminUIKit/Foundations/Colors#readme) [SwiftUI](./Sources/VitaminSwiftUI/Foundations/Colors#readme)|
|Icons   | Set of icons usable in the Design System. | [UIKit](./Sources/VitaminUIKit/Foundations/Icons#readme) [SwiftUI](./Sources/VitaminSwiftUI/Foundations/Icons#readme)|
|Radiuses   | Radiuses applicable to any view in the Design System. | [UIKit](./Sources/VitaminUIKit/Foundations/Radiuses#readme) [SwiftUI](./Sources/VitaminSwiftUI/Foundations/Radiuses#readme)|
|Shadows   | Shadows applicable to any view in the Design System. | [UIKit](./Sources/VitaminUIKit/Foundations/Shadows#readme) [SwiftUI](./Sources/VitaminSwiftUI/Foundations/Shadows#readme)|
|Typography | Text styles usable in the Design System. | [UIKit](./Sources/VitaminUIKit/Foundations/Typography#readme) [SwiftUI](./Sources/VitaminSwiftUI/Foundations/Typography#readme)|


### Components
The following components are available :
| Component | Description | Documentation |
|-----------|-------------|---------------|
|Badge | Badges from the Vitamin Design System. | [UIKit](./Sources/VitaminUIKit/Components/Badge#readme)|
|Button | Different button styles from the Vitamin Design System. | [UIKit](./Sources/VitaminUIKit/Components/Button#readme) [SwiftUI](./Sources/VitaminSwiftUI/Components/Button#readme)|
|Progressbar | Different progressbar styles from the Vitamin Design System. | [UIKit](./Sources/VitaminUIKit/Components/Progressbar#readme)|
|Switch | Swicth from the Vitamin Design System. | [UIKit](./Sources/VitaminUIKit/Components/Switch#readme)|
|Tag | Tag from the Vitamin Design System. | [UIKit](./Sources/VitaminUIKit/Components/Tag#readme)|
|TextField | Different text fields styles from the Vitamin Design System. | [UIKit](./Sources/VitaminUIKit/Components/TextField#readme)|

## Special thanks

Thank you to the [contributors](CONTRIBUTORS.md) involved in these vitamin-ios libraries _(even before they were Open Source)_. 💙

<a href="https://github.com/decathlon/vitamin-ios/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=decathlon/vitamin-ios" />
</a>

Thank you also [Remix Icon](https://remixicon.com) because Vitamix Icons is the official Decathlon icon library based on their [open-source icon library](https://github.com/Remix-Design/RemixIcon) (Remix Design © 2020). This original library is under the license Apache 2.0 and has been modified by Decathlon. [Learn more](https://www.decathlon.design/726f8c765/p/58575f-vitamix-license).

## License

    Copyright 2021 Decathlon.

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
