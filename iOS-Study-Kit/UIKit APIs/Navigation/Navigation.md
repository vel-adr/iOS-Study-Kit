#  Navigation

## - Setup Navigation Controller for UIKit Programmatically
1. Go to `SceneDelegate.swift` and create a new object of `UINavigationController` inside `func scene(_ scene:willConnectTo:options:)`. Usually, a navigationController is set 
```swift
func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    guard let windowScene = (scene as? UIWindowScene) else { return }
    let window = UIWindow(windowScene: windowScene)
    
    let navigationVC = UINavigationController() //1
    
    window.rootViewController = ViewController()
    window.makeKeyAndVisible()
    self.window = window
}
```
2. Create any `ViewController` object that will be the rootViewController of the `UINavigationController`
```swift
func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    guard let windowScene = (scene as? UIWindowScene) else { return }
    let window = UIWindow(windowScene: windowScene)
    
    let navigationVC = UINavigationController() //1
    let firstVC = FirstVC() //2
    
    window.rootViewController = ViewController()
    window.makeKeyAndVisible()
    self.window = window
}
```
3. Set your newly created `ViewController` as the `viewControllers` property of your `UINavigationController`. Because `viewControllers` property's type is an array of ViewController (`[UIViewController]`), don't forget to put the viewController inside a square bracket.
```swift
func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    guard let windowScene = (scene as? UIWindowScene) else { return }
    let window = UIWindow(windowScene: windowScene)
    
    let navigationVC = UINavigationController() //1
    let firstVC = FirstVC() //2
    navigationVC.viewControllers = [firstVC] //3
    
    window.rootViewController = ViewController()
    window.makeKeyAndVisible()
    self.window = window
}
```
4. Change the `rootViewController` of the `window` to the `UINavigationController` object we have created before.
```swift
func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    guard let windowScene = (scene as? UIWindowScene) else { return }
    let window = UIWindow(windowScene: windowScene)
    
    let navigationVC = UINavigationController() //1
    let firstVC = FirstVC() //2
    navigationVC.viewControllers = [firstVC] //3
    
    window.rootViewController = navigationVC //4
    window.makeKeyAndVisible()
    self.window = window
}
```

Reference:
- https://stackoverflow.com/questions/28793331/creating-a-navigationcontroller-programmatically-swift
