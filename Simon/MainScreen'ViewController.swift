//
//  MainScreenViewController.swift
//  Simon
//
//  Created by Joseph Ellegood on 2/8/16.
//  Copyright © 2016 Joseph Ellegood. All rights reserved.
//

import UIKit

class MainScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view = MainScreenView(delegate: self)
    }
}

extension MainScreenViewController: MainScreenViewDelegate {
    func playButtonPressed() {
        let simonNumberGenerator = RandomSimonNumberGenerator()
        let simonModel = SimonModel(simonNumberGenerator: simonNumberGenerator)
        
        let simonViewController = SimonViewController(simonModel: simonModel)
        presentViewController(simonViewController, animated: true, completion: nil)
    }
}

