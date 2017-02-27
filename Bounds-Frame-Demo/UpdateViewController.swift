//
//  UpdateViewController.swift
//  Bounds-Frame-Demo
//
//  Created by 买明 on 27/02/2017.
//  Copyright © 2017 买明. All rights reserved.
//

import UIKit

class UpdateViewController: UIViewController {

    @IBOutlet weak var redLabel: UILabel!
    
    @IBOutlet weak var initialFrame: UILabel!
    @IBOutlet weak var initialBounds: UILabel!
    @IBOutlet weak var initialCenter: UILabel!
    
    @IBOutlet weak var rotationFrame: UILabel!
    @IBOutlet weak var rotationBounds: UILabel!
    @IBOutlet weak var rotationCenter: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initProperties()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clickRotateLabel(_ sender: UIButton) {
        UIView.animate(withDuration: 2.0, animations: { 
            self.redLabel.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 2)
        }, completion: { (boolValue) in
            self.resetProperties()
        })
    }
    
    func initProperties() {
        initialFrame.text = "frame:\t\(redLabel.frame.origin.x)\t\(redLabel.frame.origin.y)\t\(redLabel.frame.size.width)\t\(redLabel.frame.size.height)"
        initialBounds.text = "bounds:\t\(redLabel.bounds.origin.x)\t\(redLabel.bounds.origin.y)\t\(redLabel.bounds.size.width)\t\(redLabel.bounds.size.height)"
        initialCenter.text = "center:\t\(redLabel.center.x)\t\(redLabel.center.y)"
    }
    
    func resetProperties() {
        rotationFrame.text = "frame:\t\(redLabel.frame.origin.x)\t\(redLabel.frame.origin.y)\t\(redLabel.frame.size.width)\t\(redLabel.frame.size.height)"
        rotationBounds.text = "bounds:\t\(redLabel.bounds.origin.x) \(redLabel.bounds.origin.y)\t\(redLabel.bounds.size.width)\t\(redLabel.bounds.size.height)"
        rotationCenter.text = "center:\t\(redLabel.center.x)\t\(redLabel.center.y)"
    }
}
