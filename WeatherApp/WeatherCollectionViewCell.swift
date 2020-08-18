//
//  WeatherCollectionViewCell.swift
//  WeatherApp
//
//  Created by tantsunsin on 2020/8/15.
//

// 方法1: 從程式計算 cell 的大小!!!!! https://medium.com/%E5%BD%BC%E5%BE%97%E6%BD%98%E7%9A%84-swift-ios-app-%E9%96%8B%E7%99%BC%E5%95%8F%E9%A1%8C%E8%A7%A3%E7%AD%94%E9%9B%86/%E5%88%A9%E7%94%A8-flow-layout-%E7%9A%84-collection-view-%E8%A3%BD%E4%BD%9C%E7%85%A7%E7%89%87%E7%89%86-e31dad55a7ac


import UIKit

class WeatherCollectionViewCell: UICollectionViewCell, UITableViewDelegate, UITableViewDataSource{
    
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HourlyForcast", for: indexPath) as! ForecastTableViewCell
        
        // 溫度與濕度的格式整理
        let Temp = CityWeather[indexforCollcell].WeatherOfCity?.hourly[indexPath.row].temp
        let Humi = CityWeather[indexforCollcell].WeatherOfCity?.hourly[indexPath.row].humidity
        
        // DateFormatter時間轉換
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH"
        dateFormatter.timeZone = TimeZone.current
        
        // 從API得到原始時間戳記
        let timeStamp = String(CityWeather[indexforCollcell].WeatherOfCity?.hourly[indexPath.row].dt ?? 0)
        let timeIntervel = TimeInterval(timeStamp)
        let currentUTC = Date(timeIntervalSince1970: timeIntervel!)
        
        // 把原始時間塞進DateFormatter轉成String
        let ForecastTime = dateFormatter.string(from: currentUTC)
        
        // Cell顯示內容
        cell.TimeLabel.text = "\(ForecastTime):00"
        cell.TempLabel.text = String(format: "%.f", Temp ?? 0)
        cell.HumiLabel.text = String(format: "%.f", Humi ?? 0)
        cell.HumiLabel.text?.append("%") // 濕度加上百分比符號
        cell.TempLabel.text?.append("°C")

        // 抓圖準備
        let IconId = CityWeather[indexforCollcell].WeatherOfCity?.hourly[indexPath.row].weather[0].icon ?? ""
        let IconUrl = "https://openweathermap.org/img/wn/\(IconId)@2x.png"
        // 先把舊的圖刪掉
        cell.ConditionImageView.image = nil
        
        // 用dataTask直接抓圖片
        if let url = URL(string: IconUrl){
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let data = data{
                    DispatchQueue.main.async {
                        cell.ConditionImageView.image = UIImage(data: data)
                        print(IconUrl)
                    }
                }
            }.resume()
        }
        
        return cell
    }
    
 
    @IBOutlet weak var CityNameZHTW: UILabel!
    @IBOutlet weak var CityNameEN: UILabel!
    
    @IBOutlet weak var WeatherCondLabel: UILabel!
    
    @IBOutlet weak var CurrentTemp: UILabel!
    @IBOutlet weak var CurrentFeelsLike: UILabel!
    @IBOutlet weak var CurrentHumidity: UILabel!
    @IBOutlet weak var CurrentWindSpeed: UILabel!
    
    @IBOutlet weak var WeatherImage: UIImageView!
    
    
    func setimage(imageview : UIImageView){
        imageview.alpha = 0.4
        imageview.contentMode = .scaleAspectFill
    }
    
    
        
}


