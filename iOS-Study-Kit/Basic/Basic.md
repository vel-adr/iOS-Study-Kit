# Basic

## - How to setup UIKit Programmatically

1. Delete `Main.storyboard` file
2. In `Info.plist` remove these keys:
2.1 `Main storyboard file base name`
2.2 Go to the Application Scene Manifest > Scene Configuration > Window Application Session Role > Item 0. Remove the key named `Storyboard Name`
3. In `SceneDelegate.swift`, change `func scene(_ scene:willConnectTo:options:)` body into these code:

```swift
func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    guard let windowScene = (scene as? UIWindowScene) else { return }
            
    let window = UIWindow(windowScene: windowScene)
    window.rootViewController = ViewController() //Change with any root viewController you want
    window.makeKeyAndVisible()
    self.window = window
}
```

