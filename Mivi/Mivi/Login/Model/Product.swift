//
//  Product.swift
//  Mivi
//
//  Created by Talentedge on 16/08/18.
//  Copyright © 2018 Sample. All rights reserved.
//

import Foundation

public final class Product {
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    private struct SerializationKeys {
        static let type = "type"
        static let id = "id"
        static let attributes = "attributes"
    }
    
    // MARK: Properties
    public var type: String?
    public var id: String?
    public var attributes: ProductAttributes?
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
        type = json[SerializationKeys.type].string
        id = json[SerializationKeys.id].string
        attributes = ProductAttributes(json: json[SerializationKeys.attributes])
    }
}



