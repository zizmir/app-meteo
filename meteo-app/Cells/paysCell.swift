//
//  paysCell.swift
//  meteo-app
//
//  Created by Bouznir on 13/06/2018.
//  Copyright © 2018 Bouznir. All rights reserved.
//

import UIKit

class paysCell: UITableViewCell {

    @IBOutlet var paysText : UILabel!

    
    init(_ pays: String) {
        self.pays = pays
    }


}
