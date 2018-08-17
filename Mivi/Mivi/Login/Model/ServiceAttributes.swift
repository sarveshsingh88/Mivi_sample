//
//  ServiceAttributes.swift
//  Mivi
//
//  Created by Talentedge on 16/08/18.
//  Copyright © 2018 Sample. All rights reserved.
//

import Foundation

public final class ServiceAttributes {
    
//    "msn": "0468874507",
//    "credit": 1200,
//    "credit-expiry": "2016-11-20",
//    "data-usage-threshold": false

    // MARK: Declaration for string constants to be used to decode and also serialize.
    private struct SerializationKeys {
        static let msn = "msn"
        static let credit = "credit"
        static let creditExpiry = "credit-expiry"
        static let dataUsageThreshold = "data-usage-threshold"
    }
    
    // MARK: Properties
    public var msn: String?
    public var credit: Int?
    public var creditExpiry: String?
    public var dataUsageThreshold: Bool?
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
        msn = json[SerializationKeys.msn].string
        credit = json[SerializationKeys.credit].int
        creditExpiry = json[SerializationKeys.creditExpiry].string
        dataUsageThreshold = json[SerializationKeys.dataUsageThreshold].bool
    }
}

