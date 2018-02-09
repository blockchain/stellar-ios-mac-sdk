//
//  AllEffectsLinksResponse.swift
//  stellarsdk
//
//  Created by Rogobete Christian on 08.02.18.
//  Copyright © 2018 Soneso. All rights reserved.
//

/// Represents the links connected to the all effects response.
/// Horizon API Request GET /effects{?cursor,limit,order}
/// See [Horizon API](https://www.stellar.org/developers/horizon/reference/endpoints/effects-all.html "All Effects")
public class AllEffectsLinksResponse: NSObject, Decodable {
    
    /// Link to the current all effects request URL.
    public var selflink:LinkResponse
    
    /// Link to the next "page" of the result.
    public var next:LinkResponse!
    
    /// Link to the previous "page" of the result.
    public var prev:LinkResponse!
    
    
    // Properties to encode and decode.
    enum CodingKeys: String, CodingKey {
        case selflink = "self"
        case next
        case prev
    }
    
    /**
     Initializer - creates a new instance by decoding from the given decoder.
     
     - Parameter decoder: The decoder containing the data
     */
    public required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        selflink = try values.decode(LinkResponse.self, forKey: .selflink)
        next = try values.decodeIfPresent(LinkResponse.self, forKey: .next)
        prev = try values.decodeIfPresent(LinkResponse.self, forKey: .prev)
    }
}