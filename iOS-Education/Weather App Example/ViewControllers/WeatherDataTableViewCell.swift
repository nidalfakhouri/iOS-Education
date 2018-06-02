//
//  WeatherDataTableViewCell.swift
//  iOS-Education
//
//  Created by Nidal Fakhouri on 6/1/18.
//  Copyright © 2018 Nidal Fakhouri. All rights reserved.
//

import UIKit

class WeatherDataTableViewCell: UITableViewCell {
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var timeStampLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

    func configure(_ weatherData: WeatherData) {
        if let temperatureInFahrenheit = weatherData.temperatureInFahrenheit, let humidity = weatherData.humidity, let weatherDescription = weatherData.weatherDescription {
            descriptionLabel.text = String(format: "%2.f˚", temperatureInFahrenheit) + " " + String(format: "(%2.f%% Humidity)", humidity) + " " + weatherDescription
        }
        
        if let url = weatherData.iconURL {
            if let data = try? Data(contentsOf: url) {
                iconImageView.image = UIImage(data: data)
            }
        }
        
        if let timestamp = weatherData.date {
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .long
            dateFormatter.timeStyle = .long
            timeStampLabel.text = dateFormatter.string(from: timestamp)
        }
    }
}
