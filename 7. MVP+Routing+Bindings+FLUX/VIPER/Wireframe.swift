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
        
        let view = context.makeMainView()
        let presenter = MainPresenter(textLoader: context.makeTextLoader(), view: view)
        view.presenter = presenter
        
        navigationView = context.makeNavigationView()
        navigationView.views = [view]
        
        window.rootView = navigationView
        
        window.install()
        
        presenter.showDetails.subscribe {[unowned self, unowned presenter] in
            let vc = context.makeDetailsView(text: presenter.view.state.text ?? "WTF?")
            self.navigationView.pushView(view: vc, animated: true)
        }
    }
}
