//
//  TableViewCell.swift
//  newsapi
//
//  Created by Admin on 29/09/23.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var imageview: UIImageView!
    
    @IBOutlet weak var label2: UILabel!
    
    @IBOutlet weak var published: UILabel!
    
    @IBOutlet weak var urllabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
