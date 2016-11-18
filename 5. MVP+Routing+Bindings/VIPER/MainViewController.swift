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
    
    
    let loading = Signal<Bool>()
    let text = Signal<String?>()
    let loadClick = Signal<Void>()
    let detailsClick = Signal<Void>()
    
    init() {
        
        super.init(nibName: nil, bundle: nil)
        
        //FRP: text.bind(label.xx_text)
        //FRP: text.isNil.not.bind(navigationItem.rightBarButtonItem.xx_isEnabled)
        text.subscribe {[weak self] in
            self?.label.text = $0
            self?.navigationItem.rightBarButtonItem?.isEnabled = ($0 != nil)
        }
        
        //FRP: loading.bind(activityIndicator.xx_animating)
        loading.subscribe {[weak self] in
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
        
        title = "MVP+Routing+Bindings"
        
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
        detailsClick.update()
    }
    
    @objc private func buttonClicked() {
        loadClick.update()
    }
}

