//
//  DeviceListViewModel.swift
//  IoT App
//
//  Created by Vlad on 08.11.2023.
//

import Foundation
import UIKit

protocol DeviceListViewModelProtocol {
	func setupProducts() -> [DeviceItem]
}

final class DeviceListViewModel: DeviceListViewModelProtocol {
	
	private var networkManager: NetworkManagerProtocol
	
	init(networkManager: NetworkManagerProtocol) {
		self.networkManager = networkManager
	}
	
	private func getDeviceListData() -> DeviceListModel? {
		networkManager.fetchDeviceData()
	}
	
	func setupProducts() -> [DeviceItem] {
		var deviceItems: [DeviceItem] = []
		self.getDeviceListData()?.data.forEach({ deviceData in
			let df = DateFormatter()
			df.dateFormat = "yyyy-MM-dd"
			let lastWork = df.string(from: Date(timeIntervalSince1970: TimeInterval(deviceData.lastWorkTime)))
			
			var icon: UIImage?
			switch deviceData.icon {
			case "/img/test/1.svg":
				icon = UIImage(named: "imgtest1")
			case "/img/test/2.svg":
				icon = UIImage(named: "imgtest2")
			default:
				print("unknown")
			}
			deviceItems.append(DeviceItem(id: deviceData.id, name: deviceData.name, icon: icon, isOnline: deviceData.isOnline, type: deviceData.type, status: deviceData.status, lastWorkTime: lastWork))
		})
		return deviceItems
	}
}
