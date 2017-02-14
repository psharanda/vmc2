//
//  Created by Pavel Sharanda on 17.11.16.
//  Copyright © 2016 psharanda. All rights reserved.
//

import Foundation

protocol TextLoaderProtocol {
    func loadText(completion: @escaping (String)->Void)
}

protocol TextLoaderContainer {
    func makeTextLoader() -> TextLoaderProtocol
}


