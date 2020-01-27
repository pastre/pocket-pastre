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

