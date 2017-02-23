//
//  Created by Pavel Sharanda on 23.02.17.
//  Copyright © 2017 psharanda. All rights reserved.
//

import UIKit

extension UINavigationController: NavigationView {}

extension NavigationView where Self: UINavigationController {
    
    func pushView(view: View, animated: Bool) {
        pushViewController(view as! UIViewController, animated: animated)
    }
    
    func popView(view: View, animated: Bool) -> View? {
        return popViewController(animated: animated)
    }
    
    var views: [View] {
        set {
            viewControllers = newValue.map { $0 as! UIViewController }
        }
        get {
            return viewControllers
        }
    }
}


extension UIWindow: Window {}

extension Window where Self: UIWindow {
    
    var rootView: View? {
        set {
            rootViewController = newValue as! UIViewController?
        }
        get {
            return rootViewController
        }
    }
    
    func install() {
        makeKeyAndVisible()
    }
}

private var presenterKey: Int = 0

extension UIViewController: View {
    
    var presenter: AnyObject? {
        get {
            return objc_getAssociatedObject(self, &presenterKey) as AnyObject
        }
        
        set {
            objc_setAssociatedObject(self, &presenterKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}
