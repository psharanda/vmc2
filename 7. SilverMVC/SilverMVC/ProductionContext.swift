//
//  Created by Pavel Sharanda on 20.11.16.
//  Copyright © 2016 psharanda. All rights reserved.
//

import UIKit


class ProductionContext: AppContext {
    
    //example of internal singleton
    private static let textLoader = TextLoader()
    func makeTextLoader() -> TextLoaderProtocol {
        return ProductionContext.textLoader
    }
    
    func makeMainView() -> MainViewProtocol {
        return MainViewController()
    }

    func makeDetailsView(text: String) -> DetailsViewProtocol {
        return DetailsViewController(text: text)
    }

    func makeNavigationView() -> NavigationView {
        return UINavigationController()
    }
    
    func makeWindow() -> Window {
        return UIWindow(frame: UIScreen.main.bounds)
    }
}
