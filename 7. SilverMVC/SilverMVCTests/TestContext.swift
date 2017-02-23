//
//  Created by Pavel Sharanda on 20.11.16.
//  Copyright © 2016 psharanda. All rights reserved.
//

import UIKit

class TestTextLoader: TextLoaderProtocol {
    let text: String
    init(text: String) {
        self.text = text
    }
    func loadText(completion: @escaping (String) -> Void) {
        completion(text)
    }
}


class TestMainView: TestView, MainViewProtocol {
    
    var loadClick = Signal<Void>()
    var detailsClick = Signal<Void>()
    
    var state = MainViewState()
    
    var viewController: UIViewController {
        fatalError()
    }
}

class TestDetailsView: TestView, DetailsViewProtocol {
    
    let text: String
    
    init(text: String) {
        self.text = text
    }
    
    var viewController: UIViewController {
        fatalError()
    }
}

class TestContext: AppContext {
    
    struct Config {
        var text = "Hello"
    }
    let config: Config
    init(config: Config) {
        self.config = config
    }
    
    func makeTextLoader() -> TextLoaderProtocol {
        return TestTextLoader(text: config.text)
    }
    
    func makeMainView() -> MainViewProtocol {
        return TestMainView()
    }
    
    func makeNavigationView() -> NavigationView {
        return TestNavigationView()
    }
    
    func makeWindow() -> Window {
        return TestWindow()
    }
    
    func makeDetailsView(text: String) -> DetailsViewProtocol {
        return TestDetailsView(text: text)
    }
}
