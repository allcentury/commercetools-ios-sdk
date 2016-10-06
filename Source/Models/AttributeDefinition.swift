//
// Copyright (c) 2016 Commercetools. All rights reserved.
//

import ObjectMapper

public struct AttributeDefinition: Mappable {
    
    // MARK: - Properties

    var type: AttributeType?
    var name: String?
    var label: [String: String]?
    var inputTip: [String: String]?
    var isRequired: Bool?
    var isSearchable: Bool?
    
    public init?(map: Map) {}
    
    // MARK: - Mappable
    
    mutating public func mapping(map: Map) {
        type               <- map["type"]
        name               <- map["name"]
        label              <- map["label"]
        inputTip           <- map["inputTip"]
        isRequired         <- map["isRequired"]
        isSearchable       <- map["isSearchable"]
    }
    
}
