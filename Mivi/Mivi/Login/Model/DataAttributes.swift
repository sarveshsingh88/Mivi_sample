//
//  DataAttributes.swift
//  Mivi
//
//  Created by Talentedge on 16/08/18.
//  Copyright © 2018 Sample. All rights reserved.
//

import Foundation

public final class DataAttributes {
    
//    "payment-type": "prepaid",
//    "unbilled-charges": null,
//    "next-billing-date": null,
//    "title": "Ms",
//    "first-name": "Joe",
//    "last-name": "Bloggs",
//    "date-of-birth": "1985-01-01",
//    "contact-number": "0404000000",
//    "email-address": "test@mivi.com",
//    "email-address-verified": false,
//    "email-subscription-status": false

    // MARK: Declaration for string constants to be used to decode and also serialize.
    private struct SerializationKeys {
        static let paymentType = "payment-type"
        static let unbilledCharges = "unbilled-charges"
        static let nextBillingDate = "next-billing-date"
        static let title = "title"
        static let firstName = "first-name"
        static let lastName = "last-name"
        static let dateOfBirth = "date-of-birth"
        static let contactNumber = "contact-number"
        static let emailAddress = "email-address"
        static let emailAddressVerified = "email-address-verified"
        static let emailSubscriptionStatus = "email-subscription-status"
    }
    
    // MARK: Properties
    public var paymentType: String?
    public var unbilledCharges: String?
    public var nextBillingDate: String?
    public var title: String?
    public var firstName: String?
    public var lastName: String?
    public var dateOfBirth: String?
    public var contactNumber: String?
    public var emailAddress: String?
    public var emailAddressVerified: Bool?
    public var emailSubscriptionStatus: Bool?
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
        paymentType = json[SerializationKeys.paymentType].string
        unbilledCharges = json[SerializationKeys.unbilledCharges].string
        nextBillingDate = json[SerializationKeys.nextBillingDate].string
        title = json[SerializationKeys.title].string
        firstName = json[SerializationKeys.firstName].string
        lastName = json[SerializationKeys.lastName].string
        dateOfBirth = json[SerializationKeys.dateOfBirth].string
        contactNumber = json[SerializationKeys.contactNumber].string
        emailAddress = json[SerializationKeys.emailAddress].string
        emailAddressVerified = json[SerializationKeys.emailAddressVerified].bool
        emailSubscriptionStatus = json[SerializationKeys.emailSubscriptionStatus].bool
    }
}

