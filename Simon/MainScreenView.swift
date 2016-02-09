//
//  MainScreenView.swift
//  Simon
//
//  Created by Joseph Ellegood on 2/8/16.
//  Copyright © 2016 Joseph Ellegood. All rights reserved.
//

import UIKit

protocol MainScreenViewDelegate {
    func playButtonPressed()
}

class MainScreenView: UIView {
    init(delegate: MainScreenViewDelegate?) {
        self.delegate = delegate
        
        super.init(frame: CGRectZero)
        
        playButton.setTitle("Play", forState: .Normal)
        playButton.addTarget(self, action: Selector("playButtonTapped"), forControlEvents: .TouchUpInside)
        
        titleLabel.text = "Simple Simon"
        titleLabel.font = UIFont.systemFontOfSize(40)
        titleLabel.textAlignment = .Center
        
        addSubview(playButton)
        addSubview(titleLabel)
        
        backgroundColor = UIColor.greenColor()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        let titleLabelSize = titleLabel.sizeThatFits(bounds.size)
        let playButtonSize = playButton.sizeThatFits(bounds.size)
        let gapBetweenTitleAndPlayButton: CGFloat = 20
        
        let totalSize = titleLabelSize.height + playButtonSize.height + gapBetweenTitleAndPlayButton
        let initialYOffset = floor((CGRectGetHeight(bounds) - totalSize) / 2)
        
        titleLabel.frame = CGRectMake(0, initialYOffset, CGRectGetWidth(bounds), titleLabelSize.height)
        playButton.frame = CGRectMake(0, CGRectGetMaxY(titleLabel.frame), CGRectGetWidth(bounds), playButtonSize.width)
    }
    
    func playButtonTapped() {
        delegate?.playButtonPressed()
    }
    
    let titleLabel = UILabel()
    let playButton = UIButton()
    let delegate: MainScreenViewDelegate?
}
