//
//  Created by Pavel Sharanda on 20.11.16.
//  Copyright © 2016 psharanda. All rights reserved.
//

import UIKit

protocol MainModuleContainer {
    func makeMainModule() -> (MainPresenter, MainViewProtocol)
}

