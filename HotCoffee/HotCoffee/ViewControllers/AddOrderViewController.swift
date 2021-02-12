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
    final private var viewModel: AddOrderViewModel
    final weak var delegate: AddOrderViewControllerDelegate?
    
    final private let tableView = UITableView()
    final private var segmentedControl: UISegmentedControl
    final private let nameTextField = UITextField()
    final private let emailTextField = UITextField()
    
    // MARK: - Lifecycle
    init(viewModel: AddOrderViewModel) {
        self.viewModel = viewModel
        segmentedControl = UISegmentedControl(items: viewModel.sizes)
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
}

// MARK: - Selectors
extension AddOrderViewController {
    @objc
    final private func didTapLeftBarButtonItem(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    @objc
    final private func didTapRightBarButtonItem(_ sender: UIBarButtonItem) {
        guard let indexPath = tableView.indexPathForSelectedRow else { print("No Menu Selected"); return }
        sender.isEnabled = false
        let name = nameTextField.text
        let email = emailTextField.text
        guard name != "", email != "" else { print("Name or email field is empty."); return }
        let selectedSize = segmentedControl.titleForSegment(at: segmentedControl.selectedSegmentIndex)
        let selectedType = viewModel.types[indexPath.row]
        viewModel.register(name: name, email: email, selectedType: selectedType, selectedSize: selectedSize)
        
        OrderService.shared.load(resource: Order.createResource(viewModel: viewModel),
                                 completion: { result in
                                    switch result {
                                    case .success(let order):
                                        print(order)
                                        self.delegate?.placedOrder()
                                        DispatchQueue.main.async {
                                            self.dismiss(animated: true, completion: nil)
                                        }
                                    case .failure(let error):
                                        print(error)
                                        sender.isEnabled = true
                                    }
                                 })
    }
}

// MARK: - UITableViewDelegate
extension AddOrderViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
    }
}

// MARK: - UITableViewDataSource
extension AddOrderViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var contentConfiguration = cell.defaultContentConfiguration()
        contentConfiguration.text = viewModel.types[indexPath.row]
        cell.contentConfiguration = contentConfiguration
        cell.selectionStyle = .none
        return cell
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
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
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

// MARK: - Protocols
protocol AddOrderViewControllerDelegate: class {
    func placedOrder()
}
