//
//  TrackerView.swift
//  Quiz-App
//
//  Created by Kelby Mittan on 4/27/21.
//

import UIKit

class TrackerView: UIView {

    private var categoryName: String
    
    private var label: UILabel = {
        var label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        label.font = .systemFont(ofSize: 24, weight: .bold)
        return label
    }()
    
    public lazy var progressRing: CAShapeLayer = {
        var ring = CAShapeLayer()
        let ringPath = UIBezierPath(arcCenter: CGPoint(x: bounds.width/1.35, y: 72), radius: UIScreen.main.bounds.width/8, startAngle: -(.pi/2), endAngle: .pi * 2 - .pi/2, clockwise: true)
        ring.lineWidth = 12
        ring.strokeEnd = 0
        ring.strokeColor = UIColor.blue.cgColor
        ring.fillColor = UIColor.clear.cgColor
        ring.path = ringPath.cgPath
        ring.lineCap = .round
        return ring
    }()
    
    public lazy var trackRing: CAShapeLayer = {
        let trackShape = CAShapeLayer()
        let ringPath = UIBezierPath(arcCenter: CGPoint(x: bounds.width/1.35, y: 72), radius: UIScreen.main.bounds.width/8, startAngle: -(.pi/2), endAngle: .pi * 2, clockwise: true)
        trackShape.path = ringPath.cgPath
        trackShape.fillColor = UIColor.clear.cgColor
        trackShape.lineWidth = 12
        trackShape.strokeColor = UIColor.lightGray.cgColor
        return trackShape
    }()
    
    public var percentLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textAlignment = .center
        label.textColor = .white
        label.font = .systemFont(ofSize: 24, weight: .bold)
        return label
    }()
    
    init(categoryName: String, frame: CGRect) {
        self.categoryName = categoryName
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        setupLabelnRing()
        self.backgroundColor = .green
    }
    
    private func setupLabelnRing() {
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = categoryName
        label.textAlignment = .center
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            label.trailingAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        
        layer.addSublayer(trackRing)
        layer.addSublayer(progressRing)
        
        addSubview(percentLabel)
        percentLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            percentLabel.centerXAnchor.constraint(equalTo: leftAnchor, constant: bounds.width/1.35),
            percentLabel.centerYAnchor.constraint(equalTo: label.centerYAnchor),
            percentLabel.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width/4)
        ])
        
    }
    
}
