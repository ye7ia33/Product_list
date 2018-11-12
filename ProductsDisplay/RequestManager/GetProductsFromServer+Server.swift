//
//  GetProductsFromServer+Server.swift
//  ProductsDisplay
//
//  Created by Yahia El-Dow on 11/11/18.
//  Copyright © 2018 com.p-codes. All rights reserved.
//

import UIKit
import SwiftyJSON


extension Server {
    
    class Products {
        
        class func get(Product_info_array: @escaping (_ result: [Product] )->()){
            let url = "https://limitless-forest-98976.herokuapp.com"
            var product_data =  [Product]()
            Server.GetRequest(request_url: url) { (data) in
                let json = JSON(data)
                for val in json["data"] {
                    let eachElement = JSON(val.1)
                    var id  = 0
                    var name  = ""
                    var description  = ""
                    var image_url = ""
                    var price = 0.0
                    if let _tempVal = eachElement["id"].int {
                        id = _tempVal
                    }
                    if let _tempVal = eachElement["name"].string {
                        name = _tempVal
                    }
                    if let _tempVal = eachElement["productDescription"].string {
                        description = _tempVal
                    }
                    if let _tempVal = eachElement["price"].double {
                        price = _tempVal
                    }
                  
                    
                    image_url = eachElement["image"]["link"].string ?? ""
                    
                    
                    var product_model = Product()
                    product_model.id = id
                    product_model.name = name
                    product_model.description = description
                    product_model.price = price
                    product_model.image_url = image_url
                    
                    product_data.append(product_model)
                    
                }
                
                Product_info_array(product_data)
                
            }
            
        }
    }
}
