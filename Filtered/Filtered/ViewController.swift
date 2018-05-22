//
//  ViewController.swift
//  Filterer
//
//  Created by tstone10 on 4/20/18.
//  Copyright © 2018 DragonSoft. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var iFiltered: UIImage?

    @IBOutlet var ivScarlett: UIImageView!
    
    @IBOutlet var secondaryMenu: UIView!
    @IBOutlet var bottomMenu: UIView!
    
    @IBOutlet var filterButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        secondaryMenu.translatesAutoresizingMaskIntoConstraints = false
        secondaryMenu.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.5)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onFilter(sender: UIButton) {
        
        if(sender.selected){
            hideSecondaryMenu()
            sender.selected = false
        }else{
             showSecondaryMenu()
            sender.selected = true
        }
    }
    
    func showSecondaryMenu() {
        view.addSubview(secondaryMenu)
        
        let bottomConstraint = secondaryMenu.bottomAnchor.constraintEqualToAnchor(bottomMenu.topAnchor)
        let leftConstraint = secondaryMenu.leftAnchor.constraintEqualToAnchor(view.leftAnchor)
        let rightConstraint = secondaryMenu.rightAnchor.constraintEqualToAnchor(view.rightAnchor)
        let heightConstraint = secondaryMenu.heightAnchor.constraintEqualToConstant(44)
        
        NSLayoutConstraint.activateConstraints([bottomConstraint, leftConstraint, rightConstraint, heightConstraint])
        
        view.layoutIfNeeded()
        
        self.secondaryMenu.alpha = 0
        UIView.animateWithDuration(0.4){
            self.secondaryMenu.alpha = 1.0
        }
    }
    
    func hideSecondaryMenu(){

        UIView.animateWithDuration(0.4, animations: { 
            self.secondaryMenu.alpha = 0
            }) { completed in
                if completed == true {
                    self.secondaryMenu.removeFromSuperview()
                }
        }
    }

}

