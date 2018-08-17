//
//  SubscriptionAttributes.swift
//  Mivi
//
//  Created by Talentedge on 16/08/18.
//  Copyright © 2018 Sample. All rights reserved.
//

import Foundation


public final class SubscriptionAttributes {
    
    //"included-data-balance": 52400,
    //"included-credit-balance": null,
    //"included-rollover-credit-balance": null,
    //"included-rollover-data-balance": null,
    //"included-international-talk-balance": null,
    //"expiry-date": "2016-11-19",
    //"auto-renewal": true,
    //"primary-subscription": true

    // MARK: Declaration for string constants to be used to decode and also serialize.
    private struct SerializationKeys {
        static let includedDataBalance = "included-data-balance"
        static let includedCreditBalance = "included-credit-balance"
        static let includedRolloverCreditBalance = "included-rollover-credit-balance"
        static let includedRolloverDataBalance = "included-rollover-data-balance"
        static let includedInternationalTalkBalance = "included-international-talk-balance"
        static let expiryDate = "expiry-date"
        static let autoRenewal = "auto-renewal"
        static let primarySubscription = "primary-subscription"
    }
    
    // MARK: Properties
    public var includedDataBalance: String?
    public var includedCreditBalance: String?
    public var includedRolloverCreditBalance: String?
    public var includedRolloverDataBalance: String?
    public var includedInternationalTalkBalance: String?
    public var expiryDate: String?
    public var autoRenewal: Bool?
    public var primarySubscription: Bool?
    ///
    /// - parameter object: The object of either Dictionary or Array kind that was passed.
    /// - returns: An initialized instance of the class.
    public convenience init(object: Any) {
        self.init(json: JSON(object))
    }
    
    /// Initiates the instance based on the JSON that was passed.
    ///
    /// - parameter json: JSON object from SwiftyJSON.
    public required init(json: JSON) {
        includedDataBalance = json[SerializationKeys.includedDataBalance].string
        includedCreditBalance = json[SerializationKeys.includedCreditBalance].string
        includedRolloverCreditBalance = json[SerializationKeys.includedRolloverCreditBalance].string
        includedRolloverDataBalance = json[SerializationKeys.includedRolloverDataBalance].string
        includedInternationalTalkBalance = json[SerializationKeys.includedInternationalTalkBalance].string
        expiryDate = json[SerializationKeys.expiryDate].string
        autoRenewal = json[SerializationKeys.autoRenewal].bool
        primarySubscription = json[SerializationKeys.primarySubscription].bool
    }
}



