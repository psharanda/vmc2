//
//  Created by Pavel Sharanda on 17.11.16.
//  Copyright © 2016 psharanda. All rights reserved.
//

import Foundation

protocol MainViewModelProtocol {
    var loading: Signal<Bool> {get}
    var text: Signal<String?> {get}
    var loadClick: Signal<Void> {get}
}
