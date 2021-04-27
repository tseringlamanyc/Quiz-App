//
//  TrackerView.swift
//  Quiz-App
//
//  Created by Kelby Mittan on 4/27/21.
//

import UIKit

class TrackerView: UIView {

    public var categoryName: String
    
    public var dsaCircle: CAShapeLayer = {
        var dsaShape = CAShapeLayer()
//        var dsaPath = UIBezierPath(arcCenter: CGPoint(x: UIScreen.main.bounds.maxX/1.35, y: UIScreen.main.bounds.maxY/2), radius: 60, startAngle: 0, endAngle: .pi * 2, clockwise: true)
//        dsaShape.path = dsaPath.cgPath
//        dsaShape.lineWidth = 12
//        dsaShape.strokeColor = UIColor.blue.cgColor
        
        return dsaShape
    }()
    
    public var label: UILabel = {
        var l = UILabel()
        l.textColor = .white
        return l
    }()
    
    init(categoryName: String, frame: CGRect) {
        self.categoryName = categoryName
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func commonInit() {
        setupLabel()
        setupCircle()
        self.backgroundColor = .green
    }
    
    func setupLabel() {
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = categoryName

        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            label.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -140)
        ])
    }
    
    func setupCircle() {
        let circPT = CGPoint(x: self.bounds.midX/0.65, y: self.bounds.midY-350)
//        let dsaPath = UIBezierPath(arcCenter: CGPoint(x: self.frame.maxX-60, y: self.frame.maxY/2), radius: 60, startAngle: 0, endAngle: .pi * 2, clockwise: true)
        let dsaPath = UIBezierPath(arcCenter: circPT, radius: 60, startAngle: 0, endAngle: .pi * 2, clockwise: true)
        
        dsaCircle.path = dsaPath.cgPath
        dsaCircle.lineWidth = 12
        dsaCircle.strokeColor = UIColor.blue.cgColor
        dsaCircle.fillColor = UIColor.clear.cgColor
        self.layer.addSublayer(dsaCircle)
    }
    
}
