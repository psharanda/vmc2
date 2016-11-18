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
        
        let viewModel = MainViewModel(textLoader: TextLoader())
        let vc = MainViewController(viewModel: viewModel)
        
        navigationController = UINavigationController(rootViewController: vc)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
        viewModel.detailsClick.subscribe {[unowned self, unowned viewModel] in
            let vc = DetailsViewController(text: viewModel.text.lastValue ?? nil)
            self.navigationController.pushViewController(vc, animated: true)
        }
    }
}
