//
//  Created by Pavel Sharanda on 20.11.16.
//  Copyright © 2016 psharanda. All rights reserved.
//

import UIKit

protocol View: class {
    var viewController: UIViewController {get}
}



protocol NavigationView: View {
    func pushView(view: View, animated: Bool)
    func popView(view: View, animated: Bool) -> View
    
    var views: [View] {get set}
}

protocol NavigationControllerContainer {
    func makeNavigationView() -> NavigationView
}

extension NavigationView where Self: UINavigationController {
    
    func pushView(view: View, animated: Bool) {
        pushViewController(view.viewController, animated: animated)
    }
    
    func popView(view: View, animated: Bool) -> View {
        return popViewController(animated: animated) as! View
    }
    
    var views: [View] {
        set {
            viewControllers = newValue.map { $0.viewController }
        }
        get {
            return viewControllers
        }
    }
}

extension UINavigationController: NavigationView {
}

protocol Window {
    var rootView: View? {get set}
    func install()
}

protocol WindowContainer {
    func makeWindow() -> Window
}

extension Window where Self: UIWindow {
    
    var rootView: View? {
        set {
            rootViewController = newValue?.viewController
        }
        get {
            return rootViewController
        }
    }
    
    func install() {
        makeKeyAndVisible()
    }
}

extension UIWindow: Window {
    
}

extension UIViewController: View {
    var viewController: UIViewController {
        return self
    }
}



