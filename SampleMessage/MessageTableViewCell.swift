//
//  MessageTableViewCell.swift
//  SampleMessage
//
//  Created by Thomas Baldwin on 8/26/15.
//  Copyright (c) 2015 Thomas Baldwin. All rights reserved.
//

import UIKit

class MessageTableViewCell: UITableViewCell {
    var didSetupConstraints = false
    
    var thumbnail = UIImageView.newAutoLayoutView()
    let messageTailIcon = UIImageView.newAutoLayoutView()
    var messageView = UIView.newAutoLayoutView()
    var messageLabel = UILabel.newAutoLayoutView()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        thumbnail.image = UIImage(named: "ThomasBaldwin")
        thumbnail.layer.cornerRadius = 17.5
        thumbnail.clipsToBounds = true
        
        messageTailIcon.image = UIImage(named: "MessageTailIcon")
        
        messageView.backgroundColor = UIColor.redColor()
        messageView.layer.cornerRadius = 10
        
        let paragraphStyle = NSMutableParagraphStyle.new()
        paragraphStyle.lineSpacing = 8
        
        messageLabel.numberOfLines = 0
        messageLabel.layer.cornerRadius = 10
        messageLabel.attributedText = NSMutableAttributedString(
            string: "Thomas",
            // string: "Thomas says hello", // switch back to this to see it display the text properly on one
            attributes: [
                NSFontAttributeName: UIFont.systemFontOfSize(12),
                NSForegroundColorAttributeName: UIColor.blackColor(),
                NSBackgroundColorAttributeName: UIColor.redColor(),
                NSKernAttributeName: 0.5,
                NSParagraphStyleAttributeName: paragraphStyle
            ]
        )
        
        contentView.addSubview(thumbnail)
        contentView.addSubview(messageView)
        messageView.addSubview(messageTailIcon)
        messageView.addSubview(messageLabel)
        updateConstraints()
    }
    
    override func updateConstraints() {
        if !didSetupConstraints {
            
            thumbnail.autoPinEdgeToSuperviewEdge(.Top, withInset: 15)
            thumbnail.autoPinEdgeToSuperviewEdge(.Leading, withInset: 8.5)
            thumbnail.autoSetDimensionsToSize(CGSize(width: 35, height: 35))
            
            messageView.autoPinEdgeToSuperviewEdge(.Top, withInset: 17.5)
            messageView.autoPinEdge(.Leading, toEdge: .Trailing, ofView: thumbnail, withOffset: 10)
            messageView.autoPinEdgeToSuperviewEdge(.Trailing, withInset: 24.5)
            messageView.autoPinEdgeToSuperviewEdge(.Bottom)
            
            messageTailIcon.autoPinEdgeToSuperviewEdge(.Top, withInset: 15)
            messageTailIcon.autoPinEdgeToSuperviewEdge(.Leading, withInset: -10)
            messageTailIcon.autoSetDimensionsToSize(CGSize(width: 18, height: 9))
            
            messageLabel.autoPinEdgesToSuperviewEdgesWithInsets(UIEdgeInsets(top: 8.5, left: 10, bottom: 8.5, right: 5), excludingEdge: .Trailing)
            messageLabel.autoPinEdgeToSuperviewEdge(.Trailing, withInset: 0, relation: .GreaterThanOrEqual)
            
            didSetupConstraints = true
        }
        
        super.updateConstraints()
    }
    
}