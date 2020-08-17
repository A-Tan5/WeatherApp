//
//  WeatherCollectionViewController.swift
//  WeatherApp
//
//  Created by tantsunsin on 2020/8/15.
//

import UIKit

private let reuseIdentifier = "WeatherCondition"
//var indexforCollcell : Int!


class WeatherCollectionViewController: UICollectionViewController  {

   

    
    override func viewDidLoad() {
        super.viewDidLoad()



        self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
//        self.collectionView!.register(WeatherCollectionViewCell.self, forCellWithReuseIdentifier: "WeatherCondition")

        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 3
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WeatherCondition", for: indexPath) as! WeatherCollectionViewCell
        

             
        let urlstr = "https://api.openweathermap.org/data/2.5/onecall?\(CityWeather[indexPath.row].GeoCor)&units=metric&lang=zh_tw&exclude=minutely&appid=36e315f09cd337861ef6105d8b41b3ec"

        
        if let url = URL(string: urlstr){
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let data = data, let weatherresults = try? JSONDecoder().decode(WeatherObject.self, from: data){
                    DispatchQueue.main.async {
                        CityWeather[indexPath.row].WeatherOfCity = weatherresults
                        self.collectionView.reloadData()
                    }
                }
            }.resume()
            
        }
        
        let Weather = CityWeather[indexPath.row].WeatherOfCity
        
        cell.CityNameZHTW.text = CityWeather[indexPath.row].CityNameZHTW
        cell.CityNameEN.text = CityWeather[indexPath.row].CityNameEN

        
        let tempDegreeC = String(format: "%.1f", (Weather?.current?.temp ?? 0))
        let FeelsLikeDegreeC = String(format: "%.1f",  (Weather?.current?.feels_like ?? 0))
        
        cell.WeatherCondLabel.text = String(Weather?.current?.weather[0].description ?? "")
        cell.CurrentTemp.text = tempDegreeC
        cell.CurrentFeelsLike.text = FeelsLikeDegreeC
        cell.CurrentHumiduty.text = String(Weather?.current?.humidity ?? 0)
        cell.CurrentWindSpeed.text = String(Weather?.current?.wind_speed ?? 0)
        
        switch Weather?.current?.weather[0].main {
        case "Clouds":
            cell.WeatherImage.image = UIImage(named: "Clouds")
            cell.setimage(imageview: cell.WeatherImage)
        case "Clear":
            cell.WeatherImage.image = UIImage(named: "Clear")
            cell.setimage(imageview: cell.WeatherImage)

        case "Rain":
            cell.WeatherImage.image = UIImage(named: "Rain")
            cell.setimage(imageview: cell.WeatherImage)

        case "Thunderstorm":
            cell.WeatherImage.image = UIImage(named: "Thunderstorm")
            cell.setimage(imageview: cell.WeatherImage)

        default:
            break
        }
        
//        indexforCollcell = indexPath.row
        
        
        
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
