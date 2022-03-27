//
//  TemperatureTableViewCell.swift
//  VK-Super-App-Kit-2022
//
//  Created by Ekaterina Volkova on 28/03/2022.
//

import UIKit

class TemperatureTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //add cell identifier
    static let identifier = "TemperatureTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "TemperatureTableViewCell", bundle: nil)
    }
    
}
