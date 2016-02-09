//
//  MainScreenViewController.swift
//  Simon
//
//  Created by Joseph Ellegood on 2/8/16.
//  Copyright © 2016 Joseph Ellegood. All rights reserved.
//

import UIKit

class MainScreenViewController: UIViewController {
    init(simonModel: SimonModel) {
        self.simonModel = simonModel
        
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view = MainScreenView(delegate: self)
    }
    
    let simonModel: SimonModel
}

extension MainScreenViewController: MainScreenViewDelegate {
    func playButtonPressed() {
        let simonViewController = SimonViewController(simonModel: simonModel)
        presentViewController(simonViewController, animated: true, completion: nil)
    }
}

