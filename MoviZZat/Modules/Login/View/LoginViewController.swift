//
//  LoginViewController.swift
//  MoviZZat
//
//  Created by sherif on 28/08/2022.
//

import UIKit

class LoginViewController: UIViewController {

    
    var LoginVM:LoginViewModel?
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var userNameTextfield: UITextField!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        LoginVM = LoginViewModel(services: NetworkManager())
        LoginVM?.BindingResultLogin = {
           
        }
       
       
    }


    @IBAction func loginButtonPressed(_ sender: UIButton) {
         valdiateButtons()
    }
    
    
    
    func valdiateButtons(){
        
        guard let name = userNameTextfield.text else{return}
        guard let password = passwordTextField.text else{return}
        if name.isEmpty || password.isEmpty {
            let alertController = UIAlertController(title: "Inavalid Fields", message: "Check Email Or password", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .cancel)
            alertController.addAction(action)
            self.present(alertController, animated: true)
        }else{
            
            LoginVM?.getDataLogin(userName: name, password: password)
        }
    }
}
