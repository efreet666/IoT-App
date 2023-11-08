//
//  ViewController.swift
//  IoT App
//
//  Created by Vlad on 08.11.2023.
//

import UIKit

final class DeviceListViewController: UIViewController {

	init() {
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.view.backgroundColor = .white
	}


}

