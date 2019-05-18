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
    var audio = AVAudioPlayer()
    
    override func viewDidLoad() {

        do{
            audio = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "sound", ofType: "mp3")!))
            audio.enableRate = true
        }catch{
            print(error)
        }
        
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        Button.layer.cornerRadius = 50
        Button.backgroundColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
    }
    
    var duration : Double = 6
    @IBAction func buttonClicked(_ sender: Any) {
        
        UIView.animate(withDuration: TimeInterval(duration)) {
            self.Button.frame = CGRect(x: CGFloat(Float.random(in: 1..<200)), y: CGFloat(Float.random(in: 1..<800)), width: 100, height: 100)
            self.audio.play()
            self.audio.numberOfLoops = -1
            //self.shake()
            self.pulse()
            self.duration -= 0.5
            
            if self.duration < 5.5{
                self.audio.rate += 0.2
            }
            
            if self.duration == 0 {
                self.Button.layer.cornerRadius = 0
                self.Button.frame.size = CGSize(width: 300, height: 300)
                self.Button.setTitle("WIN", for: .normal)
                self.audio.stop()
            }
        }
    }
    
    func pulse(){
        Button.isUserInteractionEnabled = true
        Button.isEnabled = true
        
        let pulse1 = CASpringAnimation(keyPath: "transform.scale")
        pulse1.duration = 6
        pulse1.fromValue = 1.0
        pulse1.toValue = 1.1
        pulse1.autoreverses = true
        pulse1.repeatCount = -1
        pulse1.initialVelocity = 1
        pulse1.damping = 0.8
        
        let animationGroup = CAAnimationGroup()
        animationGroup.duration = 6
        animationGroup.repeatCount = 1000
        animationGroup.animations = [pulse1]
        
        Button.layer.add(animationGroup, forKey: "pulse")
    }
    
//    func shake(){
//        let animation = CABasicAnimation(keyPath: "position")
//        animation.duration = 0.07
//        animation.repeatCount = 4
//        animation.autoreverses = true
//        animation.fromValue = NSValue(cgPoint: CGPoint(x: self.Button.center.x - 10, y: self.Button.center.y))
//        animation.toValue = NSValue(cgPoint: CGPoint(x: self.Button.center.x + 10, y: self.Button.center.y))
//
//        self.Button.layer.add(animation, forKey: "position")
    
}

