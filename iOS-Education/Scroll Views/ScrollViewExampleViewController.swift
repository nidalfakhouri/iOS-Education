//
//  ScrollViewExampleViewController.swift
//  iOS-Education
//
//  Created by Nidal Fakhouri on 5/14/18.
//  Copyright © 2018 Nidal Fakhouri. All rights reserved.
//

import UIKit

class ScrollViewExampleViewController: UIViewController {

    // make sure to connect the delegate from the scroll view to the view controller in the xib or do it in code
    @IBOutlet weak var imageScrollView: UIScrollView!
    var imageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Scroll Views"
        
        if let image = UIImage(named: "Earth_poster_large") {
            
            imageView = UIImageView(image: image)
            let screenSize = UIScreen.main.bounds.size
            let imageSize = image.size
            let minSize = screenSize.width / imageSize.width
            
            let width = imageView.frame.size.width
            let height = imageView.frame.size.height
            
            imageScrollView.contentSize =  CGSize(width: width, height: height)
            imageScrollView.maximumZoomScale = 4.0
            imageScrollView.minimumZoomScale = minSize
            imageScrollView.clipsToBounds = true
            imageScrollView.delegate = self
            imageScrollView.addSubview(imageView)

            imageScrollView.contentOffset = CGPoint(x: width / 2, y: height / 2)
            
            //imageScrollView.zoomScale = minSize
            //centerImageInScrollView()
        }
    }
    
    func centerImageInScrollView() {
        
        let imageViewFrame = self.imageView.frame
        let scrollViewFrame = self.imageScrollView.frame

        if (imageViewFrame.size.height < scrollViewFrame.size.height) {
            
            let h = scrollViewFrame.size.height;
            let frame_w = imageViewFrame.size.width;
            let frame_h = imageViewFrame.size.height;
            let y = (h - frame_h)/(2.0);
            imageView.frame = CGRect(x: 0.0, y: y - 22.0, width: frame_w, height: frame_h)
        }
    }
}

extension ScrollViewExampleViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("content offset: \(scrollView.contentOffset)")
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
}
