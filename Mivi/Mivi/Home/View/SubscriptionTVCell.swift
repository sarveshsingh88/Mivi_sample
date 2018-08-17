//
//  LoginInputTableViewCell.swift
//  BConnected
//
//  Created by Nadeem Akram on 02/11/17.
//  Copyright © 2017 BConnected. All rights reserved.
//

import UIKit

class SubscriptionTVCell: UITableViewCell {


    @IBOutlet weak var lblTitleDataBalance: UILabel!
    @IBOutlet weak var lblDataBalance: UILabel!
    @IBOutlet weak var lblTitleCreditBalance: UILabel!
    @IBOutlet weak var lblCreditBalance: UILabel!
    @IBOutlet weak var lblTitleExpiryDate: UILabel!
    @IBOutlet weak var lblExpiryDate: UILabel!
    @IBOutlet weak var lblTitleAutoRenewal: UILabel!
    @IBOutlet weak var lblAutoRenewal: UILabel!
    @IBOutlet weak var lblTitlePrimarySubscription: UILabel!
    @IBOutlet weak var lblPrimarySubscription: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        lblTitleDataBalance.setFont(size: .small, type: .medium, color: .titleLabel)
        lblDataBalance.setFont(size: .small, type: .regular, color: .valueLabel)
        lblTitleCreditBalance.setFont(size: .small, type: .medium, color: .titleLabel)
        lblCreditBalance.setFont(size: .small, type: .regular, color: .valueLabel)
        lblTitleExpiryDate.setFont(size: .small, type: .medium, color: .titleLabel)
        lblExpiryDate.setFont(size: .small, type: .regular, color: .valueLabel)
        lblTitleAutoRenewal.setFont(size: .small, type: .medium, color: .titleLabel)
        lblAutoRenewal.setFont(size: .small, type: .regular, color: .valueLabel)
        lblTitlePrimarySubscription.setFont(size: .small, type: .medium, color: .titleLabel)
        lblPrimarySubscription.setFont(size: .small, type: .regular, color: .valueLabel)

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    
  func configureWith(subscription: Subscription) {
    
    let notAvailable = "Not Available"
    
    lblTitleDataBalance.text = "Data"
    lblDataBalance.text = subscription.attributes?.includedDataBalance ?? notAvailable
    lblTitleCreditBalance.text = "Credit"
    lblCreditBalance.text = subscription.attributes?.includedCreditBalance ?? notAvailable
    lblTitleExpiryDate.text = "Expiry date"
    lblExpiryDate.text = subscription.attributes?.expiryDate ?? notAvailable
    lblTitleAutoRenewal.text = "Auto renewal"
    if let autoRenewal = subscription.attributes?.autoRenewal {
        lblAutoRenewal.text = autoRenewal == true ? "Yes" : "No"
    } else {
        lblAutoRenewal.text = notAvailable
    }
    lblTitlePrimarySubscription.text = "Primary Subs."
    if let primarySubscription = subscription.attributes?.primarySubscription {
        lblPrimarySubscription.text = primarySubscription == true ? "Yes" : "No"
    } else {
        lblPrimarySubscription.text = notAvailable
    }
  }
}
