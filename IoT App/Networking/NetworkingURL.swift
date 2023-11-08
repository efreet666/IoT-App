//
//  Networking.swift
//  Module 4
//
//  Created by Влад Бокин on 20.09.2022.
//

import Foundation

final class NetworkingURLManager {
    
    func stringToURL(urlString: String) -> URL? {
        let url: URL = URL(string: urlString)!
            return url
    }
}

enum URLString: String {
    
    case DevicesURL = "https://api.fasthome.io/api/v1/test/devices"
    
    
}




