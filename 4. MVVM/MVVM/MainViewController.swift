//
//  Created by Pavel Sharanda on 17.11.16.
//  Copyright © 2016 psharanda. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    fileprivate lazy var button = UIButton(type: .system)
    fileprivate lazy var label = UILabel()
    fileprivate lazy var activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)
    
    let viewModel: MainViewModelProtocol
    
    init(viewModel: MainViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    @objc private func doneClicked() {
        viewModel.detailsClicked()
    }
    
    @objc private func buttonClicked() {
        viewModel.loadButtonClicked()
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
        button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        view.addSubview(button)
        
        label.numberOfLines = 0
        view.addSubview(label)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Details", style: .plain, target: self, action: #selector(doneClicked))
        navigationItem.rightBarButtonItem?.isEnabled = false
        
        loadingWasChanged(viewModel: viewModel)
        textWasChanged(viewModel: viewModel)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        activityIndicator.frame = view.bounds
        label.frame = UIEdgeInsetsInsetRect(view.bounds, UIEdgeInsets(top: 80, left: 20, bottom: 80, right: 20))
        button.frame = CGRect(x: 20, y: view.bounds.height - 60, width: view.bounds.width - 40, height: 40)
    }
    

}

extension MainViewController: MainViewModelDelegate {
    
    func loadingWasChanged(viewModel: MainViewModelProtocol) {
        if viewModel.loading {
            activityIndicator.startAnimating()
        } else {
            activityIndicator.stopAnimating()
        }
    }
    
    func textWasChanged(viewModel: MainViewModelProtocol) {
        label.text = viewModel.text
        navigationItem.rightBarButtonItem?.isEnabled = (viewModel.text != nil)
    }
}
