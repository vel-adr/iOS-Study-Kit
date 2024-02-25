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

## - Properties / Variable Declaration

#### Type of property/variable declarations:
##### 1. Basic stored property
`let message = "Hello World"`

##### 2. Closure-based stored property
- Closure is executed immediately during the instantiation procees of the object
```swift
let label: UILabel = {
    let label = UILabel()
    label.text = "This is a label"
    return label
}()
```

##### 3. Lazy stored property
- Must be declared using `var` instead of `let`
- Will be instantiated when property is called. Great for property that require complex computation which don't need to be performed until it's needed
```swift
class ComplexClass {
    //Just for demo purpose. Imagine this is a complex class to instantiate
}

//Basic lazy stored property declaration
lazy var complexClass = ComplexClass()
```

```swift
//Closure-based lazy stored property declaration
lazy var longString: String = {
    var string = ""
    for i in 0...1000 {
        string.append(String(i))
    }
    return string
}()
```

##### 4. Computed Property
- Must be declared using `var` instead of `let`
- Must have explicit type
- Return new instance every time variable is called

**There are two types of computed property:**
- Computed property with getter and setter
- Read-only computed property
 
```swift
struct Person {
    var name = "Bob"
    var sex = "M"
    var greeting = "Hello"
    
    //Computed property with getter and setter
    var greetingSentence: String {
        set(newGreeting) {
            greeting = newGreeting
        }
        get {
            return "\(greeting), \(name)"
        }
    }
    
    //Read-only computed property
    //Can't be modified
    var pronoun: String {
        return sex == "F" ? "She" : sex == "M" ? "He" : "Unknown"
    }
}
```

Reference:
- https://www.avanderlee.com/swift/lazy-var-property/
- https://docs.swift.org/swift-book/documentation/the-swift-programming-language/properties/#
- https://stackoverflow.com/questions/28792014/property-with-return-or-return
- https://stackoverflow.com/questions/59381521/how-to-change-the-text-attribute-of-a-uilabel-in-swift
- https://stackoverflow.com/questions/39635681/what-is-the-difference-between-the-following-3-declarations


## - Setup views with AutoLayout

#### Steps:
1. Set `translatesAutoresizingMaskIntoConstraints` property of the view to `false`
```swift
lazy var label: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false //This one
    label.text = "Hello World"
    
    return label
}()
```

2. Add the view to the superview 
```swift
view.addSubview(label)
```

3. Setup constraint(s) of the view
```swift
NSLayoutConstraint.activate([
    label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
    label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
    //Insert other view's constraint(s) if any
])
```
