//
//  Created by Pavel Sharanda on 17.11.16.
//  Copyright © 2016 psharanda. All rights reserved.
//

import Foundation

protocol TextLoaderInteractorProtocol {
    func loadText(completion: @escaping (String)->Void)
}
