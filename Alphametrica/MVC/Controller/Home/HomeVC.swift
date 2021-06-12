//
//  HomeVC.swift
//  Alphametrica
//
//  Created by Rehan on 12/06/2021.
//

import UIKit

//MARK: CLASS HomeVC START HERE
class HomeVC: UIViewController {

    
    //MARK: VIEW DIDLOAD METHOD
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    //MARK: BUTTON LOG OUT ACTION
    @IBAction func btnLogOutAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
   
}
//MARK: CLASS HomeVC END HERE
