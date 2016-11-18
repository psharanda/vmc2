//
//  Created by Pavel Sharanda on 17.11.16.
//  Copyright © 2016 psharanda. All rights reserved.
//

import Foundation

protocol MainViewControllerDelegate: class {
    func loadButtonClicked(view: MainViewControllerProtocol)
    func detailsClicked(view: MainViewControllerProtocol)
}

protocol MainViewControllerProtocol: class {
    var delegate: MainViewControllerDelegate? {get set}
    var loading: Bool {get set}
    var text: String? {get set}
}


