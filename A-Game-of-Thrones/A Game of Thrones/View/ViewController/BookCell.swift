//
//  BookCell.swift
//  A Game of Thrones
//
//  Created by SENTHILKUMAR on 11/01/19.
//  Copyright © 2019 Personal. All rights reserved.
//

import UIKit

class BookCell: UITableViewCell {

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var autherLabel: UILabel!
    @IBOutlet var numberofPagesLabel: UILabel!
    @IBOutlet var isbnLabel: UILabel!
    @IBOutlet var publisherLabel: UILabel!
    @IBOutlet var countryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
