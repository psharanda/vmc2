//
//  Created by Pavel Sharanda on 17.11.16.
//  Copyright © 2016 psharanda. All rights reserved.
//

import UIKit

class Wireframe {
    
    let window: Window
    let navigationView: NavigationView
    
    let store: Store
    
    init(context: AppContext) {
        
        store = Store(textLoader: context.makeTextLoader())
        
        window = context.makeWindow()
        
        let view = context.makeMainView()
        
        navigationView = context.makeNavigationView()
        navigationView.views = [view]
        
        window.rootView = navigationView
        
        window.install()
        
        
        view.output = {
            self.store.reduce(event: $0, reducer: self.store.main_reduce)
        }
        
        self.store.mainViewState.subscribe {[weak view] in
            view?.state = $0
        }
    }
}
