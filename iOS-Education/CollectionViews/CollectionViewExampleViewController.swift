//
//  CollectionViewExampleViewController.swift
//  iOS-Education
//
//  Created by Nidal Fakhouri on 5/14/18.
//  Copyright © 2018 Nidal Fakhouri. All rights reserved.
//

import UIKit

class CollectionViewExampleViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var images: [UIImage] = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Collection View"
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let nib = UINib(nibName: "CustomCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "CustomCollectionViewCell")
        
        for i in 1...50 {
            let fileName = "trilobites-\(i).png"
            if let image = UIImage(named: fileName) {
                images.append(image)
            }
            else {
                print("could not create image for filename \(fileName)")
            }
        }
    }
}

extension CollectionViewExampleViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCollectionViewCell", for: indexPath) as! CustomCollectionViewCell
        cell.imageView.image = images[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}
