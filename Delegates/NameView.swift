//
//  NameView.swift
//  Delegates
//
//  Created by Yuri Cunha on 29/10/23.
//

import UIKit

protocol NameViewDelegate: AnyObject {
    func buttonTapped()

}

class NameView: UIView {
    
    weak var delegate: NameViewDelegate?
    
    lazy var textField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Informe o nome"
        textField.borderStyle = .roundedRect
        textField.keyboardType = .default
        return textField
    }()
    
    private lazy var button: UIButton = {
        let uiButton = UIButton(type: .system)
               

        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Salvar", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.backgroundColor = UIColor(red: 0.39, green: 0.65, blue: 0.73, alpha: 1.00)
        button.clipsToBounds = true
        button.layer.cornerRadius = 8.0
        button.titleLabel?.textAlignment = .center
        
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        return button
    }()
    
    @objc private func buttonTapped() {
        delegate?.buttonTapped()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

    private func setupView() {
        addSubview(textField)
        addSubview(button)
        
    }
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 100),
            textField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            button.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 15),
            button.trailingAnchor.constraint(equalTo: textField.trailingAnchor),
            button.leadingAnchor.constraint(equalTo: textField.leadingAnchor),
            button.heightAnchor.constraint(equalToConstant: 45)
            
        ])
    }

}
