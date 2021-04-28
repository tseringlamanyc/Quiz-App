//
//  ProgressViewModel.swift
//  Quiz-App
//
//  Created by Kelby Mittan on 4/28/21.
//

import UIKit

class ProgressViewModel {
    
    let progressView = ProgressView()
    
    public func animateRings() {
        
        let dsaAnimate = CABasicAnimation(keyPath: "strokeEnd")
        dsaAnimate.toValue = UserDefaults.standard.getDSAStats(category: .dsa)
        dsaAnimate.duration = 3
        dsaAnimate.isRemovedOnCompletion = false
        dsaAnimate.fillMode = .forwards
        progressView.dsaTracker.progressRing.add(dsaAnimate, forKey: "animation")
                
        let iOSAnimate = CABasicAnimation(keyPath: "strokeEnd")
        iOSAnimate.toValue = 0.5
        iOSAnimate.duration = 3
        iOSAnimate.isRemovedOnCompletion = false
        iOSAnimate.fillMode = .forwards
        progressView.iOSTracker.progressRing.add(iOSAnimate, forKey: "animation")
        
        let swiftAnimate = CABasicAnimation(keyPath: "strokeEnd")
        swiftAnimate.toValue = 0.75
        swiftAnimate.duration = 3
        swiftAnimate.isRemovedOnCompletion = false
        swiftAnimate.fillMode = .forwards
        progressView.swiftTracker.progressRing.add(swiftAnimate, forKey: "animation")
    }
}
