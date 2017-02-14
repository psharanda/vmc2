//
//  Created by Pavel Sharanda on 20.11.16.
//  Copyright © 2016 psharanda. All rights reserved.
//

import UIKit

typealias AppContext = TextLoaderContainer & MainViewControllerContainer & NavigationControllerContainer & WindowContainer


class ProductionContext: AppContext {
    
    //internal singleton
    private static let textLoader = TextLoader()
    
    func makeTextLoader() -> TextLoaderProtocol {
        return ProductionContext.textLoader
    }
    
    func makeMainView() -> MainViewControllerProtocol {
        return MainViewController()
    }

    func makeNavigationView() -> NavigationView {
        return UINavigationController()
    }
    
    func makeWindow() -> Window {
        return UIWindow(frame: UIScreen.main.bounds)
    }
}
