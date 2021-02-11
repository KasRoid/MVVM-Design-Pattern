//
//  AddOrderViewController.swift
//  HotCoffee
//
//  Created by Kas Song on 2/11/21.
//

import SnapKit
import UIKit

class AddOrderViewController: UIViewController {
    
    // MARK: - Properties
    final private let tableView = UITableView()
    final private let segmentedControl = UISegmentedControl(items: ["Small", "Medium", "Large"])
    final private let nameTextField = UITextField()
    final private let emailTextField = UITextField()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
}

// MARK: - Selectors
extension AddOrderViewController {
    @objc
    final private func didTapLeftBarButtonItem(_ sender: UIBarButtonItem) {
        print(#function)
    }
    @objc
    final private func didTapRightBarButtonItem(_ sender: UIBarButtonItem) {
        print(#function)
    }
}

extension AddOrderViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

// MARK: - UI
extension AddOrderViewController {
    final private func setUI() {
        setNavigationBar()
        setBasics()
        setLayouts()
    }
    final private func setNavigationBar() {
        title = "Add New Order"
        let leftBarButtonItem = UIBarButtonItem(title: "Close", style: .plain, target: self, action: #selector(didTapLeftBarButtonItem(_:)))
        navigationItem.leftBarButtonItem = leftBarButtonItem
        let rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(didTapRightBarButtonItem(_:)))
        navigationItem.rightBarButtonItem = rightBarButtonItem
    }
    final private func setBasics() {
        tableView.dataSource = self
        segmentedControl.selectedSegmentIndex = 0
        nameTextField.placeholder = "Enter name"
        emailTextField.placeholder = "Enter email"
        [nameTextField, emailTextField].forEach {
            let view = UIView()
            view.frame.size = CGSize(width: 10, height: 1)
            $0.leftView = view
            $0.leftViewMode = .always
            $0.layer.borderColor = UIColor.gray.cgColor
            $0.layer.borderWidth = 0.5
            $0.layer.cornerRadius = 4
        }
    }
    final private func setLayouts() {
        [tableView, segmentedControl, nameTextField, emailTextField].forEach {
            view.addSubview($0)
        }
        tableView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalToSuperview().multipliedBy(0.5)
        }
        segmentedControl.snp.makeConstraints {
            $0.top.equalTo(tableView.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
        }
        [nameTextField, emailTextField].forEach {
            $0.snp.makeConstraints {
                $0.width.equalTo(200)
                $0.height.equalTo(36)
                $0.centerX.equalToSuperview()
            }
        }
        nameTextField.snp.makeConstraints {
            $0.top.equalTo(segmentedControl.snp.bottom).offset(40)
        }
        emailTextField.snp.makeConstraints {
            $0.top.equalTo(nameTextField.snp.bottom).offset(12)
        }
    }
}
