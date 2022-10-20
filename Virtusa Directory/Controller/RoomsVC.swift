//
//  RoomsVC.swift
//  Virtusa Directory
//
//  Created by Preeteesh Remalli on 20/10/22.
//

import UIKit

class RoomsVC: UIViewController {
    @IBOutlet weak var roomsTableView: UITableView!
    var roomsArray = [RoomVM]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let roomVM = RoomsViewModel()
        roomVM.getRoomsList { rooms in
            self.roomsArray = rooms
            DispatchQueue.main.async {
                self.roomsTableView.reloadData()
            }
            
        }
        
    }
    @IBAction func signOutTapped(_ sender: Any) {
        let rootViewController = self.view.window?.rootViewController as? UINavigationController
        rootViewController?.setViewControllers([rootViewController!.viewControllers.first!],
        animated: false)
        rootViewController?.dismiss(animated: true, completion: nil)
    }
}
extension RoomsVC: UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return roomsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "roomCell") as? RoomCell
        cell?.configureCell(room: roomsArray[indexPath.row])
        
        return cell!
    }
    
    
}
