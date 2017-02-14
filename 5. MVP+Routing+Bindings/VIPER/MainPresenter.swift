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
            self.view.loading.update(true)
            self.view.text.update(nil)
            self.textLoader.loadText {
                self.view.loading.update(false)
                self.view.text.update($0)
            }
        }
    }
}
