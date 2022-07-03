//
//  LabelExtension.swift
//  LifeSum
//
//  Created by H. Murat GÖÇMEZ on 3.07.2022.
//

import Foundation
import UIKit

extension CALayer {

    func addBorder(edge: UIRectEdge, color: UIColor, thickness: CGFloat, labelX: CGFloat, labelHeight:CGFloat, lineWidth: CGFloat) {
        let border = CALayer()
        border.frame = CGRect(x: labelX, y: labelHeight - thickness, width: lineWidth, height: thickness)
        border.backgroundColor = color.cgColor;
        self.addSublayer(border)
        }

}
