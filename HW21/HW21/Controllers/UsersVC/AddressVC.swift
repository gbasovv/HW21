//
//  AddressVC.swift
//  HW21
//
//  Created by Powroli on 24.07.21.
//

import UIKit
import YandexMapsMobile

class AddressVC: UIViewController {

    var index: Int!

    var user: User!

    @IBOutlet weak var mapView: YMKMapView!
    @IBOutlet weak var streetLbl: UILabel!
    @IBOutlet weak var suiteLbl: UILabel!
    @IBOutlet weak var cityLbl: UILabel!
    @IBOutlet weak var zipcodeLbl: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        set()
        mapView.mapWindow.map.move(
            with: YMKCameraPosition.init(target: YMKPoint(latitude: setLat(), longitude: setLng()), zoom: 15, azimuth: 0, tilt: 0),
            animationType: YMKAnimation(type: YMKAnimationType.smooth, duration: 5),
            cameraCallback: nil)
    }

    private func set() {
        streetLbl.text = user.address?.street
        suiteLbl.text = user.address?.suite
        cityLbl.text = user.address?.city
        zipcodeLbl.text = user.address?.zipcode
    }

    private func setLat() -> Double {
        guard let lat = user.address?.geo?.lat else { return 55.751574 }
        guard let latitude = Double(lat) else { return 55.751574 }
        return latitude
    }

    private func setLng() -> Double {
        guard let lng = user.address?.geo?.lng else { return 37.573856 }
        guard let longitude = Double(lng) else { return 37.573856 }
        return longitude
    }
}
