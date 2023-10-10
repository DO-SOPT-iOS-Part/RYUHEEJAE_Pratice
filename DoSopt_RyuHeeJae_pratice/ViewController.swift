//
//  ViewController.swift
//  DoSopt_RyuHeeJae_pratice
//
//  Created by 류희재 on 2023/10/07.
//

import UIKit

class ViewController: UIViewController {
    
    private var idText: String = ""
    private var passwordText: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func idTextFieldDidEditing(_ sender: Any) {
        guard let textField = sender as? UITextField else {return}
        if let idText = textField.text {
            self.idText = idText
        }
    }
    
    @IBAction func passwordTextFieldDidEditing(_ sender: Any) {
        guard let textField = sender as? UITextField else {return}
        if let passwordText = textField.text {
            self.passwordText = passwordText
        }
    }
    
    @IBAction func loginButton(_ sender: Any) {
        pushToResultVC()
        print("\(idText)\n\(passwordText)")
    }
    
    //VC

    func pushToResultVC() {
            guard let resultVC = self.storyboard?.instantiateViewController(identifier: "SecondViewController") as? SecondViewController else {return}
            resultVC.setLabelText(id: self.idText,
                                  password: self.passwordText)
            resultVC.delegate = self
            self.navigationController?.pushViewController(resultVC, animated: true)
    }
}

extension ViewController: GetDataProtocol {
    func getLoginData(email: String, password: String) {
        print("받아온 email : \(email), 받아온 password : \(password)")
    }
}
