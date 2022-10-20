//
//  RoomsModel.swift
//  Virtusa Directory
//
//  Created by Preeteesh Remalli on 20/10/22.
//

import Foundation
struct RoomsModel: Codable {
    let createdAt: String?
    let isOccupied: Bool?
    let maxOccupancy: Int?
    let id: String?
}

typealias Rooms = [RoomsModel]
