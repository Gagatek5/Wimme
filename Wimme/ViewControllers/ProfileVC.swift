//
//  ProfileVC.swift
//  Wimme
//
//  Created by Tom on 18/11/2017.
//  Copyright © 2017 doThisApp. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var navBar: UINavigationItem!
    @IBOutlet weak var ProfileImage: UIImageView!
    @IBOutlet weak var emailL: UILabel!
    @IBOutlet weak var firstNameL: UILabel!
    @IBOutlet weak var lastNameL: UILabel!
    @IBOutlet weak var ratingL: UILabel!
    @IBOutlet weak var Frequency: UILabel!
    @IBOutlet weak var descriptionTV: UITextView!
    
    var rating: Float = 0.00
    var frequency: Float = 0.00
    
    override func viewDidLoad() {
        super.viewDidLoad()
       PrepareInfoUser()
    }
   
    @IBAction func LogOutButton(_ sender: Any) {
        LogOut.logOut()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func PrepareInfoUser(){
        //Image
        ProfileImage.layer.borderWidth = 1
        ProfileImage.layer.masksToBounds = false
        ProfileImage.layer.borderColor = UIColor.black.cgColor
        ProfileImage.layer.cornerRadius = ProfileImage.frame.height/2
        ProfileImage.clipsToBounds = true
        ProfileImage.image = UIImage(named: "ProfileTwardek.pdf")

        GetUserInfo.getUserInfo(){userInformations in (
            self.descriptionTV.text = userInformations.description,
            self.navBar.title = userInformations.username,
            self.firstNameL.text? = "First name: " + userInformations.firstName!,
            self.emailL.text? = "Email: " + userInformations.email!,
            self.lastNameL.text = "Last name: " + userInformations.lastName!,
            self.ratingL.text = "Raiting: " + String(describing: userInformations.rating!),
            self.Frequency.text = "Frequency: " + String(describing: userInformations.frequency!))}
    }

    //hiding keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //Presses return key
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return (true)
    }

}
