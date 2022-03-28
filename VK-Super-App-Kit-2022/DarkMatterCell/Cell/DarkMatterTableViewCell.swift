//
//  DarkMatterTableViewCell.swift
//  VK-Super-App-Kit-2022
//
//  Created by Ekaterina Volkova on 28/03/2022.
//

import UIKit

class DarkMatterTableViewCell: UITableViewCell {
    
    @IBOutlet var dayTemperature: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //add cell identifier
    static let identifier = "DarkMatterTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "DarkMatterTableViewCell", bundle: nil)
    }
    
    func configure (with model: CellContent){
        self.dayTemperature.text = "\( Int(model.alphanumeric))°"
        self.dateLabel.text = "\(model.date)"
        self.timeLabel.text = "\(model.time)"
    }
    
}
