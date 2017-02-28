//
//  MaskImage.swift
//  PhotoMaskingDemo
//
//  Created by Keyur Ashra on 28/02/17.
//  Copyright © 2017 Jignesh Parekh. All rights reserved.
//

import UIKit

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