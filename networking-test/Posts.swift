//
//  Posts.swift
//  networking-test
//
//  Created by oliver on 25.05.21.
//

//import Foundation
import Arrow
import Networking

struct MyPost: NetworkingJSONDecodable {
    var id = 0
    var title = ""
    var body = ""
    var userId = 0
}
extension MyPost: ArrowParsable {
    mutating func deserialize(_ json: JSON) {
        id <-- json["id"]
        title <-- json["title"]
        body <-- json["body"]
        userId <-- json["userID"]
    }
}
extension ArrowParsable where Self: NetworkingJSONDecodable {

    public static func decode(_ json: Any) throws -> Self {
        var t: Self = Self()
        if let arrowJSON = JSON(json) {
            t.deserialize(arrowJSON)
        }
        return t
    }
}
