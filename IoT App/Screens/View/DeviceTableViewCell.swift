//
//  DeviceTableViewCell.swift
//  IoT App
//
//  Created by Vlad on 08.11.2023.
//


import UIKit
import SnapKit

final class DeviceTableViewCell: UITableViewCell {

	static let reuseIdentifier: String = "DeviceTableViewCell"
	
	private let gradientLayer: CAGradientLayer = {
		let layer = CAGradientLayer()
		layer.colors = [
		UIColor(red: 0.671, green: 0.413, blue: 1, alpha: 1).cgColor,
		UIColor(red: 0.286, green: 0.294, blue: 0.922, alpha: 1).cgColor
		]
		return layer
	}()
	
	private let titleLabel: UILabel = {
		let lb = UILabel()
		return lb
	}()
	
	private let countLabel: UILabel = {
		let lb = UILabel()
		lb.textAlignment = .right
		return lb
	}()
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		   super.init(style: style, reuseIdentifier: reuseIdentifier)
			setupLayout()
	   }
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	private func setupLayout() {
		gradientLayer.frame = self.contentView.frame
		
		
	}
	
	func setup(with model: DeviceItem) {
		titleLabel.text = model.name
	}
}
