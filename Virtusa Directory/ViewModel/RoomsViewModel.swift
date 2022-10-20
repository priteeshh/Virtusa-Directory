//
//  RoomsViewModel.swift
//  Virtusa Directory
//
//  Created by Preeteesh Remalli on 20/10/22.
//

import Foundation

class RoomsViewModel{
    
    func getRoomsList(completion : @escaping ([RoomVM]) -> ()){
        let resource = Resource<[RoomsModel]>(url : URL(string: roomsUrl)!)
        WebServices.shared.load(resource: resource) { result in
            switch result {
            case .success(let rawRoomResults):
                completion(RoomsArrayVM(room: rawRoomResults).roomArray)
            case .failure(let error):
                print(error)
            }
        }
    }
}

class RoomsArrayVM{
    var roomArray = [RoomVM]()
    
    init(room : [RoomsModel]){
        for r in room{
            self.roomArray.append(RoomVM(data: r))
        }
    }
}
class RoomVM{
    
    var isOccupied: String
    var maxOccupancy: String
    var id: String
    
    init(data : RoomsModel){
        self.id = "Room No. : \(data.id ?? "")"
        if let maxOccupancy = data.maxOccupancy{
            self.maxOccupancy = "Max. Occupancy : \(maxOccupancy)"
        }else{
            self.maxOccupancy = ""
        }
        if let isOccupied = data.isOccupied{
            self.isOccupied = "Availablity : \(isOccupied ? "YES" : "NO")"
        }else{
            self.isOccupied = ""
        }
    }
    
}

