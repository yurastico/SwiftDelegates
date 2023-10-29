//
//  ViewController.swift
//  Delegates
//
//  Created by Yuri Cunha on 28/10/23.
//

import UIKit

class ViewController: UIViewController {
    
    private var customView: MainView?

    override func viewDidLoad() {
        super.viewDidLoad()
        customView?.delegate = self
        // Do any additional setup after loading the view.
       
    }
    override func loadView() {
        self.customView = MainView()
        view = self.customView
    }


}

extension ViewController: MainViewDelegate {
    func buttonTapped() {
        let nameViewController = NameViewController()
        nameViewController.delegate = self
        navigationController?.pushViewController(nameViewController, animated: true)
    }
    
    
}

extension ViewController: NameViewControllerProtocol {
    func fieldCompleted(_ value: String) {
        customView?.label.text = value
    }
    
    
}
