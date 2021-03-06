//
//  ProgressView.swift
//  Quiz-App
//
//  Created by Kelby Mittan on 4/27/21.
//

import UIKit

class ProgressView: UIView {
    
    public lazy var headerView: HeaderView = {
        let hV = HeaderView()
        return hV
    }()
    
    public lazy var dsaTracker: TrackerView = {
        var dsaTV = TrackerView(categoryName: "DSA", frame: self.frame)
        dsaTV.layer.cornerRadius = 20
        return dsaTV
    }()
    
    public lazy var swiftTracker: TrackerView = {
        var swiftTV = TrackerView(categoryName: "Swift", frame: self.frame)
        swiftTV.layer.cornerRadius = 20
        return swiftTV
    }()
    
    public lazy var iOSTracker: TrackerView = {
        var iOSTV = TrackerView(categoryName: "iOS", frame: self.frame)
        iOSTV.layer.cornerRadius = 20
        return iOSTV
    }()
    
    public lazy var testButton: UIButton = {
        var button = UIButton()
        button.setTitle("Test", for: .normal)
        button.addTarget(self, action: #selector(handleTap), for: .touchUpInside)
        button.backgroundColor = .magenta
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit() {
        setupHeaderView()
        setupDSATracker()
        setupSwiftTracker()
        setupiOSTracker()
        setupButton()
    }
    
    func setupHeaderView() {
        addSubview(headerView)
        headerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: topAnchor),
            headerView.leftAnchor.constraint(equalTo: leftAnchor),
            headerView.rightAnchor.constraint(equalTo: rightAnchor)
        ])
    }
    
    func setupDSATracker() {
        addSubview(dsaTracker)
        dsaTracker.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dsaTracker.centerXAnchor.constraint(equalTo: centerXAnchor),
            dsaTracker.centerYAnchor.constraint(equalTo: centerYAnchor),
            dsaTracker.heightAnchor.constraint(equalToConstant: 144),
            dsaTracker.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width*0.85)
        ]) 
    }
    
    func setupSwiftTracker() {
        addSubview(swiftTracker)
        swiftTracker.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            swiftTracker.centerXAnchor.constraint(equalTo: centerXAnchor),
            swiftTracker.bottomAnchor.constraint(equalTo: dsaTracker.topAnchor, constant: -20),
            swiftTracker.heightAnchor.constraint(equalToConstant: 144),
            swiftTracker.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width*0.85)
        ])
    }
    
    func setupiOSTracker() {
        addSubview(iOSTracker)
        iOSTracker.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            iOSTracker.centerXAnchor.constraint(equalTo: centerXAnchor),
            iOSTracker.topAnchor.constraint(equalTo: dsaTracker.bottomAnchor, constant: 20),
            iOSTracker.heightAnchor.constraint(equalToConstant: 144),
            iOSTracker.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width*0.85)
        ])
    }
    
    func setupButton() {
        addSubview(testButton)
        testButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            testButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            testButton.topAnchor.constraint(equalTo: iOSTracker.bottomAnchor, constant: 20),
            testButton.heightAnchor.constraint(equalToConstant: 50),
            testButton.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width-80)
        ])
    }
    
    @objc func handleTap() {

        let swiftScore = Score(correct: 180, answered: 200)
        let dsaScore = Score(correct: 60, answered: 100)
        let iosScore = Score(correct: 35, answered: 100)
        UserDefaults.standard.saveScore(category: .dsa, score: dsaScore)
        UserDefaults.standard.saveScore(category: .swift, score: swiftScore)
        UserDefaults.standard.saveScore(category: .ios, score: iosScore)

    }
    
}


