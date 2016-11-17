//
//  Created by Pavel Sharanda on 17.11.16.
//  Copyright © 2016 psharanda. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, MainViewControllerProtocol {
    
    var presenter: Any?
    
    private lazy var button = UIButton(type: .system)
    private lazy var label = UILabel()
    private lazy var activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)
    
    
    weak var delegate: MainViewControllerDelegate?
    
    
    
    var text: String? {
        set {
            label.text = newValue
            navigationItem.rightBarButtonItem?.isEnabled = (newValue != nil)
        }
        get {
            return label.text
        }
    }
    
    var loading: Bool {
        set {
            if newValue {
                activityIndicator.startAnimating()
            } else {
                activityIndicator.stopAnimating()
            }
        }
        
        get {
            return activityIndicator.isAnimating
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "MVP+Routing"
        
        view.backgroundColor = .white
        
        view.addSubview(activityIndicator)
        
        button.setTitle("Load", for: .normal)
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
        delegate?.detailsClicked(view: self)
    }
    
    @objc private func buttonClicked() {
        delegate?.loadButtonClicked(view: self)
    }
}

