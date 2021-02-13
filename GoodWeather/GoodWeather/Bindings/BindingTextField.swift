//
//  BindingTextField.swift
//  GoodWeather
//
//  Created by Kas Song on 2/13/21.
//

import UIKit

class BindingTextField: UITextField {
    
    // MARK: - Properties
    var textChangeClosure: (String) -> Void = { _ in }
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    // MARK: - Helpers
    func binding(callBack: @escaping (String) -> Void) {
        textChangeClosure = callBack
    }
    private func commonInit() {
        addTarget(self, action: #selector(textFieldInputDidChange(_:)), for: .editingChanged)
    }
    
    // MARK: - Selectors
    @objc
    func textFieldInputDidChange(_ sender: UITextField) {
        guard let text = sender.text else { return }
        textChangeClosure(text)
    }
}
