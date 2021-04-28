//
//  ProgressVC.swift
//  Quiz-App
//
//  Created by Kelby Mittan on 4/27/21.
//

import UIKit

class ProgressVC: UIViewController {

    let viewModel = ProgressViewModel()
    
    override func loadView() {
        view = viewModel.progressView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.animateRings()
    }
    

}
