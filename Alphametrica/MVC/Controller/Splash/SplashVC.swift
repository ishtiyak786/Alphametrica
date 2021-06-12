//
//  ViewController.swift
//  Alphametrica
//
//  Created by Rehan on 11/06/2021.
//

import UIKit

//MARK: CLASS SplashVC START HERE
class SplashVC: UIViewController {

    
    //MARK: REQUIRED OUTLETS AND PROPEETIES
    @IBOutlet weak var lblStayOnTop: UILabel!
    @IBOutlet weak var lblContent: UILabel!
    @IBOutlet weak var btnSignUp: UIButton!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var scrollVw: UIScrollView!
    
    
    //MARK: VIEW DIDLOAD METHOD
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }

    
    //MARK: SETUP LAYOUTS
    func setupLayout(){
        lblStayOnTop.font           = .LatoRegular(size: 23)
        lblContent.font             = .MerriRegular(size: 14)
        btnSignUp.titleLabel?.font  = .RobotoRegular(size: 16)
        btnLogin.titleLabel?.font   = .RobotoRegular(size: 16)
        btnSignUp.addCornerRadius(value: 6)
        scrollVw.isExclusiveTouch = true
        scrollVw.delaysContentTouches = true
        setContent()
    }
    
    
    //MARK: SET TEXT IN LABEL
    func setContent(){
    
        let text = AllString.AllContent.withBoldText(text: AllString.boldContent, fontType: UIFont.LatoRegular(size: 23)!)
        lblStayOnTop.attributedText = text
        
    }
    
    
    //MARK: BUTTON LOGIN ACTION
    @IBAction func btnLoginAction(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(identifier: StoryboardIdentifier.LoginVC.rawValue) as? LoginVC
        navigationController?.pushViewController(vc!, animated: true)
    }
    
    
    //MARK: BUTTON SIGN UP ACTION
    @IBAction func btnSignUpAction(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(identifier: StoryboardIdentifier.SignUpVC.rawValue) as? SignUpVC
        navigationController?.pushViewController(vc!, animated: true)
    }
    
}
//MARK: CLASS SplashVC END HERE
