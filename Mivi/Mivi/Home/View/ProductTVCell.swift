//
//  LoginInputTableViewCell.swift
//  BConnected
//
//  Created by Nadeem Akram on 02/11/17.
//  Copyright © 2017 BConnected. All rights reserved.
//

import UIKit

class ProductTVCell: UITableViewCell {
    
    @IBOutlet weak var lblTitleName: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblTitleData: UILabel!
    @IBOutlet weak var lblData: UILabel!
    @IBOutlet weak var lblTitleCredit: UILabel!
    @IBOutlet weak var lblCredit: UILabel!
    @IBOutlet weak var lblTitleIntTalk: UILabel!
    @IBOutlet weak var lblIntTalk: UILabel!
    @IBOutlet weak var lblTitleUnlText: UILabel!
    @IBOutlet weak var lblUnlText: UILabel!
    @IBOutlet weak var lblTitleUnlTalk: UILabel!
    @IBOutlet weak var lblUnlTalk: UILabel!
//    @IBOutlet weak var lblTitleUnlIntText: UILabel!
//    @IBOutlet weak var lblUnlIntText: UILabel!
//    @IBOutlet weak var lblTitleUnlIntTalk: UILabel!
//    @IBOutlet weak var lblUnlIntTalk: UILabel!
    @IBOutlet weak var lblTitlePrice: UILabel!
    @IBOutlet weak var lblPrice: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        lblTitleName.setFont(size: .small, type: .medium, color: .titleLabel)
        lblName.setFont(size: .small, type: .regular, color: .valueLabel)
        lblTitleData.setFont(size: .small, type: .medium, color: .titleLabel)
        lblData.setFont(size: .small, type: .regular, color: .valueLabel)
        lblTitleCredit.setFont(size: .small, type: .medium, color: .titleLabel)
        lblCredit.setFont(size: .small, type: .regular, color: .valueLabel)
        lblTitleIntTalk.setFont(size: .small, type: .medium, color: .titleLabel)
        lblIntTalk.setFont(size: .small, type: .regular, color: .valueLabel)
        lblTitleUnlText.setFont(size: .small, type: .medium, color: .titleLabel)
        lblUnlText.setFont(size: .small, type: .regular, color: .valueLabel)
        lblTitleUnlTalk.setFont(size: .small, type: .medium, color: .titleLabel)
        lblUnlTalk.setFont(size: .small, type: .regular, color: .valueLabel)
//        lblTitleUnlIntText.setFont(size: .small, type: .medium, color: .titleLabel)
//        lblUnlIntText.setFont(size: .small, type: .regular, color: .valueLabel)
//        lblTitleUnlIntTalk.setFont(size: .small, type: .medium, color: .titleLabel)
//        lblUnlIntTalk.setFont(size: .small, type: .regular, color: .valueLabel)
        lblTitlePrice.setFont(size: .small, type: .medium, color: .titleLabel)
        lblPrice.setFont(size: .small, type: .regular, color: .valueLabel)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
  func configureWith(product: Product) {
    
    let notAvailable = "Not Available"
    //let available = "Available"

    lblTitleName.text = "Name"
    lblName.text = product.attributes?.name ?? notAvailable
    lblTitleData.text = "Data"
    lblData.text = product.attributes?.includedData ?? notAvailable
    lblTitleCredit.text = "Credit"
    lblCredit.text = product.attributes?.includedCredit ?? notAvailable
    lblTitleIntTalk.text = "International Talk"
    lblIntTalk.text = product.attributes?.includedInternationalTalk ?? notAvailable
    lblTitleUnlText.text = "Unlimited Text"
    if let unlimitedInternationalText = product.attributes?.unlimitedInternationalText {
        lblUnlText.text = unlimitedInternationalText == true ? "Yes" : "No"
    } else {
        lblUnlText.text = notAvailable
    }
    lblTitleUnlTalk.text = "Unlimited Talk"
    if let unlimitedInternationalText = product.attributes?.unlimitedInternationalTalk {
        lblUnlTalk.text = unlimitedInternationalText == true ? "Yes" : "No"
    } else {
        lblUnlTalk.text = notAvailable
    }

    lblTitlePrice.text = "Price"
    lblPrice.text = "\(product.attributes?.price ?? 0)"
  }
}
