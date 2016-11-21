//
//  Created by Pavel Sharanda on 20.11.16.
//  Copyright © 2016 psharanda. All rights reserved.
//

import UIKit

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
    
    func makeMainModule() -> (MainPresenter, MainViewProtocol) {
        let view = TestMainView()
        let presenter = MainPresenter(textLoader: makeTextLoader(), view: view)
        view.presenter = presenter
        return (presenter, view)
    }
    
    func makeNavigationView() -> NavigationView {
        return TestNavigationView()
    }
    
    func makeWindow() -> Window {
        return TestWindow()
    }
}

class TestTextLoader: TextLoaderProtocol {
    let text: String
    init(text: String) {
        self.text = text
    }
    func loadText(completion: @escaping (String) -> Void) {
        completion(text)
    }
}

class TestView {
    var presenter: Any?
}

class TestMainView: TestView, MainViewProtocol {
    var loading = Signal<Bool>()
    var text = Signal<String?>()
    var loadClick = Signal<Void>()
    var detailsClick = Signal<Void>()
    
    var viewController: UIViewController {
        fatalError()
    }
}

class TestNavigationView: NavigationView {
    func pushView(view: View, animated: Bool) {
        views.append(view)
    }
    
    func popView(view: View, animated: Bool) -> View {
        return views.removeLast()
    }
    
    var views: [View] = []
    
    var viewController: UIViewController {
        fatalError()
    }
}

class TestWindow: Window {
    var rootView: View?
    func install() {
        
    }
}
