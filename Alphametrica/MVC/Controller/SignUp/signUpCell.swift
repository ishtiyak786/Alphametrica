//
//  signUpCell.swift
//  Alphametrica
//
//  Created by Rehan on 11/06/2021.
//

import UIKit

class signUpCell: UITableViewCell {

    
    @IBOutlet weak var lblSignUp: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var lblMobileNo: UILabel!
    @IBOutlet weak var txtMobileNo: UITextField!
    @IBOutlet weak var lblDateOfBirth: UILabel!
    @IBOutlet weak var txtDateOfBirth: UITextField!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var lblPassword: UILabel!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var lblConfirmPassword: UILabel!
    @IBOutlet weak var txtConfirmPassword: UITextField!
    @IBOutlet weak var lblEigthChar: UILabel!
    @IBOutlet weak var lblEightNo: UILabel!
    @IBOutlet weak var lblUppercase: UILabel!
    @IBOutlet weak var lblUpperLeter: UILabel!
    @IBOutlet weak var btnOne: UIButton!
    @IBOutlet weak var btnTwo: UIButton!
    @IBOutlet weak var btnThr: UIButton!
    @IBOutlet weak var btnFor: UIButton!
    @IBOutlet weak var lblTerms: UILabel!
    @IBOutlet weak var btnTermsAndConsition: UIButton!
    @IBOutlet weak var btnSignUp: UIButton!
    @IBOutlet weak var btnAlreadyAcoount: UIButton!
    @IBOutlet weak var lblBoldCP: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        lblSignUp.font          = .RobotoRegular(size: 23)
        lblName.font            = .RobotoRegular(size: 16)
        lblMobileNo.font        = .RobotoRegular(size: 16)
        lblDateOfBirth.font     = .RobotoRegular(size: 16)
        lblEmail.font           = .LatoRegular(size: 16)
        lblPassword.font        = .RobotoRegular(size: 16)
        lblConfirmPassword.font = .RobotoRegular(size: 16)
        lblBoldCP.font          = .RobotoBold(size: 16)
        lblEigthChar.font       = .RobotoRegular(size: 11)
        lblUppercase.font       = .RobotoRegular(size: 11)
        lblEightNo.font         = .RobotoRegular(size: 11)
        lblUpperLeter.font      = .RobotoRegular(size: 11)
        lblTerms.font           = .RobotoRegular(size: 12)
        btnSignUp.titleLabel?.font         = .RobotoBold(size: 16)
        btnAlreadyAcoount.titleLabel?.font = .RobotoBold(size: 14)
        btnSignUp.addCornerRadius(value: 6)
        
        txtName.font            =   .RobotoRegular(size: 14)
        txtMobileNo.font        =   .MerriRegular(size: 14)
        txtDateOfBirth.font     =   .MerriRegular(size: 14)
        txtPassword.font        =   .MerriRegular(size: 14)
        txtConfirmPassword.font =   .MerriRegular(size: 14)
        txtEmail.font           =   .MerriRegular(size: 14)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
