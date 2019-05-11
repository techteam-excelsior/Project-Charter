//
//  twoColumn.swift
//  Project Charter
//
//  Created by Vishal Hosakere on 07/05/19.
//  Copyright © 2019 Excelsior. All rights reserved.
//

import UIKit
class ProductCell : UITableViewCell {
    
    var product : Product? {
        didSet {
            productImage.image = product?.productImage
            productNameLabel.text = product?.productName
            productDescriptionLabel.text = product?.productDesc
        }
    }
    
    
    private let productNameLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.textAlignment = .left
        return lbl
    }()
    
    
    private let productDescriptionLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()
    
    private let decreaseButton : UIButton = {
        let btn = UIButton(type: .custom)
        btn.setImage(#imageLiteral(resourceName: "plus"), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFill
        return btn
    }()
    
    private let increaseButton : UIButton = {
        let btn = UIButton(type: .custom)
        btn.setImage(#imageLiteral(resourceName: "plus"), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFill
        return btn
    }()
    var productQuantity : UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .left
        label.text = "1"
        label.textColor = .black
        return label
        
    }()
    
    private let productImage : UIImageView = {
        let imgView = UIImageView(image: #imageLiteral(resourceName: "plus"))
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        return imgView
    }()
    
    
    private let textView1 : UITextView = {
        let text = UITextView()
        text.textContainer.maximumNumberOfLines = 3
        text.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        text.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        text.isScrollEnabled = false
        text.font = text.font?.withSize(20)
        return text
    }()
    
    private let textView2 : UITextView = {
        let text = UITextView()
        text.textContainer.maximumNumberOfLines = 3
        text.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        text.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        text.isScrollEnabled = false
        text.font = text.font?.withSize(20)
        return text
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        addSubview(productImage)
//        addSubview(productNameLabel)
//        addSubview(productDescriptionLabel)
//        addSubview(decreaseButton)
//        addSubview(productQuantity)
//        addSubview(increaseButton)
        addSubview(textView1)
        addSubview(textView2)
        print(self.frame)
//        productImage.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 5, paddingLeft: 5, paddingBottom: 5, paddingRight: 0, width: 90, height: 0, enableInsets: false)
//        productNameLabel.anchor(top: topAnchor, left: productImage.rightAnchor, bottom: nil, right: nil, paddingTop: 20, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: frame.size.width / 2, height: 0, enableInsets: false)
//        productDescriptionLabel.anchor(top: productNameLabel.bottomAnchor, left: productImage.rightAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: frame.size.width / 2, height: 0, enableInsets: false)
        
        textView1.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 5, paddingLeft: 5, paddingBottom: 5, paddingRight: 5, width: self.frame.width , height: 90, enableInsets: false)
        textView2.anchor(top: topAnchor, left: textView1.rightAnchor , bottom: bottomAnchor, right: nil, paddingTop: 5, paddingLeft: 5, paddingBottom: 5, paddingRight: 5, width: self.frame.width , height: 90, enableInsets: false)
        
        
//        let stackView = UIStackView(arrangedSubviews: [decreaseButton,productQuantity,increaseButton])
//        stackView.distribution = .equalSpacing
//        stackView.axis = .horizontal
//        stackView.spacing = 5
//        addSubview(stackView)
//        stackView.anchor(top: topAnchor, left: productNameLabel.rightAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 15, paddingLeft: 5, paddingBottom: 15, paddingRight: 10, width: 0, height: 70, enableInsets: false)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
