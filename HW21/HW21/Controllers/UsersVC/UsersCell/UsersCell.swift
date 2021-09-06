//
//  UsersCell.swift
//  HW21
//
//  Created by Powroli on 23.07.21.
//

import UIKit

class UsersCell: UITableViewCell {

    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var usernameLbl: UILabel!

    func configure(with user: User) {
        nameLbl.text = user.name
        usernameLbl.text = user.username
    }

}
