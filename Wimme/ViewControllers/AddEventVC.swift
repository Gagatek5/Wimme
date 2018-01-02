//
//  AddEventVC.swift
//  Wimme
//
//  Created by Tom on 18/11/2017.
//  Copyright © 2017 doThisApp. All rights reserved.
//

import UIKit

class AddEventVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {

    @IBOutlet weak var CategoryPicker: UIPickerView!
   
    var category:String = "Sport"
    var subcategory:String = ""
    var categoryName = ["Sport", "Entertaiment", "Date", "Hobby", "Other"]
    var sportSubcategory = ["Running", "Basketball", "Volleyball", "Swimming", "Cycling", "Handball", "Football", "CrossFit", "Other"]
    var entertainmentSubcategory = ["Bowling", "Cinema", "Food", "Club", "Theatre", "Concert", "Other"]
    var dateSubcategory = ["Female", "Male", "Other"]
    var hobbySubcategory = ["Fishing", "Beer", "Astronomy", "Musical Experience", "Other"]
    var otherSubcategory = ["Other"]
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categoryName[row]
        
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {

        return categoryName.count
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        category = categoryName[row]
      //  print(category)
       // print(categoryName)
        
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
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func ShowSubcategory(_ sender: Any) {
         performSegue(withIdentifier: "showSub", sender: sender)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showSub" {
            
            let showSub: ChoseSubcategory = segue.destination as! ChoseSubcategory
            showSub.Category = category
            if(category == "Sport")
            {
                showSub.subList = sportSubcategory
            }
            else if(category == "Entertaiment")
            {
                showSub.subList = entertainmentSubcategory
            }
            else if(category == "Date")
            {
                showSub.subList = dateSubcategory
            }
            else if(category == "Hobby")
            {
                showSub.subList = hobbySubcategory
            }
            else
            {
                showSub.subList = otherSubcategory
            }
        }
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
