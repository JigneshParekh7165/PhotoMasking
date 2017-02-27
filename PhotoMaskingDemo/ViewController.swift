//
//  ViewController.swift
//  PhotoMaskingDemo
//
//  Created by Keyur Ashra on 27/02/17.
//  Copyright © 2017 Jignesh Parekh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myBgView: UIView!
    @IBOutlet weak var imgView: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnMaskingOnClick(sender: AnyObject) {
        let image = UIImage(named: "star.png")
        let maskingImage = UIImage(named: "woman.png")
        imgView.image = maskImage(image!, mask: maskingImage!)
    }
    
    @IBAction func btnOriginalOnClick(sender: AnyObject) {
        imgView.image = UIImage(named: "woman.png")
    }
    
    //ImageMasking
    func maskImage(image:UIImage, mask:(UIImage))->UIImage{
        
        let imageReference = image.CGImage
        let maskReference = mask.CGImage
        
        let imageMask = CGImageMaskCreate(CGImageGetWidth(maskReference),
                                          CGImageGetHeight(maskReference),
                                          CGImageGetBitsPerComponent(maskReference),
                                          CGImageGetBitsPerPixel(maskReference),
                                          CGImageGetBytesPerRow(maskReference),
                                          CGImageGetDataProvider(maskReference), nil, true)
        
        
        
        let maskedReference = CGImageCreateWithMask(imageReference, imageMask)
        
        let maskedImage = UIImage(CGImage:maskedReference!)
        
        return maskedImage
    }
}

