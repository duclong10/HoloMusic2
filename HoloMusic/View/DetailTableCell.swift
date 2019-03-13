//
//  DetailTableCell.swift
//  HoloMusic
//
//  Created by Trương Thắng on 3/12/19.
//  Copyright © 2019 Trương Thắng. All rights reserved.
//

import UIKit

class DetailTableCell: UITableViewCell {

    @IBOutlet weak var imageAnh: UIImageView!
    
    @IBOutlet weak var lblCs: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblNuber: UILabel!
    @IBOutlet weak var img: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBAction func btn(_ sender: Any) {
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
