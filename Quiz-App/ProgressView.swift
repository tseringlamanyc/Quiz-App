//
//  ProgressView.swift
//  Quiz-App
//
//  Created by Kelby Mittan on 4/27/21.
//

import UIKit

class ProgressView: UIView {
    
//    let centerXTracker: CGFloat = UIScreen.main.bounds.maxX/1.45
    
//    public var dsaCircle: CAShapeLayer = {
//        var dsaShape = CAShapeLayer()
//        var dsaPath = UIBezierPath(arcCenter: CGPoint(x: UIScreen.main.bounds.maxX/1.35, y: UIScreen.main.bounds.maxY/2), radius: 60, startAngle: 0, endAngle: .pi * 2, clockwise: true)
//        dsaShape.path = dsaPath.cgPath
//        dsaShape.lineWidth = 12
//        dsaShape.strokeColor = UIColor.blue.cgColor
//
//        return dsaShape
//    }()
    
    public lazy var dsaTracker: TrackerView = {
        var dsaTV = TrackerView(categoryName: "DSA YOOO", frame: self.frame)
        return dsaTV
    }()
    
    public lazy var swiftTracker: TrackerView = {
        var swiftTV = TrackerView(categoryName: "SWIFT YOOO", frame: self.frame)
        return swiftTV
    }()
    
    public lazy var iOSTracker: TrackerView = {
        var iOSTV = TrackerView(categoryName: "iOS YOOO", frame: self.frame)
        return iOSTV
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
//        layer.addSublayer(dsaCircle)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
//        layer.addSublayer(dsaCircle)
    }
    
    func commonInit() {
        setupDSATracker()
        setupSwiftTracker()
        setupiOSTracker()
    }
    
    func setupDSATracker() {
        addSubview(dsaTracker)
        dsaTracker.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dsaTracker.centerXAnchor.constraint(equalTo: centerXAnchor),
            dsaTracker.centerYAnchor.constraint(equalTo: centerYAnchor),
            dsaTracker.heightAnchor.constraint(equalToConstant: 144),
            dsaTracker.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width)
        ])
    }
    
    func setupSwiftTracker() {
        addSubview(swiftTracker)
        swiftTracker.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            swiftTracker.centerXAnchor.constraint(equalTo: centerXAnchor),
            swiftTracker.bottomAnchor.constraint(equalTo: dsaTracker.topAnchor, constant: -12),
            swiftTracker.heightAnchor.constraint(equalToConstant: 144),
            swiftTracker.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width)
        ])
    }
    
    func setupiOSTracker() {
        addSubview(iOSTracker)
        iOSTracker.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            iOSTracker.centerXAnchor.constraint(equalTo: centerXAnchor),
            iOSTracker.topAnchor.constraint(equalTo: dsaTracker.bottomAnchor, constant: 12),
            iOSTracker.heightAnchor.constraint(equalToConstant: 144),
            iOSTracker.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width)
        ])
    }
    
}
