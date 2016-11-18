//
//  Created by Pavel Sharanda on 17.11.16.
//  Copyright © 2016 psharanda. All rights reserved.
//

import Foundation

class TextLoader: TextLoaderProtocol {
    func loadText(completion: @escaping (String)->Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
            completion("Cras mattis consectetur purus sit amet fermentum. Donec ullamcorper nulla non metus auctor fringilla. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Aenean lacinia bibendum nulla sed consectetur. Integer posuere erat a ante venenatis dapibus posuere velit aliquet. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum.")
        }
    }
}
