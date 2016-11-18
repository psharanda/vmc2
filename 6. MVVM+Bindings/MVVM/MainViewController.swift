//
//  Created by Pavel Sharanda on 17.11.16.
//  Copyright © 2016 psharanda. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    private lazy var button = UIButton(type: .system)
    private lazy var label = UILabel()
    private lazy var activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)
    
    let viewModel: MainViewModelProtocol
    
    init(viewModel: MainViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        
        //FRP: self.viewModel.text.bind(label.xx_text)
        //FRP: self.viewModel.text.isNil.not.bind(navigationItem.rightBarButtonItem.xx_isEnabled)
        self.viewModel.text.subscribe {[weak self] in
            self?.label.text = $0
            self?.navigationItem.rightBarButtonItem?.isEnabled = ($0 != nil)
        }
        
        //FRP: self.viewModel.loading.bind(activityIndicator.xx_animating)
        self.viewModel.loading.subscribe {[weak self] in
            if $0 {
                self?.activityIndicator.startAnimating()
            } else {
                self?.activityIndicator.stopAnimating()
            }
        }
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "MVVM"
        
        view.backgroundColor = .white
        
        view.addSubview(activityIndicator)
        
        button.setTitle("Load", for: .normal)
        
        //FRP: button.xx_click.bind(viewModel.loadClick)
        button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        
        view.addSubview(button)
        
        label.numberOfLines = 0
        view.addSubview(label)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Details", style: .plain, target: self, action: #selector(detailsClicked))
        navigationItem.rightBarButtonItem?.isEnabled = false
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        activityIndicator.frame = view.bounds
        label.frame = UIEdgeInsetsInsetRect(view.bounds, UIEdgeInsets(top: 80, left: 20, bottom: 80, right: 20))
        button.frame = CGRect(x: 20, y: view.bounds.height - 60, width: view.bounds.width - 40, height: 40)
    }
    
    @objc private func detailsClicked() {
        viewModel.detailsClick.update()
    }
    
    @objc private func buttonClicked() {
        viewModel.loadClick.update()
    }
}

