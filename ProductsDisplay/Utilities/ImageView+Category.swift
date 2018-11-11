//
//  ImageView+Category.swift
//  Forma
//
//  Created by Yahia El-Dow on 7/21/18.
//  Copyright © 2018 P-Codes. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
import Kingfisher

let imageCache = NSCache<NSString, UIImage>()
extension UIImageView {
        func loadImageFromUrl (imgUrl : String){
            let url = URL(string: imgUrl)
            self.kf.setImage(with: url)
        }
}
