//
//  ViewController.swift
//  ShimmerSlideAnimation
//
//  Created by Hari Haran on 11/06/20.
//  Copyright © 2020 Hari Haran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let shimmerView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        view.layer.cornerRadius = 5
        return view
    }()
    
    let infoLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        label.text = "Slide to unlock"
        label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        shimmerView.frame = CGRect(x: 50, y: UIScreen.main.bounds.size.height - 200, width: UIScreen.main.bounds.size.width - 100, height: 50)
        view.addSubview(shimmerView)
        infoLabel.frame = CGRect(x: 0, y: 0, width: shimmerView.frame.size.width, height: shimmerView.frame.size.height)
        shimmerView.addSubview(infoLabel)
        infoLabel.startShimmer()
    }
    
    
}

extension UIView {
    
    func startShimmer() {
        let gradient = CAGradientLayer()
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: -0.02)
        gradient.frame = CGRect(x: 0, y: 0, width: self.bounds.size.width*3, height: self.bounds.size.height)
        
        let lowerAlpha: CGFloat = 0.5
        let solid = UIColor(white: 1, alpha: 1).cgColor
        let clear = UIColor(white: 1, alpha: lowerAlpha).cgColor
        gradient.colors     = [ solid, solid, clear, clear, solid, solid ]
        gradient.locations  = [ 0,     0.3,   0.45,  0.55,  0.7,   1     ]
        
        let theAnimation : CABasicAnimation = CABasicAnimation(keyPath: "transform.translation.x")
        theAnimation.duration = 2
        theAnimation.repeatCount = Float.infinity
        theAnimation.autoreverses = false
        theAnimation.isRemovedOnCompletion = false
        theAnimation.fillMode = CAMediaTimingFillMode.forwards
        theAnimation.fromValue = -self.frame.size.width * 2
        theAnimation.toValue =  0
        gradient.add(theAnimation, forKey: "animateLayer")
        
        self.layer.mask = gradient
    }
    
    func stopShimmer() {
        self.layer.mask = nil
    }
}

