//
//  LoginVC.swift
//  Alphametrica
//
//  Created by Rehan on 11/06/2021.
//

import UIKit

//MARK: CLASS LoginVC START HERE
class LoginVC: UIViewController {

    
    //MARK: REQUIRED OUTLETS AND PROPEETIES
    @IBOutlet weak var lblLogin: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var lblPassword: UILabel!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnForgotPassword: UIButton!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnRegister: UIButton!
    @IBOutlet weak var btnForgot: UIButton!
    @IBOutlet weak var bottomConstantVw: NSLayoutConstraint!
    
    
    //MARK: VIEW DIDLOAD METHOD
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
  

    //MARK: SETUP LAYOUTS
    func setupLayout(){
        lblLogin.font                       = .RobotoRegular(size: 23)
        lblEmail.font                       = .MerriRegular(size: 12)
        txtEmail.font                       = .MerriRegular(size: 16)
        lblPassword.font                    = .RobotoRegular(size: 12)
        txtPassword.font                    = .MerriRegular(size: 16)
        btnLogin.titleLabel?.font           = .RobotoRegular(size: 16)
        btnRegister.titleLabel?.font        = .RobotoRegular(size: 14)
        btnForgotPassword.titleLabel?.font  = .RobotoBold(size: 14)
        btnForgot.titleLabel?.font          = .RobotoRegular(size: 14)
        btnLogin.addCornerRadius(value: 6)
        hideKeyboardOnTapOutside()
    }
    
    
    //MARK: BUTTON SIGN UP ACTION
    @IBAction func btnSignUpAction(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(identifier: StoryboardIdentifier.SignUpVC.rawValue) as? SignUpVC
        navigationController?.pushViewController(vc!, animated: true)
    }
    
    
    //MARK: BUTTON LOGIN ACTION
    @IBAction func btnLoginAction(_ sender: UIButton) {
      
        let value = Validate()
        switch value {
        case .success:
            let vc = storyboard?.instantiateViewController(identifier: StoryboardIdentifier.HomeVC.rawValue) as? HomeVC
            navigationController?.pushViewController(vc!, animated: true)
        case .failure( _, let msg):
            alertForErrorMessage(message: msg)
         break
        }
        
    }
    
    
    //MARK: VALIDATE
    private func Validate() -> Valid{
        
        let email    = txtEmail.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = txtPassword.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        let value : Valid = Validation.shared.validate(login: email, password: password)
        return value
        
    }
    
    
}
//MARK: CLASS LoginVC START HERE


//MARK: TEXTFILED DELAGET METHODS
extension LoginVC: UITextFieldDelegate{
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
       
        if bottomConstantVw.constant == 14{
            bottomConstantVw.constant = 210
        }
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
      
        if bottomConstantVw.constant == 210{
            bottomConstantVw.constant = 14
        }
        
    }
 
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
        
    }
    
}
