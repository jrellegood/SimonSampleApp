//
//  SimonViewController.swift
//  Simon
//
//  Created by Joseph Ellegood on 2/8/16.
//  Copyright © 2016 Joseph Ellegood. All rights reserved.
//

import UIKit

let pause = 0.25

class SimonViewController: UIViewController {
    init(simonModel: SimonModel) {
        self.simonModel = simonModel
        
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        simonView = SimonView(delegate: self)
        view = simonView
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        presentSimonColors()
    }
    
    func presentSimonColors() {
        let simonColors = simonModel.currentNumbers
        var lastOperation: NSOperation? = nil
        
        self.simonView?.userInteractionEnabled = false
        
        for color in simonColors {
            var lightenBlock: () -> Void
            var resetBlock: () -> Void
            
            switch color {
            case .Red:
                lightenBlock = {
                    self.simonView?.lightenRed()
                }
                
                resetBlock = {
                    self.simonView?.resetRed()
                }
            case .Blue:
                lightenBlock = {
                    self.simonView?.lightenBlue()
                }
                
                resetBlock = {
                    self.simonView?.resetBlue()
                }
            case .Green:
                lightenBlock = {
                    self.simonView?.lightenGreen()
                }
                
                resetBlock = {
                    self.simonView?.resetGreen()
                }
            case .Yellow:
                lightenBlock = {
                    self.simonView?.lightenYellow()
                }
                
                resetBlock = {
                    self.simonView?.resetYellow()
                }
            }
            
            let operation = NSBlockOperation(block: { () -> Void in
                dispatch_sync(dispatch_get_main_queue(), { () -> Void in
                    NSRunLoop.currentRunLoop().runUntilDate(NSDate(timeIntervalSinceNow: pause))
                    lightenBlock()
                    NSRunLoop.currentRunLoop().runUntilDate(NSDate(timeIntervalSinceNow: pause))
                    resetBlock()
                })
            })
            
            if let actualLastOperation = lastOperation {
                operation.addDependency(actualLastOperation)
            }
            
            lastOperation = operation
            
            queue.addOperation(operation)
        }
        
        let enableViewOperation = NSBlockOperation { () -> Void in
            self.simonView?.userInteractionEnabled = true
        }
        
        if let actualLastOperation = lastOperation {
            enableViewOperation.addDependency(actualLastOperation)
        }
        
        queue.addOperation(enableViewOperation)
    }
    
    func verifyColor(color: SimonColor) {
        if !simonModel.verifyColor(color) {
            let alert = UIAlertController(title: "Wrong!", message: "Incorrect! Final score is \(simonModel.score)", preferredStyle: .Alert)
            let alertAction = UIAlertAction(title: "OK", style: .Default, handler: { _ -> Void in
                self.dismissViewControllerAnimated(true, completion: nil)
            })
            alert.addAction(alertAction)
            presentViewController(alert, animated: true, completion: nil)
        } else {
            if simonModel.isRoundOver() {
                simonView?.setScore(simonModel.score)
                presentSimonColors()
            }
        }
    }
    
    let simonModel: SimonModel
    var simonView: SimonView?
    var queue = NSOperationQueue()
}

extension SimonViewController: SimonViewDelegate {
    func blueTapped() {
        verifyColor(.Blue)
    }
    
    func redTapped() {
        verifyColor(.Red)
    }
    
    func greenTapped() {
        verifyColor(.Green)
    }
    
    func yellowTapped() {
        verifyColor(.Yellow)
    }
    
    
}


