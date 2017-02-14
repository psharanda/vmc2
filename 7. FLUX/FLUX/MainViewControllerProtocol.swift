//
//  Created by Pavel Sharanda on 17.11.16.
//  Copyright © 2016 psharanda. All rights reserved.
//

import Foundation

struct MainViewState {
    var text: String? = nil
    var loading: Bool = false
}

enum MainViewEvent {
    case loadText
    case showDetails
}

protocol MainViewControllerProtocol: View {
    var state: MainViewState {set get}
    var output: ((MainViewEvent)->Void)? {get set}
}


protocol MainViewControllerContainer {
    func makeMainView() -> MainViewControllerProtocol
}


