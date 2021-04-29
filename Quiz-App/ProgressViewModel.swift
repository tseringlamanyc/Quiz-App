//
//  ProgressViewModel.swift
//  Quiz-App
//
//  Created by Kelby Mittan on 4/28/21.
//

import UIKit

class ProgressViewModel {
    
    let progressView = ProgressView()
    
    private func animateCard(tracker: TrackerView, delay: Double, pct: Double) {
        
        tracker.alpha = 0
        
        UIView.animate(withDuration: 2, delay: delay) {
            tracker.alpha = 1
        } completion: { _ in
            self.ringAnimation(value: pct/100, ring: tracker.progressRing)
            self.animateCountLabel(percent: pct, label: tracker.percentLabel)

        }
    }

    public func animateCards() {
        animateCard(tracker: progressView.swiftTracker, delay: 0, pct: getScorePercent(category: .swift))
        animateCard(tracker: progressView.dsaTracker, delay: 5, pct: getScorePercent(category: .dsa))
        animateCard(tracker: progressView.iOSTracker, delay: 10, pct: getScorePercent(category: .ios))
    }
    
    private func animateCountLabel(percent: Double, label: UILabel) {
        if percent > 0 {
            let _  = Timer.scheduledTimer(withTimeInterval: 3/percent, repeats: true) { (t) in
                label.text =  "\(label.tag)%"
                label.tag += 1
                let percentInt = Int(percent)+1
                if label.tag == percentInt {
                        t.invalidate()
                    }
                }
        }
        
    }
    
    public func ringAnimation(value: Double, ring: CAShapeLayer) {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.toValue = value
        animation.duration = 3
        animation.isRemovedOnCompletion = false
        animation.fillMode = .forwards
        ring.add(animation, forKey: "animation")
    }
    
    private func getScorePercent(category: Category) -> Double {
        let score = UserDefaults.standard.getScore(category: category)
        print(score.answered)
        print(score.correct)
        return (100/score.answered) * score.correct
    }
    
//    public func animateRings() {
//
//        let dsaAnimate = CABasicAnimation(keyPath: "strokeEnd")
////        dsaAnimate.toValue = getScorePercent(category: .dsa)
//        dsaAnimate.toValue = 0.75
//        dsaAnimate.duration = 3
//        dsaAnimate.isRemovedOnCompletion = false
//        dsaAnimate.fillMode = .forwards
//        progressView.dsaTracker.progressRing.add(dsaAnimate, forKey: "animation")
//
//        let iOSAnimate = CABasicAnimation(keyPath: "strokeEnd")
//        iOSAnimate.toValue = 0.5
//        iOSAnimate.duration = 3
//        iOSAnimate.isRemovedOnCompletion = false
//        iOSAnimate.fillMode = .forwards
//        progressView.iOSTracker.progressRing.add(iOSAnimate, forKey: "animation")
//
//        let swiftAnimate = CABasicAnimation(keyPath: "strokeEnd")
//        swiftAnimate.toValue = 0.75
//        swiftAnimate.duration = 3
//        swiftAnimate.isRemovedOnCompletion = false
//        swiftAnimate.fillMode = .forwards
//        progressView.swiftTracker.progressRing.add(swiftAnimate, forKey: "animation")
//    }
    
    
//    public func incrementPercents(percentLabel: UILabel) {
//        animateCountLabel(percent: 75.0, label: progressView.swiftTracker.percentLabel)
//    }
    
//    public func animateDSACard() {
//
//        let swiftCard = self.progressView.swiftTracker
//        swiftCard.alpha = 0
//
//        let dsaCard = self.progressView.dsaTracker
//        dsaCard.alpha = 0
//
//        let iosCard = self.progressView.iOSTracker
//        iosCard.alpha = 0
//
//        UIView.animate(withDuration: 2) {
//            swiftCard.alpha = 1
//        } completion: { _ in
//            self.ringAnimation(value: 0.75, ring: swiftCard.progressRing)
//            self.animateCountLabel(percent: 75.0, label: swiftCard.percentLabel)
//            UIView.animate(withDuration: 2, delay: 2.8) {
//                dsaCard.alpha = 1
//            } completion: { _ in
//                self.ringAnimation(value: 0.85, ring: dsaCard.progressRing)
//                self.animateCountLabel(percent: 85.0, label: dsaCard.percentLabel)
//            }
//
//        }
//
//        UIView.animate(withDuration: 2, delay: 2.8*4) {
//            iosCard.alpha = 1
//        } completion: { _ in
//            self.ringAnimation(value: 0.45, ring: iosCard.progressRing)
//            self.animateCountLabel(percent: 45.0, label: iosCard.percentLabel)
//        }
//
//
//    }
    
}

