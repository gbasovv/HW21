//
//  ImageVC.swift
//  HW21
//
//  Created by Powroli on 23.07.21.
//

import UIKit

class ImageVC: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    private let imageUrl =
        "https://media.cntraveler.com/photos/60596b398f4452dac88c59f8/4:5/w_2132,h_2665,c_limit/MtFuji-GettyImages-959111140.jpg"

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchImage()
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
    }

    private func fetchImage() {
        guard let url = URL(string: imageUrl) else { return }
        URLSession.shared.dataTask(with: url) { data, _, _ in
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.activityIndicator.stopAnimating()
                    self.imageView.image = image
                }
            }
        }.resume()
    }
}
