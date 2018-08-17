//
//  Link.swift
//  Mivi
//
//  Created by Talentedge on 16/08/18.
//  Copyright © 2018 Sample. All rights reserved.
//

import Foundation
public final class Link {
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    private struct SerializationKeys {
        static let selfKey = "self"
    }
    
    // MARK: Properties
    public var selfKey: String?
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
        selfKey = json[SerializationKeys.selfKey].string
    }
}

