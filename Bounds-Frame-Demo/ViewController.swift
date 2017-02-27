//
//  ViewController.swift
//  Bounds-Frame-Demo
//
//  Created by 买明 on 20/01/2017.
//  Copyright © 2017 买明. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var frameA: UILabel!
    @IBOutlet weak var boundsA: UILabel!
    @IBOutlet weak var centerA: UILabel!
    
    @IBOutlet weak var frameB: UILabel!
    @IBOutlet weak var boundsB: UILabel!
    @IBOutlet weak var centerB: UILabel!
    
    @IBOutlet weak var redButton: UIButton!
    @IBOutlet weak var blueButton: UIButton!
    @IBOutlet weak var brownLabel: UILabel!
    
    let customView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customView.backgroundColor = UIColor.black
        brownLabel.addSubview(customView)
        
        getAAllInfo()
        getBAllInfo()
    }
    
    func getAAllInfo() {
        frameA.text = "frameA:\t\(redButton.frame.origin.x)\t\(redButton.frame.origin.y)\t\(redButton.frame.size.width)\t\(redButton.frame.size.height)"
        boundsA.text = "boundsA:\t\(redButton.bounds.origin.x)\t\(redButton.bounds.origin.y)\t\(redButton.bounds.size.width)\t\(redButton.bounds.size.height)"
        centerA.text = "centerA:\t\(redButton.center.x)\t\(redButton.center.y)"
    }
    
    func getBAllInfo() {
        frameB.text = "frameB:\t\(blueButton.frame.origin.x)\t\(blueButton.frame.origin.y)\t\(blueButton.frame.size.width)\t\(blueButton.frame.size.height)"
        boundsB.text = "boundsB:\t\(blueButton.bounds.origin.x)\t\(blueButton.bounds.origin.y)\t\(blueButton.bounds.size.width)\t\(blueButton.bounds.size.height)"
        centerB.text = "centerB:\t\(blueButton.center.x)\t\(blueButton.center.y)"
    }
    
    @IBAction func selectTag(_ sender: UISegmentedControl) {
        brownLabel.frame = CGRect(x: 0, y: 0, width: 250, height: 150)
        brownLabel.bounds = CGRect(x: 0, y: 0, width: 250, height: 150)
        
        switch sender.selectedSegmentIndex {
        case 1:
            UIView.animate(withDuration: 2.0, animations: { 
                self.brownLabel.bounds.origin = CGPoint(x: -20, y: -20)
            })
        case 2:
            UIView.animate(withDuration: 2.0, animations: {
                self.brownLabel.frame.origin = CGPoint(x: -20, y: -20)
            })
        default:
            brownLabel.frame = CGRect(x: 0, y: 0, width: 250, height: 150)
            brownLabel.bounds = CGRect(x: 0, y: 0, width: 250, height: 150)
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

