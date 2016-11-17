//
//  Created by Pavel Sharanda on 17.11.16.
//  Copyright © 2016 psharanda. All rights reserved.
//

import Foundation

class TextLoaderInteractor: TextLoaderInteractorProtocol {
    
    let textLoader = TextLoader()
    
    func loadText(completion: @escaping (String)->Void) {
        textLoader.loadText(completion: completion)
    }
}
