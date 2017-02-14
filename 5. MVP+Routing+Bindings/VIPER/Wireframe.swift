//
//  Created by Pavel Sharanda on 17.11.16.
//  Copyright © 2016 psharanda. All rights reserved.
//

import UIKit

class Wireframe {
    
    let window: Window
    let navigationView: NavigationView
    
    init(context: AppContext) {
        window = context.makeWindow()
        
        let (presenter, view) = context.makeMainModule()
        
        navigationView = context.makeNavigationView()
        navigationView.views = [view]
        
        window.rootView = navigationView
        
        window.install()
        
        presenter.showDetails.subscribe {[unowned self, unowned presenter] in
            let vc = DetailsViewController(text: presenter.view.text.lastValue ?? nil)
            self.navigationView.pushView(view: vc, animated: true)
        }
    }
}
