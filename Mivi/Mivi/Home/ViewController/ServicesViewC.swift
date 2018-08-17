//
//  ServicesViewC.swift
//  Mivi
//
//  Created by Talentedge on 17/08/18.
//  Copyright © 2018 Sample. All rights reserved.
//

import UIKit

class ServicesViewC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var services = [Service]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Services"
        self.navigationController?.isNavigationBarHidden = false

        if let servicesArr = DataParser.servicesModels() {
            self.services.append(contentsOf: servicesArr)
            // TableView Setup
            self.tableView.registerMultiple(nibs: [ServiceTVCell.className])
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

extension ServicesViewC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return services.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return self.cellForIdentifier(ServiceTVCell.className, indexPath: indexPath, tableView)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
}

extension ServicesViewC {
    
    func cellForIdentifier(_ identifier: String, indexPath: IndexPath, _ tableView: UITableView) -> UITableViewCell {
        
        switch identifier {
        case ServiceTVCell.className:
            if let cell = tableView.dequeueReusableCell(withIdentifier: ServiceTVCell.className, for: indexPath) as? ServiceTVCell {
                let data = services[indexPath.row]
                cell.configureWith(service: data)
                return cell
            }
            return UITableViewCell()
        default:
            return UITableViewCell()
        }
    }
}
