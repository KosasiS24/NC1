//
//  ViewController.swift
//  NC1
//
//  Created by Sugiarto Kosasi on 18/05/19.
//  Copyright © 2019 SK. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var Button: UIButton!
    

    override func viewDidLoad() {
        
        print(view.frame.maxX)
        print(view.frame.maxY)
        print(view.frame.minX)
        print(view.frame.minY)
        
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        Button.layer.cornerRadius = 50
        Button.backgroundColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
    }
    
    @IBAction func buttonClicked(_ sender: Any) {
        
        var duration : Double = 2
    
        UIView.animate(withDuration: TimeInterval(duration)) {
            self.Button.frame = CGRect(x: CGFloat(Float.random(in: 1..<200)), y: CGFloat(Float.random(in: 1..<800)), width: 100, height: 100)
           
            duration -= 0.5
            
            if duration == 0 {
                self.Button.layer.cornerRadius = 0
                self.Button.frame.size = CGSize(width: 300, height: 300)
                self.Button.setTitle("WIN", for: .normal)
            }
        }
    }
}

