//
//  Created by Pavel Sharanda on 17.11.16.
//  Copyright © 2016 psharanda. All rights reserved.
//

import Foundation

class MainViewModel: MainViewModelProtocol {
    let loading = Signal<Bool>()
    let text = Signal<String?>()
    let loadClick = Signal<Void>()
    
    let textLoader: TextLoaderProtocol
    
    init(textLoader: TextLoaderProtocol) {
        
        self.textLoader = textLoader
        
        loadClick.subscribe {[unowned self] in
            self.loading.update(true)
            self.text.update(nil)
            self.textLoader.loadText {
                self.loading.update(false)
                self.text.update($0)
            }
        }
    }
}
