//
//  SimonView.swift
//  Simon
//
//  Created by Joseph Ellegood on 2/8/16.
//  Copyright © 2016 Joseph Ellegood. All rights reserved.
//

import UIKit

protocol SimonViewDelegate {
    func blueTapped()
    func yellowTapped()
    func greenTapped()
    func redTapped()
}

class SimonView: UIView {

    init(delegate: SimonViewDelegate?) {
        self.delegate = delegate
        
        super.init(frame: CGRectZero)
        
        backgroundColor = UIColor.whiteColor()
        
        blueView.accessibilityLabel = "Blue"
        greenView.accessibilityLabel = "Green"
        yellowView.accessibilityLabel = "Yellow"
        redView.accessibilityLabel = "Red"
        
        blueView.backgroundColor = UIColor.blueColor()
        yellowView.backgroundColor = UIColor.yellowColor()
        greenView.backgroundColor = UIColor.greenColor()
        redView.backgroundColor = UIColor.redColor()
        
        blueView.addTarget(self, action: Selector("blueTapped"), forControlEvents: .TouchUpInside)
        yellowView.addTarget(self, action: Selector("yellowTapped"), forControlEvents: .TouchUpInside)
        greenView.addTarget(self, action: Selector("greenTapped"), forControlEvents: .TouchUpInside)
        redView.addTarget(self, action: Selector("redTapped"), forControlEvents: .TouchUpInside)
        
        scoreView.userInteractionEnabled = false
        scoreView.textColor = UIColor.whiteColor()
        scoreView.backgroundColor = UIColor.blackColor()
        scoreView.alpha = 0.75
        scoreView.text = "0"
        
        addSubview(blueView)
        addSubview(yellowView)
        addSubview(greenView)
        addSubview(redView)
        addSubview(scoreView)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        let xMid = floor(CGRectGetWidth(bounds) / 2)
        let yMid = floor(CGRectGetHeight(bounds) / 2)
        
        blueView.frame = CGRectMake(0, 0, xMid, yMid)
        yellowView.frame = CGRectMake(xMid, 0, xMid, yMid)
        greenView.frame = CGRectMake(0, yMid, xMid, yMid)
        redView.frame = CGRectMake(xMid, yMid, xMid, yMid)
        
        scoreView.sizeToFit()
        scoreView.center = center
    }
    
    func setScore(score: Int) {
        scoreView.text = "\(score)"
        setNeedsLayout()
    }
    
    let blueView = UIButton()
    let yellowView = UIButton()
    let greenView = UIButton()
    let redView = UIButton()
    let scoreView = UILabel()
    let delegate: SimonViewDelegate?
}

extension SimonView {
    func blueTapped() {
        delegate?.blueTapped()
    }
    func yellowTapped() {
        delegate?.yellowTapped()
    }
    func greenTapped() {
        delegate?.greenTapped()
    }
    func redTapped() {
        delegate?.redTapped()
    }
}

extension SimonView {
    
    func lightenView(view: UIView) {
        view.alpha = 0.5
    }
    
    func resetView(view: UIView) {
        view.alpha = 1
    }
    
    func lightenBlue() {
        lightenView(blueView)
    }
    
    func resetBlue() {
        resetView(blueView)
    }
    
    
    func lightenGreen() {
        lightenView(greenView)
    }
    
    func resetGreen() {
        resetView(greenView)
    }
    
    func lightenYellow() {
        lightenView(yellowView)
    }
    
    func resetYellow() {
        resetView(yellowView)
    }
    
    func lightenRed() {
        lightenView(redView)
    }
    
    func resetRed() {
        resetView(redView)
    }
}
