//
//  ViewController.swift
//  ProductsDisplay
//
//  Created by Yahia El-Dow on 11/11/18.
//  Copyright © 2018 com.p-codes. All rights reserved.
//

import UIKit

class ProductList_VC: UIViewController {
    var products_list_info_array = [Product]()
   
    @IBOutlet weak var product_tableView: UITableView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nibView = UINib(nibName: "Product_CustomeCell", bundle: nil)
        self.product_tableView.register(nibView, forCellReuseIdentifier: "Products_Cell")


        Server.Products.get { (products_data) in
            self.products_list_info_array .removeAll()
            self.products_list_info_array = products_data
            self.product_tableView.reloadData()
        }
      
        
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        super.prepare(for: segue , sender: sender)
        
        
        if segue.identifier == "open_Products_Details" {
            let vc = segue.destination as? Product_Details_VC
            guard let product = sender as? Product else {return}
            vc?.product_info = product
        }
    }
}


extension ProductList_VC : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return products_list_info_array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "Products_Cell"
        let index = indexPath.section
 
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier , for: indexPath) as! Product_CustomeCell
        cell.selectionStyle = .none
        if products_list_info_array.count <= index {return cell}
        let product_model = products_list_info_array[index]
        cell.product_lbl_name.text = product_model.name
        cell.product_lbl_price.text  = product_model.price.description
        cell.product_image.loadImageFromUrl(imgUrl:product_model.image_url)
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         let index = indexPath.section
        if products_list_info_array.count <= index {return}
        let product_model = products_list_info_array[index]
        self.performSegue(withIdentifier: "open_Products_Details", sender: product_model)
        
    }
    /*
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width ,
                                        height:     tableView.estimatedRowHeight))
        view.backgroundColor = .lightGray
        return view
    }
 */
    
}
