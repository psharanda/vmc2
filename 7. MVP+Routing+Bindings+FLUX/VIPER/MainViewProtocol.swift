//
//  Created by Pavel Sharanda on 17.11.16.
//  Copyright © 2016 psharanda. All rights reserved.
//

import Foundation

protocol MainViewContainer {
    func makeMainView() -> MainViewProtocol
}

struct MainViewState {
    var loading: Bool = false
    var text: String? = nil
}

protocol MainViewProtocol: View {
    
    var loadClick: Signal<Void> {get}
    var detailsClick: Signal<Void> {get}
    
    var state: MainViewState {get set}
}


