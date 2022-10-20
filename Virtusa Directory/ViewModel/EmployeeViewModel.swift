
//
//  EmployeeViewModel.swift
//  Virtusa Directory
//
//  Created by Preeteesh Remalli on 20/10/22.
//

import Foundation

class EmployeeViewModel{
    
    
    func getPersonsList(completion : @escaping ([EmployeeVM]) -> ()){
        let resource = Resource<[PeopleModel]>(url : URL(string: employeeUrl)!)
        WebServices.shared.load(resource: resource) { result in
            switch result {
            case .success(let rawPersonDetails):
                completion(EmployeeArrayVM(person: rawPersonDetails).personArray)
            case .failure(let error):
                print(error)
            }
        }
    }
}

class EmployeeArrayVM{
    var personArray = [EmployeeVM]()
    
    init(person : [PeopleModel]){
        for per in person{
            self.personArray.append(EmployeeVM(data: per))
        }
    }
}
class EmployeeVM{
    
    var name : String
    var email : String
    var avatar : String
    var jobTitle : String
    var favouriteColor : String
    var avatarImage : String
    
    init(data : PeopleModel){
        self.name = "\(data.firstName ?? "") \(data.lastName ?? "") "
        self.email = data.email ?? ""
        self.avatar = data.avatar ?? ""
        self.jobTitle = data.jobtitle ?? ""
        self.favouriteColor = data.favouriteColor ?? ""
        self.avatarImage = data.avatar ?? ""
    }
    
}

