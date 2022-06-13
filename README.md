# NavigationInSwiftUI

A project that shows how navigation can be implemented in SwiftUI.

The app is developed with:
* Swift 5.6
* Xcode 13.2.1
* iOS Deployment Target: iOS 15.2

## How to run the project
Clone the repository and open it with Xcode. No further setup is needed.

## Architecture
MVVM + Coordinators (by using [FlowStacks](https://github.com/johnpatrickmorgan/FlowStacks) library)

## Implemented bonus requirements
* Tests of the code - I've tested two classes: `OnboardingRoutesProvider` and `CredentialsViewModel`. The rest of the code can be tested similarly. I haven't implemented automated UI tests or snapshot tests.
* macOS support (cross-platform app)
* Validation of email 
* Viewing of telephone, email and name when login 
* Have better UI than most ugly possible - It's not beautiful, but I hope it's not off-puting 😄 . Dark mode is supported.

## Screenshot
![screenshot1](images/example.png)