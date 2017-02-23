//
//  DetailsViewControllerProtocol.swift
//  MVPBRF

import Foundation

protocol DetailsViewContainer {
    func makeDetailsView(text: String) -> DetailsViewProtocol
}

protocol DetailsViewProtocol: View {
    
}
