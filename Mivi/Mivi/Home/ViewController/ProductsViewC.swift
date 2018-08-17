//
//  ProductsViewC.swift
//  Mivi
//
//  Created by Talentedge on 17/08/18.
//  Copyright © 2018 Sample. All rights reserved.
//

import UIKit


class ProductsViewC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var products = [Product]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Product"
        self.navigationController?.isNavigationBarHidden = false
        
        if let servicesArr = DataParser.productsModels() {
            self.products.append(contentsOf: servicesArr)
            // TableView Setup
            self.tableView.registerMultiple(nibs: [ProductTVCell.className])
            self.tableView.estimatedRowHeight = 100
            self.tableView.rowHeight = UITableViewAutomaticDimension
            self.tableView.reloadData()
        }
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ProductsViewC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return self.cellForIdentifier(ProductTVCell.className, indexPath: indexPath, tableView)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
}

extension ProductsViewC {
    
    func cellForIdentifier(_ identifier: String, indexPath: IndexPath, _ tableView: UITableView) -> UITableViewCell {
        
        switch identifier {
        case ProductTVCell.className:
            if let cell = tableView.dequeueReusableCell(withIdentifier: ProductTVCell.className, for: indexPath) as? ProductTVCell {
                let data = products[indexPath.row]
                cell.configureWith(product: data)
                return cell
            }
            return UITableViewCell()
        default:
            return UITableViewCell()
        }
    }
}
