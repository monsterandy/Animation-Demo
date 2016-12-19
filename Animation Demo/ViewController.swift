//
//  ViewController.swift
//  Animation Demo
//
//  Created by 麻哲源 on 2016/12/8.
//  Copyright © 2016年 Andy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var switchButton: UIButton!
    @IBOutlet weak var rabbit: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        switchButton.isSelected = false
        rabbit.image = UIImage(named: "rabbit_blue")
        view.backgroundColor = UIColor.white
        rabbit.layer.cornerRadius = 100
        rabbit.clipsToBounds = true
    }
    
    @IBAction func rabbitTapped(_ sender: Any) {
        print("tapped")
        if switchButton.isSelected == true {
            switchOffAnimation()
            switchButton.isSelected = false
        }
        else {
            showTransitionAnimation()
            switchButton.isSelected = true
        }
    }
    
    func showTransitionAnimation() {
        let blueCircle = UIView(frame: CGRect(x: 87, y: 233, width: 200, height: 200))
        blueCircle.layer.borderWidth = 3.0
        blueCircle.layer.borderColor = UIColor(red: 0.0/255.0, green: 144.0/255.0, blue: 247.0/255.0, alpha: 1.0).cgColor
        blueCircle.layer.cornerRadius = 100
        self.view.insertSubview(blueCircle, belowSubview: rabbit)
        let transfromHalf = CGAffineTransform(rotationAngle: CGFloat(M_PI))
        let transfromFull = CGAffineTransform(rotationAngle: CGFloat(M_PI*Double(2.0)))
        UIView.animate(withDuration: 1.5, delay: 0, options: [.curveLinear], animations: {
            () -> Void in
            blueCircle.transform = CGAffineTransform(scaleX: 3, y: 3)
            blueCircle.alpha = 0
            self.rabbit.transform = transfromHalf
            self.rabbit.transform = transfromFull
        }, completion:{
            isFinished in
            blueCircle.removeFromSuperview()
            self.showTransitionAnimationSec()
        })
    }
    func showTransitionAnimationSec(){
        let blackHole = UIView(frame: CGRect(x: 87, y: 233, width: 200, height: 200))
        blackHole.layer.cornerRadius = 100
        blackHole.backgroundColor = UIColor.black
        self.view.insertSubview(blackHole, belowSubview: rabbit)
        let circleBorder = UIView(frame: CGRect(x: 87, y: 233, width: 200, height: 200))
        circleBorder.layer.borderWidth = 3.0
        circleBorder.layer.borderColor = UIColor.white.cgColor
        circleBorder.layer.cornerRadius = 100
        self.view.insertSubview(circleBorder, aboveSubview: rabbit)
        rabbit.image = UIImage(named: "rabbit_black")
        UIView.animate(withDuration: 0.5, animations: { 
            blackHole.transform = CGAffineTransform(scaleX: 5, y: 5)
        }) { (isFinished) in
            self.view.backgroundColor = UIColor.black
            blackHole.removeFromSuperview()
            self.buttonDidTapped()
        }
    }
    func buttonDidTapped() {
        let blackCircle = UIView(frame: CGRect(x: 87, y: 233, width: 200, height: 200))
        blackCircle.layer.borderWidth = 3.0
        blackCircle.layer.borderColor = UIColor.white.cgColor
        blackCircle.layer.cornerRadius = 100
        self.view.insertSubview(blackCircle, belowSubview: rabbit)
        
        UIView.animate(withDuration: 1.5, delay: 0, options: [.curveEaseIn,.repeat], animations: {
            () -> Void in
            blackCircle.transform = CGAffineTransform(scaleX: 3, y: 3)
            blackCircle.alpha = 0
        }, completion: nil)
    }
    
    func switchOffAnimation() {
        let blueHole = UIView(frame: CGRect(x: -203, y: -57, width: 780, height: 780))
        blueHole.layer.cornerRadius = 390
        blueHole.backgroundColor = UIColor(red: 0.0/255.0, green: 144.0/255.0, blue: 247.0/255.0, alpha: 1.0)
        self.view.insertSubview(blueHole, belowSubview: rabbit)
        rabbit.image = UIImage(named: "rabbit_blue")
        self.view.backgroundColor = UIColor.white
        UIView.animate(withDuration: 0.5, animations: {
            blueHole.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
            blueHole.center = CGPoint(x: 187, y: 333)
        }, completion: {
            isFinished in
            blueHole.removeFromSuperview()
        })
    }
    
}

