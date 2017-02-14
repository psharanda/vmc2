//
//  Created by Pavel Sharanda on 17.11.16.
//  Copyright © 2016 psharanda. All rights reserved.
//

import Foundation

class Store {
    let mainViewState = Signal<MainViewState>()
    
    private let textLoader: TextLoaderProtocol
    
    init(textLoader: TextLoaderProtocol) {
        self.textLoader = textLoader
    }
    
    func reduce<T>(event: T, reducer: (MainViewState, T)->MainViewState) {
        mainViewState.update(reducer(mainViewState.lastValue ?? MainViewState(), event))
    }
    
    func main_reduce(oldViewState: MainViewState,  event: MainViewEvent) -> MainViewState {
        switch event {
        case .loadText:
            var state = oldViewState
            state.loading = true
            state.text = nil
            textLoader.loadText {
                self.reduce(event: $0, reducer: self.text_reduce)
            }
            return state
        case .showDetails:
            break
        }
        
        return oldViewState
    }
    
    func text_reduce(oldViewState: MainViewState,  event: String) -> MainViewState {
        var state = oldViewState
        state.text = event
        state.loading = false
        return state
    }
}




