//
//  ViewController.swift
//  Filterer
//
//  Created by tstone10 on 4/20/18.
//  Copyright © 2018 DragonSoft. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var ivScarlett: UIImageView!
    
    @IBOutlet var bFilter: UIButton!
    
    var iFiltered: UIImage?
    
    @IBAction func onImageToggle(sender: UIButton) {
        
        if bFilter.selected{
            ivScarlett.image = UIImage(named: "scarlett")!
            bFilter.selected = false
        }else{
            ivScarlett.image = iFiltered
            bFilter.selected = true
        }
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let image = UIImage(named: "scarlett")!
        
        var rgbImage = RGBAImage(image: image)!
        
        let avgRed = 107
        
        for y in 0..<rgbImage.height{
            for x in 0..<rgbImage.width{
                let index = y * rgbImage.width + x
                
                var pixel = rgbImage.pixels[index]
                
                let redDelta = Int(pixel.red) - avgRed
                
                var modifier = 1 + 4 * (Double(y) / Double(rgbImage.height))
                
                if (Int(pixel.red)<avgRed){
                    modifier = 1
                }
                
                pixel.red = UInt8(max(min(255,
                    Int(round(Double(avgRed)+modifier*Double(redDelta)))), 0))
                
                rgbImage.pixels[index] = pixel
                
            }
        }
        
        iFiltered = rgbImage.toUIImage()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

