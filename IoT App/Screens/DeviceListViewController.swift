//
//  ViewController.swift
//  IoT App
//
//  Created by Vlad on 08.11.2023.
//

import UIKit
import SnapKit

final class DeviceListViewController: UIViewController {

	enum Section {
		case main
	}
	
	// MARK: - Views
	private let tableView = UITableView()
	private var dataSource: UITableViewDiffableDataSource<Section, DeviceItem>!
	private var viewModel: DeviceListViewModelProtocol
	
	private let DevicesTableView: UITableView = UITableView()
	
	init(viewModel: DeviceListViewModelProtocol) {
		self.viewModel = viewModel
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.view.backgroundColor = .white
//		viewModel.getDeviceListData()
		setupTableView()
	}

	private func setupTableView() {
		view.addSubview(tableView)
		tableView.snp.makeConstraints { make in
			make.edges.equalToSuperview()
		}
		
		tableView.register(DeviceTableViewCell.self, forCellReuseIdentifier: DeviceTableViewCell.reuseIdentifier)
		tableView.delegate = self
		
		dataSource = UITableViewDiffableDataSource<Section, DeviceItem>(tableView: tableView) { tableView, indexPath, item in
			guard let cell = tableView.dequeueReusableCell(withIdentifier: DeviceTableViewCell.reuseIdentifier,
														   for: indexPath) as? DeviceTableViewCell else { return UITableViewCell() }
			cell.selectionStyle = .none
			cell.accessoryType = .disclosureIndicator
			cell.setup(with: item)
	
			return cell
		}
		
		var initialSnapshot = NSDiffableDataSourceSnapshot<Section, DeviceItem>()
		initialSnapshot.appendSections([.main])

		let deviceData = viewModel.setupProducts()
		self.updateTableView(withNewData: deviceData)
	}
	
	private func updateTableView(withNewData newData: [DeviceItem]) {
		var snapshot = NSDiffableDataSourceSnapshot<Section, DeviceItem>()
		snapshot.appendSections([.main])
		
		for deviceItem in newData {
			snapshot.appendItems([deviceItem], toSection: .main)
		}

		dataSource.apply(snapshot, animatingDifferences: false)
	}

}

// MARK: - UITableViewDelegate
extension DeviceListViewController: UITableViewDelegate {

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//		guard indexPath.row < viewModel.groupedProductsValues.count else { return }
//		let vc = TransactionDetailViewController(productModel: viewModel.groupedProductsValues[indexPath.row])
//		self.navigationController?.pushViewController(vc, animated: true)
	}
}

struct DeviceItem: Hashable {
	let id: Int
	let name: String
	let icon: UIImage?
	let isOnline: Bool
	let type: Int
	let status: String
	let lastWorkTime: String
}
