//
//  Created by Pavel Sharanda on 17.11.16.
//  Copyright © 2016 psharanda. All rights reserved.
//

import Foundation

class MainViewModel: MainViewModelProtocol {
    
    weak var delegate: MainViewModelDelegate?
    weak var routingDelegate: MainViewModelRoutingDelegate?
    
    var loading: Bool = false {
        didSet {
            delegate?.loadingWasChanged(viewModel: self)
        }
    }
    
    var text: String? {
        didSet {
            delegate?.textWasChanged(viewModel: self)
        }
    }
    
    let textLoader: TextLoaderProtocol
    
    init(textLoader: TextLoaderProtocol) {
        self.textLoader = textLoader
    }
    
    func loadButtonClicked() {
        loading = true
        text = nil
        self.textLoader.loadText {
            self.loading = false
            self.text = $0
        }
    }
    
    func detailsClicked() {
        routingDelegate?.showDetails(viewModel: self)
    }
}
