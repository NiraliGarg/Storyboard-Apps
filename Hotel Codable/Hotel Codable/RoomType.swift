//
//  RoomType.swift
//  Hotel Codable
//
//  Created by GEU on 12/01/26.
//

import Foundation
struct RoomType:Equatable
{
    var id:Int
    var name:String
    var shortName:String
    var price:Int
    static func==(lhs: RoomType, rhs: RoomType) -> Bool
    {
        return lhs.id == rhs.id
    }
}
