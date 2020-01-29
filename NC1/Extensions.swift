//
//  Extensions.swift
//  NC1
//
//  Created by Bruno Pastre on 21/01/20.
//  Copyright © 2020 Bruno Pastre. All rights reserved.
//

import Foundation
import UIKit


extension UIImage {
    class func circle(diameter: CGFloat, color: UIColor) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(CGSize(width: diameter, height: diameter), false, 0)
        let ctx = UIGraphicsGetCurrentContext()!
        ctx.saveGState()

        let rect = CGRect(x: 0, y: 0, width: diameter, height: diameter)
        ctx.setFillColor(color.cgColor)
        ctx.fillEllipse(in: rect)

        ctx.restoreGState()
        let img = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()

        return img
    }
}


extension CGSize {
    static func > (_ a: CGSize, _ b: CGSize) -> Bool {
        return a.width * a.height > b.width * b.height
    }
}

extension CGRect {
    var center: CGPoint {
        return CGPoint(x: midX, y: midY)
    }
}


public extension UIView {

    func animateRotation(duration: TimeInterval, repeat: Bool, completion: ((Bool) -> ())?) {

        var options = UIView.KeyframeAnimationOptions(rawValue: UIView.AnimationOptions.curveLinear.rawValue)

        if `repeat` {
            options.insert(.repeat)
        }

        UIView.animateKeyframes(withDuration: duration, delay: 0, options: options, animations: {

            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.25, animations: {
                self.transform = CGAffineTransform(rotationAngle: CGFloat.pi/2)
            })

            UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25, animations: {
                self.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
            })

            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.25, animations: {
                self.transform = CGAffineTransform(rotationAngle: 3*CGFloat.pi/2)
            })

            UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.25, animations: {
                self.transform = CGAffineTransform(rotationAngle: 2*CGFloat.pi)
            })

        }, completion: completion)

    }

}
