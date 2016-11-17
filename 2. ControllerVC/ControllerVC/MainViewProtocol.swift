//
//  Created by Pavel Sharanda on 17.11.16.
//  Copyright © 2016 psharanda. All rights reserved.
//

import UIKit

protocol MainViewProtocol: class {
    var delegate: MainViewDelegate? {get set}
    var loading: Bool {get set}
    var text: String? {get set}
}

protocol MainViewDelegate: class {
    func loadButtonClicked(view: MainViewProtocol)
}
