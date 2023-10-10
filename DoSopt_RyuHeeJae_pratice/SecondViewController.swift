//
//  SecondViewController.swift
//  DoSopt_RyuHeeJae_pratice
//
//  Created by 류희재 on 2023/10/11.
//

protocol GetDataProtocol {
    func getLoginData(email: String, password: String)
}

import UIKit

class SecondViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindText()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    
    @IBOutlet weak var backButton: UIButton!
    
    @IBAction func backButtonDidTap(_ sender: Any) {
        if let navigationController = self.navigationController {
            navigationController.popViewController(animated: true)
        } else {
            self.dismiss(animated: true)
        }
        delegate?.getLoginData(email: self.email,
                               password: self.password)
    }
    var email: String = ""
    var password: String = ""
    
    //ResultVC
    var delegate: GetDataProtocol?


    func setLabelText(id: String,
                      password: String) {
        self.email = id
        self.password = password
    }

    private func bindText() {
            self.emailLabel.text = "email : \(email)"
        self.passwordLabel.text = "password : \(password)"
    }
    
}
