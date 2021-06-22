//
//  ExerciseTableViewCell.swift
//  SportsTimer
//
//  Created by Daniel Yamrak on 22.06.2021.
//

import UIKit

class ExerciseTableViewCell: UITableViewCell {

    @IBOutlet weak var exNameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var restTimeLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
