//
//  URLSessionClient.swift
//  Module 4
//
//  Created by Влад Бокин on 02.10.2022.
//

import Foundation

final class URLSessionClient {
    
    private let networkingURLManager = NetworkingURLManager()
    
    func fetchDeviceData() -> DeviceListModel? {
        
        var deviceModel: DeviceListModel?
        
        let semaphore: DispatchSemaphore = DispatchSemaphore(value: 0)
        let categoryRequest = Request(title: "")
        
		URLSessionManager().send(categoryRequest, URL: networkingURLManager.stringToURL(urlString: URLString.DevicesURL.rawValue)!) { (result: Result<DeviceListModel, APIError>) -> Void in
            switch result {
            case .success(let data):
                print(data)
				deviceModel = data
            case .failure(let error):
                print(error)
            }
            semaphore.signal()
        }
        semaphore.wait()
        
        return deviceModel
    }

}
