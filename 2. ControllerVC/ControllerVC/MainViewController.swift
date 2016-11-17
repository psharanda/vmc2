//
//  Created by Pavel Sharanda on 17.11.16.
//  Copyright © 2016 psharanda. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    let textLoader: TextLoaderProtocol
    let rootView: MainViewProtocol
    
    init(textLoader: TextLoaderProtocol, rootView: MainViewProtocol) {
        self.textLoader = textLoader
        self.rootView = rootView
        
        super.init(nibName: nil, bundle: nil)
        
        rootView.delegate = self
        
        title = "Controller VC"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Details", style: .plain, target: self, action: #selector(doneClicked))
        navigationItem.rightBarButtonItem?.isEnabled = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = rootView as? UIView
    }
    
    @objc private func doneClicked() {
        
        navigationController?.pushViewController(DetailsViewController(text: rootView.text, rootView: DetailsView()), animated: true)
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

