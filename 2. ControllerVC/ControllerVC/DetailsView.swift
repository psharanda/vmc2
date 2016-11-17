//
//  Created by Pavel Sharanda on 17.11.16.
//  Copyright © 2016 psharanda. All rights reserved.
//

import UIKit

class DetailsView: UIView, DetailsViewProtocol {
    
    private lazy var label = UILabel()
    
    init() {
        super.init(frame: CGRect())
        backgroundColor = .white
        
        label.numberOfLines = 0
        addSubview(label)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var text: String? {
        set {
            label.text = newValue?.uppercased()
        }
        get {
            return label.text
        }
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = UIEdgeInsetsInsetRect(bounds, UIEdgeInsets(top: 80, left: 20, bottom: 80, right: 20))
    }
}
