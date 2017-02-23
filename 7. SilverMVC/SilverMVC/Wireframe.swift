//
//  Created by Pavel Sharanda on 17.11.16.
//  Copyright © 2016 psharanda. All rights reserved.
//

import Foundation

typealias AppContext = TextLoaderContainer & MainViewContainer & NavigationControllerContainer & WindowContainer & DetailsViewContainer

class Wireframe {
    
    let window: Window
    let navigationView: NavigationView
    let context: AppContext
    
    init(context: AppContext) {
        self.context = context
        
        window = context.makeWindow()
        
        navigationView = context.makeNavigationView()
        navigationView.views = [setupMainView()]
        
        window.rootView = navigationView
        window.install()            
    }
    
    func setupMainView() -> MainViewProtocol {
        let view = context.makeMainView()
        let presenter = MainPresenter(textLoader: context.makeTextLoader(), view: view)
        view.presenter = presenter
        
        presenter.showDetails.subscribe {[unowned self, unowned presenter] in
            let vc = self.context.makeDetailsView(text: presenter.view.state.text ?? "WTF?")
            self.navigationView.pushView(view: vc, animated: true)
        }
        
        return view
    }
}
