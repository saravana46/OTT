//
//  OnlineViewController.swift
//  OTT
//
//  Created by user on 28/08/23.
//

import UIKit
import AAViewAnimator

class OnlineViewController: UIViewController {
    
    @IBOutlet weak var viewOne: UIView!
    @IBOutlet weak var viewTwo: UIView!
    @IBOutlet weak var crossViewOne: UIView!
    @IBOutlet weak var crossViewTwo: UIView!
    @IBOutlet weak var imageViewOne: UIView!
    @IBOutlet weak var imageViewTwo: UIView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        animateWithTransition(.fromLeft)
        animateWithTransitionView(.fromRight)
        self.crossViewOne.cornerRadius(usingCorners: [.topLeft,.bottomLeft], cornerRadi: CGSize(width: 20, height: 20))
        self.crossViewTwo.cornerRadius(usingCorners: [.topRight,.bottomRight], cornerRadi: CGSize(width: 20, height: 20))
        self.imageViewOne.cornerRadius(usingCorners: .allCorners, cornerRadi: CGSize(width: 20, height: 20))
        self.imageViewTwo.cornerRadius(usingCorners: .allCorners, cornerRadi: CGSize(width: 20, height: 20))
    }
    
    func animateWithTransition(_ animator: AAViewAnimators) {
        viewOne.aa_animate(duration: 1.2, springDamping: .slight, animation: animator) { inAnimating, animView in
            
            if inAnimating {
                print("Animating ....")
            }
            else {
                print("Animation Done 👍🏻")
            }
        }
    }
    
    func animateWithTransitionView(_ animator: AAViewAnimators) {
        viewTwo.aa_animate(duration: 1.2, springDamping: .slight, animation: animator) { inAnimating, animView in
            
            if inAnimating {
                print("Animating ....")
            }
            else {
                print("Animation Done 👍🏻")
            }
        }
    }
    
}

extension UIView {
    func cornerRadius(usingCorners corners: UIRectCorner, cornerRadi: CGSize) {
        let path = UIBezierPath(roundedRect: self.bounds,byRoundingCorners: corners, cornerRadii: cornerRadi)
        let maskLayer = CAShapeLayer()
        maskLayer.path = path.cgPath
        self.layer.mask = maskLayer
    }
}
