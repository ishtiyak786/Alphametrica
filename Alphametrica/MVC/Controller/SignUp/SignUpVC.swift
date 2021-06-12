//
//  SignUpVC.swift
//  Alphametrica
//
//  Created by Rehan on 11/06/2021.
//

import UIKit

//MARK: CLASS SignUpVC START HERE
class SignUpVC: UIViewController {

    
    //MARK: REQUIRED OUTLETS AND PROPEETIES
    private var selectedTag = Int()
    private var isChecked   = false
    @IBOutlet weak var tblRegister: UITableView!
    @IBOutlet weak var constantTblBottom: NSLayoutConstraint!
    var allData = [
                   "name" : "",
                   "mobileNo": "",
                   "dob": "",
                   "email":"",
                   "password": "",
                   "confirmPass": ""
   ]
    
    //MARK: VIEW DIDLOAD METHOD
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardOnTapOutside()
    }
    
    
    //MARK: BUTTON CHECKBOX ACTION
    @IBAction func btnCheckBoxAction(_ sender: UIButton) {
        
        if !isChecked{
            isChecked = true
        }else{
            isChecked = false
        }
        tblRegister.reloadData()
        
    }
    
    
    //MARK: BUTTON SIGNUP ACTION
    @IBAction func btnSignUpAction(_ sender: UIButton) {
   
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
        
        let value : Valid = Validation.shared.validate(signUp: allData["name"], mobileNo: allData["mobileNo"], dob: allData["dob"], email: allData["email"] , password: allData["password"], confPassword: allData["confirmPass"], isCheckedValue: isChecked)
        return value
        
    }
    
    
    //MARK: BUTTON ALREADY HAVE ACCOUNT
    @IBAction func btnDonthaveAccount(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
}
//MARK: CLASS SignUpVC START HERE



//MARK: TABLEVIEW DELEGATE AND DATASOURCE METHODS START HERE
extension SignUpVC: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: StoryboardIdentifier.CellRegister.rawValue) as? signUpCell
        
        if  (allData["password"]!.isValidPassword()){
            cell!.btnOne.setImage(#imageLiteral(resourceName: "AM_radioCheck"), for: .normal)
            cell!.btnTwo.setImage(#imageLiteral(resourceName: "AM_radioCheck"), for: .normal)
            cell!.btnThr.setImage(#imageLiteral(resourceName: "AM_radioCheck"), for: .normal)
            cell!.btnFor.setImage(#imageLiteral(resourceName: "AM_radioCheck"), for: .normal)
        }else{
            cell!.btnOne.setImage(#imageLiteral(resourceName: "AM_radioUncheck"), for: .normal)
            cell!.btnTwo.setImage(#imageLiteral(resourceName: "AM_radioUncheck"), for: .normal)
            cell!.btnThr.setImage(#imageLiteral(resourceName: "AM_radioUncheck"), for: .normal)
            cell!.btnFor.setImage(#imageLiteral(resourceName: "AM_radioUncheck"), for: .normal)
        }
        

        if isChecked{
            cell!.btnTermsAndConsition.setImage(#imageLiteral(resourceName: "AM_BlueCheckBox"), for: .normal)
        }else{
            cell!.btnTermsAndConsition.setImage(#imageLiteral(resourceName: "AM_checkBox"), for: .normal)
        }
        
        return cell!
        
    }
  
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 1074
    }
  
}
//MARK: TABLEVIEW DELEGATE AND DATASOURCE METHODS END HERE


//MARK: TEXTFILED DELAGET METHODS
extension SignUpVC: UITextFieldDelegate{
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
       
        if constantTblBottom.constant == 0{
            constantTblBottom.constant = 210
        }
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        let indexPath = IndexPath(row: 0, section: 0)
        let cell      = tblRegister.cellForRow(at: indexPath) as! signUpCell
        
        if textField == cell.txtName{
            allData["name"] = cell.txtName.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        }
        else if textField == cell.txtMobileNo{
            allData["mobileNo"] = cell.txtMobileNo.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        }
        else if textField == cell.txtDateOfBirth{
            allData["dob"] = cell.txtDateOfBirth.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        }
        else if textField == cell.txtEmail{
            allData["email"] = cell.txtEmail.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        }
        else if textField == cell.txtPassword{
            allData["password"] = cell.txtPassword.text?.trimmingCharacters(in: .whitespacesAndNewlines)
            tblRegister.reloadData()
        }
        else if textField == cell.txtConfirmPassword{
            allData["confirmPass"] = cell.txtConfirmPassword.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        }
        
        if constantTblBottom.constant == 210{
            constantTblBottom.constant = 0
        }
        
    }
 
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
        
    }
    
}
