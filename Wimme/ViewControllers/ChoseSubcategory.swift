//
//  ChoseSubcategory.swift
//  Wimme
//
//  Created by Tom on 19/11/2017.
//  Copyright © 2017 doThisApp. All rights reserved.
//

import UIKit

class ChoseSubcategory: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource,UITextFieldDelegate {

    @IBOutlet weak var SubCategory: UIPickerView!
    var Category = ""
    var subcategoryName = ""
    var subList:Array = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
       print(subList)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        print(subList[row])
        return subList[row]
        
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return subList.count
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        subcategoryName = subList[row]
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
    @IBAction func ChosePlace(_ sender: Any) {
        performSegue(withIdentifier: "showPlace", sender: sender)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPlace" {
            let map: MapVC = segue.destination as! MapVC
            
                map.Category = Category
                map.Subcategory =  subcategoryName
        
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
