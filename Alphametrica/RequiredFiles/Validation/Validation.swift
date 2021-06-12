//
//  Validation.swift
//  Alphametrica
//
//  Created by Rehan on 12/06/2021.
//

import UIKit


enum Valid{
    case success
    case failure(String,String)
}

class Validation: NSObject {
    
    static let shared = Validation()
    
    func validate(login email : String?, password : String?) -> Valid {
    
        if (email == AllString.blank){
            return errorMsg(str: AllString.emailBlank)
        }
        else if email != AllString.loginEmail{
            return errorMsg(str: AllString.wrongEmail)
        }
        else if (password == AllString.blank) {
            return errorMsg(str: AllString.passBlank)
        }
        else if (password!.count < 7){
            return errorMsg(str: AllString.passCount)
        }
        else if password != AllString.loginPass{
            return errorMsg(str: AllString.passCount)
        }
        return .success
    }
    
    
    func validate(signUp name : String?, mobileNo : String?, dob : String? , email: String?, password : String?, confPassword: String?, isCheckedValue: Bool?) -> Valid {
    
        if (name == AllString.blank){
            return errorMsg(str: AllString.emptyName)
        }
        else if mobileNo == AllString.blank{
            return errorMsg(str: AllString.emptyMob)
        }
        else if (dob == AllString.blank) {
            return errorMsg(str: AllString.emptyDob)
        }
        else if (email == AllString.blank) {
            return errorMsg(str: AllString.emailBlank)
        }
        else if !(email?.isValidEmail(email!))!{
            return errorMsg(str: AllString.invalidEml)
        }
        else if password == AllString.blank{
            return errorMsg(str: AllString.passBlank)
        }
        else if password!.count < 8{
            return errorMsg(str: AllString.passLenth)
        }
        else if !((password?.isValidPassword())!){
            return errorMsg(str: AllString.invalidPass)
        }
        else if confPassword == AllString.blank{
            return errorMsg(str: AllString.emptyconf)
        }
        else if password != confPassword {
            return errorMsg(str: AllString.notMatch)
        }
        else if !isCheckedValue! {
            return errorMsg(str: AllString.termsCon)
        }
        return .success
    }
    
    
    func errorMsg(str : String) -> Valid{
        return .failure(AllString.Error,str)
    }
    

}
