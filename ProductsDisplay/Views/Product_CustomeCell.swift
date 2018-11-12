//
//  Product_CustomeCell.swift
//  ProductsDisplay
//
//  Created by Yahia El-Dow on 11/11/18.
//  Copyright © 2018 com.p-codes. All rights reserved.
//

import UIKit

class Product_CustomeCell: UITableViewCell {

    @IBOutlet weak var product_lbl_name: UILabel!
    @IBOutlet weak var product_lbl_price: UILabel!
    @IBOutlet weak var product_image: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.product_lbl_name.text = ""
        self.product_lbl_price.text = "" 
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
