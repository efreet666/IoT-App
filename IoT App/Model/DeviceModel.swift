//
//  DeviceModel.swift
//  IoT App
//
//  Created by Vlad on 08.11.2023.
//

import Foundation

// MARK: - DeviceListModel
struct DeviceListModel: Codable {
	let data: [DeviceModel]
}

// MARK: - Datum
struct DeviceModel: Codable {
	let id: Int
	let name: String
	let icon: String
	let isOnline: Bool
	let type: Int
	let status: String
	let lastWorkTime: Int
}


