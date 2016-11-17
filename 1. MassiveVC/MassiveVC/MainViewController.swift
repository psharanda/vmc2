//
//  Created by Pavel Sharanda on 17.11.16.
//  Copyright © 2016 psharanda. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
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
        navigationItem.rightBarButtonItem?.isEnabled = false
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        activityIndicator.frame = view.bounds
        label.frame = UIEdgeInsetsInsetRect(view.bounds, UIEdgeInsets(top: 80, left: 20, bottom: 80, right: 20))
        button.frame = CGRect(x: 20, y: view.bounds.height - 60, width: view.bounds.width - 40, height: 40)
    }
    
    @objc private func doneClicked() {
        navigationController?.pushViewController(DetailsViewController(text: label.text), animated: true)
    }
    
    @objc private func buttonClicked() {
        activityIndicator.startAnimating()
        label.text = nil
        navigationItem.rightBarButtonItem?.isEnabled = false
        
        loadText {
            self.activityIndicator.stopAnimating()
            self.label.text = $0
            self.navigationItem.rightBarButtonItem?.isEnabled =  true
        }
    }

    private func loadText(completion: @escaping (String)->Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
            completion("Cras mattis consectetur purus sit amet fermentum. Donec ullamcorper nulla non metus auctor fringilla. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Aenean lacinia bibendum nulla sed consectetur. Integer posuere erat a ante venenatis dapibus posuere velit aliquet. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum.")
        }
    }
}

