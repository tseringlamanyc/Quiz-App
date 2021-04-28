//
//  ViewController.swift
//  Quiz-App
//
//  Created by Tsering Lama on 4/19/21.
//

import UIKit

class ViewController: UIViewController {
    
    let headerView = HeaderView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view = headerView
        view.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)
    }

}

