//
//  UIButton+Ext.swift
//  Quiz-App
//
//  Created by Brendon Cecilio on 4/28/21.
//

import UIKit

extension UIButton {
    
    func makeFontDynamic() {
        /// function to make text within buttons dynamic
        self.titleLabel?.adjustsFontForContentSizeCategory = true
        self.titleLabel?.font = UIFont.preferredFont(forTextStyle: .body)
        self.titleLabel?.textAlignment = .center
    }
    
    func categoryButtonStyle() {
        /// rounded corners for the category buttons
        self.layer.cornerRadius = 10
        /// drop shadow
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = .zero
        self.layer.shadowOpacity = 1.0
        /// text color
        self.titleLabel?.textColor = UIColor.white
        /// background color
        self.backgroundColor = #colorLiteral(red: 0.1607843137, green: 0.2431372549, blue: 0.5254901961, alpha: 1)
    }
    
    func answerChoiceButton() {
        /// rounded corners for the answer choice buttons
        self.layer.cornerRadius = 48.5
        /// drop shadow
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = .zero
        self.layer.shadowOpacity = 1.0
        /// text color
        self.titleLabel?.textColor = UIColor.white
        /// background color
        self.backgroundColor = #colorLiteral(red: 0.1607843137, green: 0.2431372549, blue: 0.5254901961, alpha: 1)
    }
}

extension UIView {
    
    func animateButton(scale: CGFloat = 0.88, functionClosure: @escaping () -> ()) {
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseIn, animations: {
            self.transform = CGAffineTransform(scaleX: scale, y: scale)
        }) { (_) in
            UIView.animate(withDuration: 0.1, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.5, options: .curveEaseIn, animations: {
                self.transform = CGAffineTransform(scaleX: 1, y: 1)
            }) { (_) in
                functionClosure()
            }
        }
    }
    
    
    @objc func animateButtonNoClosure() {
        animateButton(functionClosure: noop)
    }
    
    func noop() {}
}
