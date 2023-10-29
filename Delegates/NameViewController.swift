//
//  NameViewController.swift
//  Delegates
//
//  Created by Yuri Cunha on 29/10/23.
//

import UIKit

protocol NameViewControllerProtocol: AnyObject {
    func fieldCompleted(_ value: String)
}

final class NameViewController: UIViewController {
    
    private var nameView: NameView?
    weak var delegate: NameViewControllerProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Informar nome"
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    
    override func loadView() {
        self.nameView = NameView()
        self.nameView?.delegate = self
        view = self.nameView
    }

}

extension NameViewController: NameViewDelegate {
    func buttonTapped() {
        let name = nameView?.textField.text
        delegate?.fieldCompleted(name ?? "deu ruim")
        navigationController?.popViewController(animated: true)
    }
    
    
}
