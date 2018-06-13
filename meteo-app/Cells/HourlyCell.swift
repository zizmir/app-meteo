//
//  HourlyCell.swift
//  meteo-app
//
//  Created by Bouznir on 11/06/2018.
//  Copyright © 2018 Bouznir. All rights reserved.
//

import UIKit

class HourlyCell: UITableViewCell {

    @IBOutlet var hourlyForecastText : UILabel!
    @IBOutlet var DailyForecastText : UILabel!
    @IBOutlet var icon : UIImageView!
    
    func configure( _ hourlyForecast : String , _ dailyForecast:Float , _ picture:String ){
        hourlyForecastText.text = hourlyForecast
        DailyForecastText.text = "\(Int(dailyForecast)) C°"
        icon.image = UIImage(named : "\(picture)")
    }


}
