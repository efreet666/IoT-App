//
//  NetworkManager.swift
//  Module 4
//
//  Created by Влад Бокин on 02.10.2022.
//

import Foundation

protocol NetworkManagerProtocol {
//    func fetchCategoryData() -> CategoriesModel
//    func fetchEventData() -> EventModel
}

final class NetworkManager: NetworkManagerProtocol {
    
    private let urlSessionClient = URLSessionClient()

    
     func fetchCategoryData() {
        
		
    }
    
    func fetchEventData() {
        
    }
}
