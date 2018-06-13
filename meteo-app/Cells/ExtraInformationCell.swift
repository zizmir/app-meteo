//
//  ExtraInformationCell.swift
//  meteo-app
//
//  Created by Bouznir on 12/06/2018.
//  Copyright © 2018 Bouznir. All rights reserved.
//

import UIKit

class ExtraInformationCell: UITableViewCell {

    @IBOutlet var valueOne : UILabel!
    @IBOutlet var valueTwo : UILabel!
    @IBOutlet var titleOne : UILabel!
    @IBOutlet var titleTwo : UILabel!
    
    func configure( _ tuple: (Int,String, Int , String)   ){
        print(tuple)
        let unite1 = tuple.1 == "Humidity" ? "% " : "hPA"
        let unite2 = tuple.3 == "Wind speed" ? "km/h" : ""
        
        titleOne.text = String(tuple.1)
        valueOne.text = "\(tuple.0)  \(unite1)"
       
        titleTwo.text = String(tuple.3) 
        valueTwo.text = "\(tuple.2) \(unite2)"
    }

}
