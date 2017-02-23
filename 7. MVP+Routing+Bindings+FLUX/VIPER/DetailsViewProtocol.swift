//
//  DetailsViewControllerProtocol.swift
//  MVPBRF
//
//  Created by Pavel Sharanda on 23.02.17.
//  Copyright © 2017 psharanda. All rights reserved.
//

import Foundation

protocol DetailsViewContainer {
    func makeDetailsView(text: String) -> DetailsViewProtocol
}

protocol DetailsViewProtocol: View {
    
}
