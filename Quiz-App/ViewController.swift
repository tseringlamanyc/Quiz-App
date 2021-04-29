//
//  ViewController.swift
//  Quiz-App
//
//  Created by Tsering Lama on 4/19/21.
//

import UIKit
import Combine

class ViewController: UIViewController {
    
    let headerView = HeaderView()
    
    let apiClinet = APIClient()
    
    var cancellables = Set<AnyCancellable>()

    override func viewDidLoad() {
        super.viewDidLoad()
        view = headerView
        view.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)
        getQuestions()
    }

    func getQuestions() {
        apiClinet.getAllQuestions()
            .sink { completion in
                print(completion)
            } receiveValue: { allQuestions in
                dump(allQuestions)
            }
            .store(in: &cancellables)
    }
}

