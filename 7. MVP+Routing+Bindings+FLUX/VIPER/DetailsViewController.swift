//
//  Created by Pavel Sharanda on 17.11.16.
//  Copyright © 2016 psharanda. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController, DetailsViewProtocol {
    
   
    private lazy var label = UILabel()
    
    private let text: String
    
    init(text: String) {
        self.text = text
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Details"
        
        view.backgroundColor = .white
        
        label.numberOfLines = 0
        label.text = text.uppercased()
        view.addSubview(label)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        
        label.frame = UIEdgeInsetsInsetRect(view.bounds, UIEdgeInsets(top: 80, left: 20, bottom: 80, right: 20))
        
    }
}

