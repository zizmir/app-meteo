//
//  DailyforecastCell.swift
//  meteo-app
//
//  Created by Bouznir on 12/06/2018.
//  Copyright © 2018 Bouznir. All rights reserved.
//

import UIKit

class DailyforecastCell: UITableViewCell {

    @IBOutlet var time : UILabel!
    @IBOutlet var icon : UIImageView!
    @IBOutlet var temperatureMin : UILabel!
    @IBOutlet var temperatureMax : UILabel!
    
    func configure( _ dailyforecast : (Int,String,Float, Float)){
        let date = Date(timeIntervalSince1970: TimeInterval(dailyforecast.0))
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        let dayInWeek = formatter.string(from: date)
        time.text = "\(dayInWeek)"
        
        icon.image = UIImage(named : "\(dailyforecast.1)")
        temperatureMin.text = "\(Int(dailyforecast.2.rounded())) C°"
        temperatureMax.text = "\( Int(dailyforecast.3.rounded())) C°"
    }

}
