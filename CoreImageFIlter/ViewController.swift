//
//  ViewController.swift
//  CoreImageFIlter
//
//  Created by esanchez on 4/11/19.
//  Copyright © 2019 Tec. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let image = imageView?.image, let cgimg = image.cgImage else {
            print("imageView doesn't have an image!")
            return
        }
        
        let coreImage = CIImage(cgImage: cgimg)
        
        let filter = CIFilter(name: "CIPhotoEffectNoir")
        filter?.setValue(coreImage, forKey: kCIInputImageKey)
        
        if let output = filter?.value(forKey: kCIOutputImageKey) as? CIImage {
            let filteredImage = UIImage(ciImage: output)
            imageView?.image = filteredImage
        }
            
        else {
            print("image filtering failed")
        }
    }
}

