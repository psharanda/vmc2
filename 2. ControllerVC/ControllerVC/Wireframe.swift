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
        
        let view = MainView()
        let vc = MainViewController(textLoader: TextLoader(), rootView: view)
        
        view.delegate = vc
        
        navigationController = UINavigationController(rootViewController: vc)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
        vc.routingDelegate = self
    }
}

extension Wireframe: MainViewControllerRoutingDelegate {
    
    func showDetails(viewController: MainViewController) {
        let vc = DetailsViewController(text: viewController.rootView.text)
        navigationController.pushViewController(vc, animated: true)
    }
    
}
