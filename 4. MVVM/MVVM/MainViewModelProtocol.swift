//
//  Created by Pavel Sharanda on 17.11.16.
//  Copyright © 2016 psharanda. All rights reserved.
//

import Foundation

protocol MainViewModelDelegate: class {
    func loadingWasChanged(viewModel: MainViewModelProtocol)
    func textWasChanged(viewModel: MainViewModelProtocol)
}

protocol MainViewModelRoutingDelegate: class {
    func showDetails(viewModel: MainViewModelProtocol)
}

protocol MainViewModelProtocol {
    var delegate: MainViewModelDelegate? {get set}
    var routingDelegate: MainViewModelRoutingDelegate? {get set}
    var loading: Bool {get}
    var text: String? {get}
    func loadButtonClicked()
    func detailsClicked()
}
