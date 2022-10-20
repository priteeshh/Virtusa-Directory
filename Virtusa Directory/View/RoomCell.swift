//
//  RoomCell.swift
//  Virtusa Directory
//
//  Created by Preeteesh Remalli on 20/10/22.
//

import UIKit

class RoomCell: UITableViewCell {

    @IBOutlet weak var roomIdLable: UILabel!
    @IBOutlet weak var roomMaxOccupancyLabel: UILabel!
    @IBOutlet weak var isOccupied: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configureCell(room : RoomVM){
        roomIdLable.text = room.id
        roomMaxOccupancyLabel.text = room.maxOccupancy
        isOccupied.text = room.isOccupied
    }

}
