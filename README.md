# v=mc2
Evolution of MVC on iOS with examples.

## Sample app
App is very simple. It has just one button and one label. If user clicks button, app displays loading indicator and after a second displays some text. Also it has simple push navigation.

## 1. MassiveVC
Massive View Controller is usual approach for most iOS apps, UIViewController does almost everything
## 2. ControllerVC
Attempt to apply clean MVP arhitecture where UIViewController is Presenter (Controller)
## 3. MVVM
This is how Microsoft tech can be adapted to iOS using some 'toy' reactive framework for bindings. UIViewController is View.
## 4. VIPER
Famous VIPER adopted to reality of our super complex app. Most interesting part is Routing. UIViewController is View.
## 5. MVP+Routing
If we rip off useless stuff from VIPER we get actually MVP adopted to iOS + elegant solution for navigation 
## 6. MVP+Routing+Bindings
VIPER and MVP+Routing are using delegate for interfaces, but here we use our 'toy' reactive framework to replace delegates with reactive interfaces. Kind of MVVM + VIPER + Rip Off useless things.
