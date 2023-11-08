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
	let name: Name
	let icon: Icon
	let isOnline: Bool
	let type: Int
	let status: String
	let lastWorkTime: Int
}

enum Icon: String, Codable {
	case imgTest1SVG = "/img/test/1.svg"
	case imgTest2SVG = "/img/test/2.svg"
}

enum Name: String, Codable {
	case датчикГаза = "Датчик газа"
	case роботПылесос = "Робот - пылесос"
}
