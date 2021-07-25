//
//  CollectionVC.swift
//  HW21
//
//  Created by Powroli on 23.07.21.
//

import UIKit

enum UserActions: String, CaseIterable {
    case downloadImage = "Download Image"
    case users = "Users"
}

class CollectionVC: UICollectionViewController {

    private let userActions = UserActions.allCases

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return userActions.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserActionCell", for: indexPath) as! CollectionViewCell
        cell.userActionLbl.text = userActions[indexPath.item].rawValue
        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let userActions = userActions[indexPath.item]
        switch userActions {
        case .downloadImage:
            performSegue(withIdentifier: "ShowImage", sender: self)
        case .users:
            performSegue(withIdentifier: "ShowUsers", sender: self)
        }
    }
}

extension CollectionVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: (UIScreen.main.bounds.width - 20), height: 80)
    }
}
