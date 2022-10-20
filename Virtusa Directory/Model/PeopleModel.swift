//
//  PeopleModel.swift
//  Virtusa Directory
//
//  Created by Preeteesh Remalli on 20/10/22.
//

import Foundation
struct PeopleModel: Codable {
    let createdAt, firstName: String?
    let avatar: String?
    let lastName, email, jobtitle, favouriteColor: String?
    let id: String?
    let data: DataClass?
    let to, fromName: String?
}

// MARK: - DataClass
struct DataClass: Codable {
    let title, body, id, toID: String?
    let fromID, meetingid: String?

    enum CodingKeys: String, CodingKey {
        case title, body, id
        case toID = "toId"
        case fromID = "fromId"
        case meetingid
    }
}

typealias People = [PeopleModel]
