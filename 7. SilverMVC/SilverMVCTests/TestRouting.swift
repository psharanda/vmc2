//
//  Created by Pavel Sharanda on 23.02.17.
//  Copyright © 2017 psharanda. All rights reserved.
//

import UIKit

class TestView {
    var presenter: AnyObject?
}

class TestNavigationView: TestView, NavigationView {
    func pushView(view: View, animated: Bool) {
        views.append(view)
    }
    
    func popView(view: View, animated: Bool) -> View? {
        return views.removeLast()
    }
    
    var views: [View] = []
    
    var viewController: UIViewController {
        fatalError()
    }
}

class TestWindow: Window {
    var rootView: View?
    func install() {
        
    }
}
