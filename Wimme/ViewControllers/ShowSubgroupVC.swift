//
//  ShowSubgroupVC.swift
//  Wimme
//
//  Created by Tom on 19/11/2017.
//  Copyright © 2017 doThisApp. All rights reserved.
//

import UIKit

class ShowSubgroupVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    var subList:Array = [String]()
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
        
        return subList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Subcategory", for: indexPath) as! SubcategoryCell
        cell.subcategoryLabel.text = subList[indexPath.row]
        
        
        return cell
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //performSegue(withIdentifier: "showSubcategory", sender: self)
        print("row selected: \(indexPath.row)")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showSubcategory" {
            
        }
    }
    
    
}

