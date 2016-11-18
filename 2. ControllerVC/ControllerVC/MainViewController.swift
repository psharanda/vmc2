//
//  Created by Pavel Sharanda on 17.11.16.
//  Copyright © 2016 psharanda. All rights reserved.
//

import UIKit

protocol MainViewControllerRoutingDelegate: class {
    func showDetails(viewController: MainViewController)
}

class MainViewController: UIViewController {
    
    let textLoader: TextLoaderProtocol
    let rootView: MainViewProtocol
    
    weak var routingDelegate: MainViewControllerRoutingDelegate?
    
    init(textLoader: TextLoaderProtocol, rootView: MainViewProtocol) {
        self.textLoader = textLoader
        self.rootView = rootView
        
        super.init(nibName: nil, bundle: nil)
        
        title = "Controller VC"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Details", style: .plain, target: self, action: #selector(detailsClicked))
        navigationItem.rightBarButtonItem?.isEnabled = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = rootView as? UIView
    }
    
    @objc private func detailsClicked() {
        
        routingDelegate?.showDetails(viewController: self)
    }
}

extension MainViewController: MainViewDelegate {
    func loadButtonClicked(view: MainViewProtocol) {
        rootView.loading = true
        rootView.text = nil
        
        navigationItem.rightBarButtonItem?.isEnabled = false
        
        textLoader.loadText {
            self.rootView.loading = false
            self.rootView.text = $0
            self.navigationItem.rightBarButtonItem?.isEnabled =  true
        }
    }
}

