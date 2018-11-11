//
//  Product_Details_VC.swift
//  ProductsDisplay
//
//  Created by Yahia El-Dow on 11/11/18.
//  Copyright © 2018 com.p-codes. All rights reserved.
//

import UIKit

class Product_Details_VC: UIViewController {
    var product_info = Product()

    @IBOutlet weak var product_image: UIImageView!
    @IBOutlet weak var product_name: UILabel!
    @IBOutlet weak var product_price: UILabel!
    @IBOutlet weak var product_description: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.product_image.loadImageFromUrl(imgUrl: self.product_info.image_url)
        self.product_name.text = self.product_info.name
        self.product_price.text = self.product_info.price.description
        self.product_description.text = self.product_info.description
        

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
