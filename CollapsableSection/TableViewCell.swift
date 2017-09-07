//
//  TableViewCell.swift
//  CollapsableSection
//
//  Created by Appinventiv Technologies on 07/09/17.
//  Copyright © 2017 Appinventiv Technologies. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    
    
    @IBOutlet weak var lblOne: UILabel!
    
    @IBOutlet weak var lblTwo: UILabel!
    
    @IBOutlet weak var lblCounter: UILabel!
    
    @IBOutlet weak var imgView: UIImageView!
    override func prepareForReuse() {
        super.prepareForReuse()
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
