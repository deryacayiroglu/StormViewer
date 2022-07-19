//
//  DetailViewController.swift
//  Project1
//
//  Created by Derya Çayıroğlu on 14.07.2022.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    var selectedImage: String?
    var picturesSize = 0
    var selectedPicturesSize = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Picture \(selectedPicturesSize+1) of \(picturesSize)"
        navigationItem.largeTitleDisplayMode = .never
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
 
        if let imageToLoad = selectedImage{
            imageView.image = UIImage(named: imageToLoad)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }

    @objc func shareTapped(){
        guard let image = imageView.image?.jpegData(compressionQuality: 0.8) else{
            print("No image found")
            return
        }
        
        var shareItem: [Any] = [image]
        if let imageText = selectedImage{
            shareItem.append(imageText)
        }
        
        let vc = UIActivityViewController(activityItems: shareItem, applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true )
    }

}
