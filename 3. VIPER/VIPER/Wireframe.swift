//
//  Created by Pavel Sharanda on 17.11.16.
//  Copyright © 2016 psharanda. All rights reserved.
//

import UIKit

class Wireframe {
    
    let window: UIWindow
    let navigationController: UINavigationController
    init() {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let vc = MainViewController()
        
        let presenter = MainPresenter(textLoader: TextLoader(), view: vc)
        
        vc.presenter = presenter
        
        navigationController = UINavigationController(rootViewController: vc)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
        presenter.routingDelegate = self
    }
}

extension Wireframe: MainPresenterRoutingDelegate {
    func showDetails(presenter: MainPresenter) {
        let vc = DetailsViewController(text: presenter.view.text)
        navigationController.pushViewController(vc, animated: true)
    }
}
