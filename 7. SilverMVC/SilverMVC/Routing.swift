//
//  Created by Pavel Sharanda on 20.11.16.
//  Copyright © 2016 psharanda. All rights reserved.
//

import Foundation

protocol View: class {
    var presenter: AnyObject? {get set}
}

protocol NavigationView: View {
    func pushView(view: View, animated: Bool)
    func popView(view: View, animated: Bool) -> View?
    
    var views: [View] {get set}
}

protocol Window: class {
    var rootView: View? {get set}
    func install()
}

protocol NavigationControllerContainer {
    func makeNavigationView() -> NavigationView
}

protocol WindowContainer {
    func makeWindow() -> Window
}







