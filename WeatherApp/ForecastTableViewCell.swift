//
//  ForecastTableViewCell.swift
//  WeatherApp
//
//  Created by tantsunsin on 2020/8/15.
//

import UIKit

class ForecastTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBOutlet weak var TimeLabel: UILabel!
    @IBOutlet weak var ConditionImageView: UIImageView!
    @IBOutlet weak var TempLabel: UILabel!
    @IBOutlet weak var HumiLabel: UILabel!
    
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
