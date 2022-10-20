//
//  PeopleVC.swift
//  Virtusa Directory
//
//  Created by Preeteesh Remalli on 20/10/22.
//

import UIKit

class PeopleVC: UIViewController {
    @IBOutlet weak var peopleTableView: UITableView!
    var peopleArray = [EmployeeVM]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let personVM = EmployeeViewModel()
        personVM.getPersonsList { person in
            self.peopleArray = person
            DispatchQueue.main.async {
                self.peopleTableView.reloadData()
            }
        }
        
    }
    

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! EmployeeDetailsVC
        if (sender as? EmployeeVM) != nil {
            destinationVC.employeeVM = sender as? EmployeeVM
        }
    }
    @IBAction func signOutTapped(_ sender: Any) {
        let rootViewController = self.view.window?.rootViewController as? UINavigationController
        rootViewController?.setViewControllers([rootViewController!.viewControllers.first!],
        animated: false)
        rootViewController?.dismiss(animated: true, completion: nil)
    }
    
}
extension PeopleVC: UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return peopleArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "peopleCell") as? PeopleCell
        cell?.configureCell(employee: peopleArray[indexPath.row])
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "detailVC", sender: peopleArray[indexPath.row])
    }
    
}
