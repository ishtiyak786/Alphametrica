//
//  Extension.swift
//  Alphametrica
//
//  Created by Rehan on 11/06/2021.
//


import UIKit


//MARK: FONT EXTENSION
struct AppFontName {
    
    static let LatoRegular       =   "Lato-Regular"
    static let LatoBold          =   "Lato-Bold"
    static let MerriRegular      =   "Merriweather-Regular"
    static let RobotoRegular     =   "Roboto-Regular"
    static let RobotoBold        =   "Roboto-Bold"
   
}

extension UIFont{
    
    static func LatoRegular(size: CGFloat) -> UIFont?{
        return UIFont(name: AppFontName.LatoRegular, size: size)
    }
    
    static func LatoBold(size: CGFloat) -> UIFont?{
        return UIFont(name: AppFontName.LatoBold, size: size)
    }
    
    static func MerriRegular(size: CGFloat) -> UIFont?{
        return UIFont(name: AppFontName.MerriRegular, size: size)
    }
    
    static func RobotoRegular(size: CGFloat) -> UIFont?{
        return UIFont(name: AppFontName.RobotoRegular, size: size)
    }
    
    static func RobotoBold(size: CGFloat) -> UIFont?{
        return UIFont(name: AppFontName.RobotoBold, size: size)
    }
}


extension UIView {
    
    //MARK: ADD CORNER RADIUS
    func addCornerRadius(value: CGFloat){
        
        self.layer.borderColor = UIColor.clear.cgColor
        self.layer.borderWidth = 0.5
        self.layer.masksToBounds = true
        self.layer.cornerRadius = value
    }
    
}



//MARK: ALL STORYBOARD IDENTIFIER
enum StoryboardIdentifier: String {
    
    case LoginVC        =   "LoginVC"
    case SignUpVC       =   "SignUpVC"
    case CellRegister   =   "CellRegister"
    case HomeVC         =   "HomeVC"
    
}



extension String {

    func withBoldText(text: String, font: UIFont? = nil, fontType: UIFont) -> NSAttributedString {
      let _font = font ?? fontType
      let fullString = NSMutableAttributedString(string: self, attributes: [NSAttributedString.Key.font: _font])
      let boldFontAttribute: [NSAttributedString.Key: Any] = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: _font.pointSize)]
      let range = (self as NSString).range(of: text)
      fullString.addAttributes(boldFontAttribute, range: range)
      return fullString
   }
    
    public func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    
    func isValidPassword() -> Bool {
        // least one uppercase,
        // least one digit
        // least one lowercase
        // least one symbol
        //  min 8 characters total
        let password = self.trimmingCharacters(in: CharacterSet.whitespaces)
        let passwordRegx = "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&<>*~:`-]).{8,}$"
        let passwordCheck = NSPredicate(format: "SELF MATCHES %@",passwordRegx)
        return passwordCheck.evaluate(with: password)

    }
    
    public func isNumber() -> Bool {
        return NumberFormatter().number(from: self) != nil ? true : false
    }
    
    func hasSpecialCharacters() -> Bool {

        do {
            let regex = try NSRegularExpression(pattern: ".*[^A-Za-z0-9].*", options: .caseInsensitive)
            if let _ = regex.firstMatch(in: self, options: NSRegularExpression.MatchingOptions.reportCompletion, range: NSMakeRange(0, self.count)) {
                return true
            }

        } catch {
            debugPrint(error.localizedDescription)
            return false
        }

        return false
    }
}

struct AllString {
    static let AllContent   =   "Stay on the top of your finance"
    static let boldContent  =   "of your finance"
    static let forGotPass   =   "비밀번호"
    static let boldForgot   =   "찾기"
    static let emailBlank   =   "Please enter your email"
    static let passBlank    =   "Please enter your password"
    static let passCount    =   "Please check your password"
    static let Error        =   "Error !!"
    static let blank        =   ""
    static let loginEmail   =   "test@luxpmsoft.com"
    static let loginPass    =   "test1234!"
    static let wrongEmail   =   "Please check your email"
    static let emptyName    =   "Please enter your name"
    static let emptyMob     =   "Pleasr enter your mobile no"
    static let emptyDob     =   "Please enter your date of birth"
    static let emptyconf    =   "Please enter your confirm password"
    static let notMatch     =   "Password does not match"
    static let termsCon     =   "Please cehck our terms and conditions"
    static let invalidEml   =   "Invalid email please enter valid email ie: abc@gmail.com"
    static let invalidPass  =   "Invalid password"
    static let passLenth    =   "Password should be minimum eight characters"
}


extension UIViewController {
   
    func alertForErrorMessage(message: String){
      
        let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
           alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
           self.present(alert, animated: true, completion: nil)
    }
    
    //MARK: HIDE KEYBOARD FROM TAP OUT SIDE
    func hideKeyboardOnTapOutside() {
        
        let tap : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    // Hide Keyboard
    @objc func dismissKeyboard(){
         UIView.animate(withDuration: 0.3) {
            self.view.endEditing(true)
        }
    }
}

