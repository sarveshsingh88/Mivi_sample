//
//  LoginInputTableViewCell.swift
//  BConnected
//
//  Created by Nadeem Akram on 02/11/17.
//  Copyright © 2017 BConnected. All rights reserved.
//

import UIKit

class ServiceTVCell: UITableViewCell {

    @IBOutlet weak var lblTitleMSN: UILabel!
    @IBOutlet weak var lblMSN: UILabel!
    @IBOutlet weak var lblTitleCredit: UILabel!
    @IBOutlet weak var lblCredit: UILabel!
    @IBOutlet weak var lblTitleCreditExpiry: UILabel!
    @IBOutlet weak var lblCreditExpiry: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        lblTitleMSN.setFont(size: .small, type: .medium, color: .titleLabel)
        lblMSN.setFont(size: .small, type: .regular, color: .valueLabel)
        lblTitleCredit.setFont(size: .small, type: .medium, color: .titleLabel)
        lblCredit.setFont(size: .small, type: .regular, color: .valueLabel)
        lblTitleCreditExpiry.setFont(size: .small, type: .medium, color: .titleLabel)
        lblCreditExpiry.setFont(size: .small, type: .regular, color: .valueLabel)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
  func configureWith(service: Service) {
    
    let notAvailable = "Not Available"
    
    lblTitleMSN.text = "MSN"
    lblMSN.text = service.attributes?.msn ?? notAvailable
    lblTitleCredit.text = "Credit"
    lblCredit.text = "\(service.attributes?.credit ?? 0)"
    lblTitleCreditExpiry.text = "Expiry"
    lblCreditExpiry.text = service.attributes?.creditExpiry ?? notAvailable
  }
}
