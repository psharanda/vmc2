//
//  Created by Pavel Sharanda on 17.11.16.
//  Copyright © 2016 psharanda. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, MainViewControllerProtocol {
    
    private lazy var button = UIButton(type: .system)
    private lazy var label = UILabel()
    private lazy var activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Massive VC"
        
        view.backgroundColor = .white
        
        view.addSubview(activityIndicator)
        
        button.setTitle("Load", for: .normal)
        button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        view.addSubview(button)
        
        label.numberOfLines = 0
        view.addSubview(label)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Details", style: .plain, target: self, action: #selector(doneClicked))
        
        render()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        activityIndicator.frame = view.bounds
        label.frame = UIEdgeInsetsInsetRect(view.bounds, UIEdgeInsets(top: 80, left: 20, bottom: 80, right: 20))
        button.frame = CGRect(x: 20, y: view.bounds.height - 60, width: view.bounds.width - 40, height: 40)
    }
    
    var state: MainViewState = MainViewState() {
        didSet {
           render()
        }
    }
    
    func render() {
        let hasText = state.text != nil
        label.text = state.text
        if state.loading {
            activityIndicator.startAnimating()
        } else {
            activityIndicator.stopAnimating()
        }
        self.navigationItem.rightBarButtonItem?.isEnabled = hasText && !state.loading
    }
    
    var output: ((MainViewEvent)->Void)?

    @objc private func doneClicked() {
        output?(.showDetails)
    }
    
    @objc private func buttonClicked() {
        output?(.loadText)
    }
}

