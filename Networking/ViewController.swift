//
//  ViewController.swift
//  Networking
//
//  Created by Никита Коголенок on 24.03.21.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Variables
    let urlImage: String = "https://applelives.com/wp-content/uploads/2016/03/iPhone-SE-11.jpeg"
    // MARK: - Outlet
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var getImageButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityIndicator.isHidden = true
        activityIndicator.hidesWhenStopped = true
    }
    // MARK: - Action
    @IBAction func getImagePressed(_ sender: Any) {
        
        label.isHidden = true
        getImageButton.isEnabled = false
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        
        guard let url = URL(string: urlImage) else { return }
        // singleton
        let session = URLSession.shared
        
        session.dataTask(with: url) { (data, response, error) in
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.activityIndicator.stopAnimating()
                    self.imageView.image = image
                }
            }
        }.resume()
    }
}

