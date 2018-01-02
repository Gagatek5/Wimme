//
//  SearchVC.swift
//  Wimme
//
//  Created by Tom on 18/11/2017.
//  Copyright © 2017 doThisApp. All rights reserved.
//

import UIKit

class SearchVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    var categoryImage = ["Sport.pdf", "Entertainment.pdf", "Date.pdf", "Hobby.pdf", "Other.pdf"]
    var categoryName = ["Sport", "Entertainment.pdf", "Date.pdf","Hobby.pdf", "Other.pdf"]
    var sportSubcategory = ["Running", "Basketball", "Volleyball", "Swimming", "Cycling", "Handball", "Football", "CrossFit", "Other"]
    var entertainmentSubcategory = ["Bowling", "Cinema", "Food", "Club", "Theatre", "Concert", "Other"]
    var dateSubcategory = ["Female", "Male", "Other"]
    var hobbySubcategory = ["Fishing", "Beer", "Astronomy", "Musical Experience", "Other"]
    var otherSubcategory = ["Other"]
    
    var checkLogIn = false
    var category:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return categoryImage.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Category", for: indexPath) as! CategoryCells
        cell.categoryImage.image = UIImage(named: categoryImage[indexPath.row])
        cell.categoryLabel.text = categoryName[indexPath.row]
        
        category = categoryName[indexPath.row]
        
        return cell
    }
    
    @IBAction func AddEvent(_ sender: Any) {
        performSegue(withIdentifier: "AddEvent", sender: self)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "subcategory", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "subcategory" {
            
            let showSub: ShowSubgroupVC = segue.destination as! ShowSubgroupVC
            
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
