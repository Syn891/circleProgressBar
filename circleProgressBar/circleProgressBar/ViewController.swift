//
//  ViewController.swift
//  circleProgressBar
//
//  Created by Sareena Naser on 12/11/2019.
//  Copyright © 2019 Sareena Naser. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
     
//create inner and outer circles for shape to hold progress bar
        let outerCircle = CAShapeLayer()
        let circleHolder = CAShapeLayer()
        var progress: Float = 0.0
     
    @IBOutlet weak var label1: UILabel!
    
    
        override func viewDidLoad() {
            super.viewDidLoad()
        
            
            let center = view.center
           
            //path to start and build the progres bar
            let circularPath = UIBezierPath(arcCenter: center, radius: 100, startAngle: -CGFloat.pi/2, endAngle: 2*CGFloat.pi, clockwise: true)
            circleHolder.path = circularPath.cgPath
                              
            circleHolder.strokeColor = UIColor.lightGray.cgColor
            circleHolder.lineWidth = 15
            circleHolder.fillColor = UIColor.clear.cgColor
                      
            view.layer.addSublayer(circleHolder)
            outerCircle.path = circularPath.cgPath
            
            //edit design of progress bar
            outerCircle.strokeColor = UIColor.green.cgColor
            outerCircle.lineWidth = 15
            outerCircle.lineCap = CAShapeLayerLineCap.round
            outerCircle.fillColor = UIColor.clear.cgColor
            outerCircle.strokeEnd = CGFloat(progress)
            
            view.layer.addSublayer(outerCircle)
            
            
            
        }
    //button on click adds amount to progress bar
    var percentage = 0
    @IBAction func progressButton(_ sender: UIButton) {
    
        progress += 0.04
        percentage += 5
        
        //creates animation for bar
            let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        basicAnimation.toValue = progress
            
            basicAnimation.fillMode = CAMediaTimingFillMode.forwards
            
            basicAnimation.isRemovedOnCompletion = false
            
            
            outerCircle.add(basicAnimation, forKey: "startProgress" )
            
        //updates label with current amount
        label1.text = "\(percentage)%"

        }
}
