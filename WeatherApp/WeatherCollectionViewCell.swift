//
//  WeatherCollectionViewCell.swift
//  WeatherApp
//
//  Created by tantsunsin on 2020/8/15.
//

import UIKit

class WeatherCollectionViewCell: UICollectionViewCell{
    
    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        HourlyTable.delegate = self
//        HourlyTable.dataSource = self
//
//        HourlyTable.register(WeatherCollectionViewCell.self, forHeaderFooterViewReuseIdentifier: "HourlyForcast")
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 20
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "HourlyForcast", for: indexPath) as! ForecastTableViewCell
//        cell.TempLabel.text = CityWeather[indexforCollcell].WeatherOfCity?.hourly[indexPath.row].temp
//        cell.HumiLabel.text = CityWeather[indexforCollcell].WeatherOfCity?.hourly[indexPath.row].humidity
//
//
//        return cell
//    }
    
 
    @IBOutlet weak var CityNameZHTW: UILabel!
    @IBOutlet weak var CityNameEN: UILabel!
    
    @IBOutlet weak var WeatherCondLabel: UILabel!
    
    @IBOutlet weak var CurrentTemp: UILabel!
    @IBOutlet weak var CurrentFeelsLike: UILabel!
    @IBOutlet weak var CurrentHumiduty: UILabel!
    @IBOutlet weak var CurrentWindSpeed: UILabel!
    
    @IBOutlet weak var WeatherImage: UIImageView!
    
    
    func setimage(imageview : UIImageView){
        imageview.alpha = 0.4
        imageview.contentMode = .scaleAspectFill
    }
    
    
        
}


