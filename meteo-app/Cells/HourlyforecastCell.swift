//
//  HourlyforecastCell.swift
//  meteo-app
//
//  Created by Bouznir on 11/06/2018.
//  Copyright © 2018 Bouznir. All rights reserved.
//

import UIKit

class HourlyforecastCell: UITableViewCell {
    
    @IBOutlet var time : UILabel!
    @IBOutlet var icon : UIImageView!
    @IBOutlet var humidity : UILabel!
    @IBOutlet var temperature : UILabel!
    
    
    func configure( _ hourlyForecast : (Int,String,Float, Float)){
        
        time.text = "\(Calendar.current.component(.hour, from: Date(timeIntervalSince1970: TimeInterval(hourlyForecast.0))))"
        
        icon.image = UIImage(named : "\(hourlyForecast.1)")
        humidity.text = "\(hourlyForecast.2) %"
        temperature.text = "\( hourlyForecast.3.rounded()) C°"
    }

}
