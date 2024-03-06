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


## - Push View Controller
Navigation in UIKit uses a stack system which contains UIViewController(s). It means that we can do stack operation like push and pop. To show a new UIViewController, one way we can do is to push a new UIViewController into the stack. 

Steps to push a new UIViewController into the navigation stack:
1. In this case, I will make a function to push the viewController. So create a new function first. 
```swift
    func didTapButton() { //1
    }
``` 

2. Create a new instace of the destination view controller. This can be any viewController you want. If you don't have one, create a new class of UIViewController. Here I'm using SecondVC as my destination view controller.
```swift
    func didTapButton() { //1
        let destination = SecondVC() //2
    }
``` 

3. Push your destination view controller into the stack. Important note: You need your current view controller to be a child of UINavigationController. Follow the previous section if you haven't do so. Here you have options to do the push operation with animation or not by changing the value of `animated` parameter.
```swift
    func didTapButton() { //1
        let destination = SecondVC() //2
        self.navigationController?.pushViewController(destination, animated: true) //3
    }
```

4. [Optional] Assign the function into a button. I won't go deep to the detail, but you have to add `@objc` wrapper before the func keyword and then add the function as the `action` paramater in `addTarget()` function and `.touchUpInside` for the event to run the function on button tap.
```swift
    lazy var button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Push VC", for: .normal)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
        return button
    }()

    @objc func didTapButton() { //1
        let destination = SecondVC() //2
        self.navigationController?.pushViewController(destination, animated: true) //3
    }
```

Additional Notes:
1. The newly pushed view controller will become the `topViewController` of the navigation stack
2. You can push a `same CLASS or TYPE` of view controller into the stack, but it has to be a `different INSTANCE or OBJECT` from the previous view controller. If you push an object of view controller that already exist in the stack, it will raise an exception. For example:
    
    This works:
    ```swift
    class FirstVC {
        func didTapButton() {
            let destination = FirstVC() //Push the same view controller class, but different object into the stack. 
            self.navigationController?.pushViewController(destination, animated: true)
        }
    }
    ```
    But this will raise an exception:
    ```swift
    class FirstVC {
        func didTapButton() {
            let destination = self //Push the same view controller class and object into the stack, assuming that object of this FirstVC is already exist in the stack
            self.navigationController?.pushViewController(destination, animated: true)
        }
    }
    ```
    
Reference:
https://developer.apple.com/documentation/uikit/uinavigationcontroller/1621887-pushviewcontroller


## - Pop View Controller
Just like pop operation, pop view controller in navigation will remove viewController(s) from the navigation stack. There are 3 types of popViewController operation in UIKit:

1. Standard popViewController
```swift
func popViewController(animated: Bool)
```
Remove the `topViewController` of the navigationController.

2. Pop to rootViewController
```swift
func popToRootViewController(animated: Bool)
```
Remove all the viewController(s) in the stack, EXCEPT the `rootViewController` a.k.a the first viewController added to the stack.

3. Pop to a specific viewController
```swift
func popToViewController(_: UIViewController, animated: Bool)
```
Remove all viewController(s) until the specified `viewController` becomes the `topViewController` of the navigationController.
IMPORTANT: You need to have the reference to the specific viewController to use this function, cannot use a new instance of the viewController even if it is the same type. Can see the example in `SecondVC.swift`
