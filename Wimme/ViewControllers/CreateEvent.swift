//
//  CreateEvent.swift
//  Wimme
//
//  Created by Tom on 19/11/2017.
//  Copyright © 2017 doThisApp. All rights reserved.
//

import UIKit

class CreateEvent: UIViewController {

    var Category = ""
    var Subcategory = ""
    var place: String = ""
    var coordinateX: Float = 0.0
    var coordinateY: Float = 0.0
    var coordinateZ: Float = 0.0
    var data: String = "2017-11-20"
    var desc: String = "jAKIS TAM OPIS"
    var maxNmbOfPart: Int = 10
    var titl: String = "Lets Code"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    @IBAction func DoSth(_ sender: Any) {
        var eventloc = EventLocalization.init(xVariable: coordinateX, yVariable: coordinateY, zVariable: coordinateZ)
        var eventCat = EventCategories.init(categoryName: Category, categoryPhotoUrl: "")
        AddNewEvent.addNewEventToFirebase(date: data, place: place, title: titl, description: desc, eventLocalization: eventloc, maxNumberOfParticipants: maxNmbOfPart, resignationTime: "", eventComment: "", eventCategory: eventCat)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
