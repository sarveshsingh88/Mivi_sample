//
//  ProductAttributes.swift
//  Mivi
//
//  Created by Talentedge on 16/08/18.
//  Copyright © 2018 Sample. All rights reserved.
//

import Foundation

public final class ProductAttributes {
    
//    "name": "UNLIMITED 7GB",
//    "included-data": null,
//    "included-credit": null,
//    "included-international-talk": null,
//    "unlimited-text": true,
//    "unlimited-talk": true,
//    "unlimited-international-text": false,
//    "unlimited-international-talk": false,
//    "price": 3990

    // MARK: Declaration for string constants to be used to decode and also serialize.
    private struct SerializationKeys {
        static let name = "name"
        static let includedData = "included-data"
        static let includedCredit = "included-credit"
        static let includedInternationalTalk = "included-international-talk"
        static let unlimitedText = "unlimited-text"
        static let unlimitedTalk = "unlimited-talk"
        static let unlimitedInternationalText = "unlimited-international-text"
        static let unlimitedInternationalTalk = "unlimited-international-talk"
        static let price = "price"
    }
    
    // MARK: Properties
    public var name: String?
    public var includedData: String?
    public var includedCredit: String?
    public var includedInternationalTalk: String?
    public var unlimitedText: Bool?
    public var unlimitedTalk: Bool?
    public var unlimitedInternationalText: Bool?
    public var unlimitedInternationalTalk: Bool?
    public var price: Int?

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
        name = json[SerializationKeys.name].string
        includedData = json[SerializationKeys.includedData].string
        includedCredit = json[SerializationKeys.includedCredit].string
        includedInternationalTalk = json[SerializationKeys.includedInternationalTalk].string
        unlimitedText = json[SerializationKeys.unlimitedText].bool
        unlimitedTalk = json[SerializationKeys.unlimitedTalk].bool
        unlimitedInternationalText = json[SerializationKeys.unlimitedInternationalText].bool
        unlimitedInternationalTalk = json[SerializationKeys.unlimitedInternationalTalk].bool
        price = json[SerializationKeys.price].int

    }
}



