//
//  EmployeeDetailsVC.swift
//  Virtusa Directory
//
//  Created by Preeteesh Remalli on 20/10/22.
//

import UIKit

class EmployeeDetailsVC: UIViewController {
    var employeeVM : EmployeeVM? {
        didSet{
            //updateDetails()
        }
    }
    @IBOutlet weak var avatarView: UIImageView!
    @IBOutlet weak var nameLable: UILabel!
    @IBOutlet var jobTitle: UILabel!
    @IBOutlet weak var emailLable: UILabel!
    @IBOutlet weak var favoriteColor: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        updateDetails()
        // Do any additional setup after loading the view.
    }
    
    func updateDetails(){
        
        guard let eVM = employeeVM else {
            return
        }
        nameLable.text = eVM.name
        jobTitle.text = eVM.jobTitle
        emailLable.text = eVM.email
        favoriteColor.text = eVM.favouriteColor
        
        
        guard let url = URL(string: eVM.avatarImage) else{
            return
        }
        if let picDat = try? Data(contentsOf: url){
            avatarView.image = UIImage(data: picDat)
        }
        
    }
    @IBAction func signOutTapped(_ sender: Any) {
        let rootViewController = self.view.window?.rootViewController as? UINavigationController
        rootViewController?.setViewControllers([rootViewController!.viewControllers.first!],
        animated: false)
        rootViewController?.dismiss(animated: true, completion: nil)
    }
}
