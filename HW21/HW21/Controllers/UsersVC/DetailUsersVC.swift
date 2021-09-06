//
//  DetailUsersVC.swift
//  HW21
//
//  Created by Powroli on 24.07.21.
//

import UIKit

class DetailUsersVC: UIViewController {

    var index: Int!

    var user: User!

    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var phoneLbl: UILabel!
    @IBOutlet weak var websiteLbl: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        set()
    }

    private func set() {
        title = user.name
        emailLbl.text = user.email
        phoneLbl.text = user.phone
        websiteLbl.text = user.website
    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowCompany" {
            let detail = segue.destination as! CompanyVC
            detail.index = index
            detail.user = user
        } else if segue.identifier == "ShowAddress" {
            let detail = segue.destination as! AddressVC
            detail.index = index
            detail.user = user
        }
    }
}
