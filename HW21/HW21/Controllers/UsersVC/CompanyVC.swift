//
//  CompanyVC.swift
//  HW21
//
//  Created by Powroli on 24.07.21.
//

import UIKit

class CompanyVC: UIViewController {

    var index: Int!

    var user: User!

    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var bsLbl: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        set()
    }

    private func set() {
        nameLbl.text = user.company?.name
        descriptionLbl.text = user.company?.catchPhrase
        bsLbl.text = user.company?.bs
    }

}
