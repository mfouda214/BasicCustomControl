//
//  IconButton.swift
//  CustomControlDemo
//
//  Created by Mohamed Sobhi  Fouda on 3/1/18.
//  Copyright © 2018 Mohamed Sobhi Fouda. All rights reserved.
//

import UIKit

@IBDesignable
class IconButton: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialization()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialization()
    }
    
    private lazy var imageView : UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    private lazy var label : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 15.0, weight: UIFont.Weight.regular)
        return label
    }()
    
    private var spaceConstraint : NSLayoutConstraint!
    
    //@IBInspectable annotation.directly edit its value via the Attributes Inspecto
    @IBInspectable
    var spacing: CGFloat = 0.0 {
        didSet {
            spaceConstraint?.constant = spacing
        }
    }
    
    //@IBInspectable annotation.directly edit its value via the Attributes Inspecto
    @IBInspectable
    var image: UIImage? {
        get {
            return imageView.image
        }
        set(newImage) {
            imageView.image = newImage?.withRenderingMode(.alwaysTemplate)
        }
    }
    
    //@IBInspectable annotation.directly edit its value via the Attributes Inspecto
    @IBInspectable
    var text: String? {
        get {
            return label.text
        }
        set(newText) {
            label.text = newText
        }
    }
    
    private func initialization() {
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)
        addSubview(imageView)
        
        spaceConstraint = label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: spacing)
        
        NSLayoutConstraint.activate(
            [
                imageView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
                imageView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
                imageView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
                spaceConstraint,
                label.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor),
                imageView.centerXAnchor.constraint(equalTo: label.centerXAnchor)
            ]
        )
        
        layer.cornerRadius = 10
    }


}
