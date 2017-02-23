//
//  Created by Pavel Sharanda on 17.11.16.
//  Copyright © 2016 psharanda. All rights reserved.
//

import Foundation

class MainPresenter {
    
    var showDetails = Signal<Void>()
    
    let textLoader: TextLoaderProtocol
    unowned let view: MainViewProtocol
    
    init(textLoader: TextLoaderProtocol, view: MainViewProtocol) {
        self.textLoader = textLoader
        self.view = view
        
        view.detailsClick.subscribe {[unowned self] in
            self.showDetails.update()
        }
        
        view.loadClick.subscribe {[unowned self] in
            
            self.view.state = MainViewState(loading: true, text: nil)                        
            self.textLoader.loadText {
                self.view.state = MainViewState(loading: false, text: $0)
            }
        }
    }
}
