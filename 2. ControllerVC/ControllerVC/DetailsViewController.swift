//
//  Created by Pavel Sharanda on 17.11.16.
//  Copyright © 2016 psharanda. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    
    private let text: String?
    
    let rootView: DetailsViewProtocol
    
    init(text: String?, rootView: DetailsViewProtocol) {
        self.text = text
        self.rootView = rootView
        super.init(nibName: nil, bundle: nil)
        title = "Details"

        rootView.text = text
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = rootView as? UIView
    }

}

