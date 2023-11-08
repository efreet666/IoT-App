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
	
	private let titleLabel: UILabel = {
		let lb = UILabel()
		lb.textColor = UIColor(red: 0.098, green: 0.129, blue: 0.173, alpha: 1)
		lb.font = UIFont(name: "Roboto-Regular", size: 24)
		lb.numberOfLines = 0
		return lb
	}()
	
	private let subtitleLabel: UILabel = {
		let lb = UILabel()
		lb.textColor = .white
		lb.font = UIFont(name: "Roboto-Regular", size: 24)
		lb.numberOfLines = 0
		return lb
	}()
	
	private let deviceImageView: UIImageView = {
		let iv = UIImageView()
		iv.contentMode = .scaleAspectFill
		return iv
	}()
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		   super.init(style: style, reuseIdentifier: reuseIdentifier)
		
		setupLayout()
	   }
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	private func setupLayout() {
		self.layer.cornerRadius = 15
		self.clipsToBounds = true
		
		let view = UIView()
		view.frame = CGRect(x: 0, y: 0, width: 400, height: 200)
		let layer0 = CAGradientLayer()
		layer0.colors = [
		UIColor(red: 0.671, green: 0.413, blue: 1, alpha: 1).cgColor,
		UIColor(red: 0.286, green: 0.294, blue: 0.922, alpha: 1).cgColor
		]
		layer0.locations = [0, 1]
		layer0.startPoint = CGPoint(x: 0.25, y: 0.5)
		layer0.endPoint = CGPoint(x: 0.75, y: 0.5)
		layer0.transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: 0, b: 1, c: -1, d: 0, tx: 1, ty: 0))
		layer0.bounds = view.bounds.insetBy(dx: -0.5*view.bounds.size.width, dy: -0.5*view.bounds.size.height)
		layer0.position = view.layer.position
		view.layer.addSublayer(layer0)
		addSubview(view)
		
		addSubview(titleLabel)
		addSubview(subtitleLabel)
		addSubview(deviceImageView)
		
		titleLabel.snp.makeConstraints { make in
			make.leading.equalToSuperview().inset(17)
			make.top.equalToSuperview().inset(44)
			make.height.equalTo(56)
			make.width.equalTo(170)
		}
		
		subtitleLabel.snp.makeConstraints { make in
			make.leading.equalToSuperview().inset(57)
			make.bottom.equalToSuperview().inset(18)
			make.height.equalTo(56)
			make.width.equalTo(170)
		}
		
		deviceImageView.snp.makeConstraints { make in
			make.trailing.equalToSuperview().inset(16)
			make.top.equalToSuperview().inset(16)
			make.height.equalTo(98)
			make.width.equalTo(98)
		}
	}
	
	
	func setup(with model: DeviceItem) {
		titleLabel.text = model.name
		subtitleLabel.text = model.status
		deviceImageView.image = model.icon ?? UIImage()
	}
}

extension UIImage {

	func imageResize (sizeChange:CGSize)-> UIImage{

		let hasAlpha = true
		let scale: CGFloat = 0.0 // Use scale factor of main screen

		UIGraphicsBeginImageContextWithOptions(sizeChange, !hasAlpha, scale)
		self.draw(in: CGRect(origin: CGPoint.zero, size: sizeChange))

		let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
		return scaledImage!
	}

}
