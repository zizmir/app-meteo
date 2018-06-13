//
//  DetailsCoordinateViewController.swift
//  meteo-app
//
//  Created by Bouznir on 10/06/2018.
//  Copyright © 2018 Bouznir. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class DetailsCoordinateViewController: UIViewController , UITableViewDataSource, UITableViewDelegate  {
    var city:City!
    @IBOutlet var tableView : UITableView!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.title = city.name
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 44
        tableView.dataSource = self
        loadDataWeather()
    }
 


    //341cee62af3a5634d13fbec19ab47ea1
    func loadDataWeather(){
        let latitude = city.coordinates.latitude
        let longitude = city.coordinates.longitude
        Alamofire.request("https://api.darksky.net/forecast/341cee62af3a5634d13fbec19ab47ea1/\(latitude),\(longitude)?units=si").responseJSON{ (response ) in
            
            if let value = response.result.value {
                let json = JSON(value)
                self.city.update(json)
                
                self.tableView.reloadData()
                
            } else {
                print(response.result.error!)
            }
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 1:
            return city.hourlyForecast
        case 2:
            return city.dailyForecast
        case 3:
            return "Extra informations"
        default:
            return nil
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        switch section {
        case 0 :
            return 1
        case 1 :
            return city.tupleHourly.count
            
        case 2 :
            return city.tupleDaily.count
            
        case 3 :
            return city.tupleExtraInformations.count
            
        default:
            return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0 :
            let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderCell", for: indexPath) as! HourlyCell
            cell.configure( city.currentSummary , city.temperature  , city.urlIconWheather)
            return cell
        case 1 :
            let cell = tableView.dequeueReusableCell(withIdentifier: "HourlyforecastCell", for: indexPath) as! HourlyforecastCell
            cell.configure( city.tupleHourly[indexPath.row])
            
            return cell
        case 2 :
            let cell = tableView.dequeueReusableCell(withIdentifier: "DailyforecastCell", for: indexPath) as! DailyforecastCell
            cell.configure( city.tupleDaily[indexPath.row])
            return cell
            
        case 3 :
        
           
            let cell = tableView.dequeueReusableCell(withIdentifier: "ExtraInformationCell", for: indexPath) as! ExtraInformationCell
            
            
            cell.configure( city.tupleExtraInformations[indexPath.row])
            
            return cell
        default:
            return UITableViewCell()
        }
    }
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        switch <#value#> {
//        case :
//            <#code#>
//        default:
//            <#code#>
//        }
//    }
}
