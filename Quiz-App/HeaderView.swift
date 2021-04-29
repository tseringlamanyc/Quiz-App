//
//  HeaderView.swift
//  Quiz-App
//
//  Created by Tsering Lama on 4/27/21.
//

import UIKit

class HeaderView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func commonInit() {
        createBezierPath()
    }
    
    func createBezierPath()  {
        let layer = CAShapeLayer()
        
        layer.path = UIBezierPath(
            roundedRect: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.15),
            byRoundingCorners: [.bottomLeft, .bottomRight],
            cornerRadii: CGSize(width: 40, height: 40))
            .cgPath
        layer.fillColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        self.layer.addSublayer(layer)
        
        let label = CATextLayer()
        
        label.frame = CGRect(x: 0, y: UIScreen.main.bounds.height * 0.05, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.15)
        label.foregroundColor = UIColor.white.cgColor
        label.alignmentMode = CATextLayerAlignmentMode.center
        label.string = "Quiz App"
        label.contentsScale = UIScreen.main.scale
        self.layer.addSublayer(label)
    }

}
