//
//  Created by Pavel Sharanda on 17.11.16.
//  Copyright © 2016 psharanda. All rights reserved.
//

import UIKit

class MainView: UIView, MainViewProtocol {
    private lazy var button = UIButton(type: .system)
    private lazy var label = UILabel()
    private lazy var activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)
    
    weak var delegate: MainViewDelegate?
    
    init() {
        super.init(frame: CGRect())
        backgroundColor = .white
        
        addSubview(activityIndicator)
        
        button.setTitle("Load", for: .normal)
        button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        addSubview(button)
        
        label.numberOfLines = 0
        addSubview(label)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var text: String? {
        set {
            label.text = newValue
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
    
    @objc private func buttonClicked() {
        delegate?.loadButtonClicked(view: self)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        activityIndicator.frame = bounds
        label.frame = UIEdgeInsetsInsetRect(bounds, UIEdgeInsets(top: 80, left: 20, bottom: 80, right: 20))
        button.frame = CGRect(x: 20, y: bounds.height - 60, width: bounds.width - 40, height: 40)
    }
}
