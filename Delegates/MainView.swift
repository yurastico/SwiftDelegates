//
//  MainView.swift
//  Delegates
//
//  Created by Yuri Cunha on 28/10/23.
//

import UIKit

protocol MainViewDelegate: AnyObject {
    func buttonTapped()
}

final class MainView: UIView {
    weak var delegate: MainViewDelegate? // pra isso ser weak precisamos que o protocol conforme com AnyObject
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.text = "Nenhum nome informado"
        return label
    }()
    
    private lazy var button: UIButton = {
        let uiButton = UIButton(type: .system)
               

        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("INFORMAR NOME", for: .normal)
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
        fatalError()
    }
    
    
    private func setupView() {
        
        addSubview(label)
        addSubview(button)
    }
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 100),
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            button.topAnchor.constraint(equalTo: label.bottomAnchor,constant: 25),
            
            button.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -50),
            button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
            button.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
    
    
   
}
