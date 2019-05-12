//
//  CustomTableView.swift
//  Project Charter
//
//  Created by Vishal Hosakere on 08/05/19.
//  Copyright © 2019 Excelsior. All rights reserved.
//

import UIKit

class VerticallyCenteredTextView: UITextView {
    override var contentSize: CGSize {
        didSet {
            print("Changed content size of text view")
            var topCorrection = (bounds.size.height - contentSize.height * zoomScale) / 2.0
            topCorrection = max(0, topCorrection)
            contentInset = UIEdgeInsets(top: topCorrection, left: 0, bottom: 0, right: 0)
        }
    }
}


class CustomTableView: UIView {

    private var textArray1 = [VerticallyCenteredTextView]()
    private var textArray2 = [VerticallyCenteredTextView]()
    private var textArray3 = [VerticallyCenteredTextView]()
    private var myTable: Table!
    
    private var latestY: NSLayoutConstraint?
    var addMore : UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        button.setTitle("Add", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var delegate: homeDelegate!
    
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    convenience init(withTable table: Table){
        self.init()
        myTable = table
    }
    
    
    override func didMoveToSuperview() {
        updateViews()
        self.addSubview(addMore)
        addMore.leftAnchor.constraint(equalTo: self.rightAnchor, constant: -100).isActive = true
        addMore.topAnchor.constraint(equalTo: self.bottomAnchor, constant: -100).isActive = true
        addMore.widthAnchor.constraint(equalToConstant: 50).isActive = true
        addMore.heightAnchor.constraint(equalToConstant: 50).isActive = true
        addMore.addTarget(self, action: #selector(addRow), for: .touchUpInside)
    }

    
    @objc func addRow(_ sender: UIButton){
        var text1 = myTable.getArray(withIndex: 0)
        var text2 = myTable.getArray(withIndex: 1)
        var text3 = myTable.getArray(withIndex: 2)
        if (text1 == nil || text2 == nil || text3 == nil)
        {
            print("Could not fetch table data")
            return
        }
        text1?.append("")
        text2?.append("")
        myTable.setArray(withIndex: 0, withArray: text1!)
        myTable.setArray(withIndex: 1, withArray: text2!)
        if myTable.count == 3{
            text3?.append("")
            myTable.setArray(withIndex: 2, withArray: text3!)
        }
        updateViews()
    }
    
    func updateViews(){
        if myTable.getArray(withIndex: 0)?.count == textArray1.count{
            print("No increase in rows")
            return
        }
        
        if myTable.count == 2{
            if textArray1.count == 0{
                let text1 = VerticallyCenteredTextView()
                text1.translatesAutoresizingMaskIntoConstraints = false
                text1.text = myTable.getArray(withIndex: 0)![0]
                text1.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                text1.layer.cornerRadius = 10
                text1.font = .systemFont(ofSize: 18)
//                text1.isScrollEnabled = false
                text1.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                text1.layer.borderWidth = 2
                text1.textContainer.maximumNumberOfLines = 3
                text1.textContainer.lineBreakMode = .byTruncatingTail
                textArray1.append(text1)
                self.addSubview(text1)
                
                let text2 = VerticallyCenteredTextView()
                text2.translatesAutoresizingMaskIntoConstraints = false
                text2.text = myTable.getArray(withIndex: 1)![0]
                text2.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                text2.layer.cornerRadius = 10
                text2.font = .systemFont(ofSize: 18)
//                text2.isScrollEnabled = false
                text2.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                text2.layer.borderWidth = 2
                text2.textContainer.maximumNumberOfLines = 3
                text2.textContainer.lineBreakMode = .byTruncatingTail
                textArray2.append(text2)
                self.addSubview(text2)
                
                text1.topAnchor.constraint(equalTo: self.topAnchor, constant: 50).isActive = true
                text1.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 5).isActive = true
                text1.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/2) .isActive = true
                text1.heightAnchor.constraint(equalToConstant: 90).isActive = true
                
                text2.topAnchor.constraint(equalTo: self.topAnchor, constant: 50).isActive = true
                text2.leftAnchor.constraint(equalTo: text1.rightAnchor, constant: 0).isActive = true
                text2.widthAnchor.constraint(equalTo: text1.widthAnchor, constant: -10).isActive = true
                text2.heightAnchor.constraint(equalToConstant: 90).isActive = true
            }
            let diff = myTable.getArray(withIndex: 0)!.count - textArray1.count
            if diff == 0{
                return
            }
            let base = textArray1.count
            for i in 0..<diff{
                let text1 = VerticallyCenteredTextView()
                text1.translatesAutoresizingMaskIntoConstraints = false
                text1.text = myTable.getArray(withIndex: 0)![base+i]
                text1.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                text1.layer.cornerRadius = 10
                text1.font = .systemFont(ofSize: 18)
//                text1.isScrollEnabled = false
                text1.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                text1.layer.borderWidth = 2
                text1.textContainer.maximumNumberOfLines = 3
                text1.textContainer.lineBreakMode = .byTruncatingTail
                textArray1.append(text1)
                self.addSubview(text1)
                
                let text2 = VerticallyCenteredTextView()
                text2.translatesAutoresizingMaskIntoConstraints = false
                text2.text = myTable.getArray(withIndex: 1)![base+i]
                text2.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                text2.layer.cornerRadius = 10
                text2.font = .systemFont(ofSize: 18)
//                text2.isScrollEnabled = false
                text2.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                text2.layer.borderWidth = 2
                text2.textContainer.maximumNumberOfLines = 3
                text2.textContainer.lineBreakMode = .byTruncatingTail
                textArray2.append(text2)
                self.addSubview(text2)
                
                text1.topAnchor.constraint(equalTo: textArray1[textArray1.count-2].bottomAnchor, constant: 5).isActive = true
                text1.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 5).isActive = true
                text1.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/2) .isActive = true
                text1.heightAnchor.constraint(equalToConstant: 90).isActive = true
                
                text2.topAnchor.constraint(equalTo: textArray1[textArray1.count-2].bottomAnchor, constant: 5).isActive = true
                text2.leftAnchor.constraint(equalTo: text1.rightAnchor, constant: 0).isActive = true
                text2.widthAnchor.constraint(equalTo: text1.widthAnchor, constant: -10).isActive = true
                text2.heightAnchor.constraint(equalToConstant: 90).isActive = true
            }
        }
        else{
            if textArray1.count == 0{
                let text1 = VerticallyCenteredTextView()
                text1.translatesAutoresizingMaskIntoConstraints = false
                text1.text = myTable.getArray(withIndex: 0)![0]
                text1.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                text1.layer.cornerRadius = 10
                text1.font = .systemFont(ofSize: 18)
//                text1.isScrollEnabled = false
                text1.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                text1.layer.borderWidth = 2
                text1.textContainer.maximumNumberOfLines = 3
                text1.textContainer.lineBreakMode = .byTruncatingTail
                textArray1.append(text1)
                self.addSubview(text1)
                
                let text2 = VerticallyCenteredTextView()
                text2.translatesAutoresizingMaskIntoConstraints = false
                text2.text = myTable.getArray(withIndex: 1)![0]
                text2.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                text2.layer.cornerRadius = 10
                text2.font = .systemFont(ofSize: 18)
//                text2.isScrollEnabled = false
                text2.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                text2.layer.borderWidth = 2
                text2.textContainer.maximumNumberOfLines = 3
                text2.textContainer.lineBreakMode = .byTruncatingTail
                textArray2.append(text2)
                self.addSubview(text2)
                
                let text3 = VerticallyCenteredTextView()
                text3.translatesAutoresizingMaskIntoConstraints = false
                text3.text = myTable.getArray(withIndex: 2)![0]
                text3.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                text3.layer.cornerRadius = 10
                text3.font = .systemFont(ofSize: 18)
//                text3.isScrollEnabled = false
                text3.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                text3.layer.borderWidth = 2
                text3.textContainer.maximumNumberOfLines = 3
                text3.textContainer.lineBreakMode = .byTruncatingTail
                textArray2.append(text3)
                self.addSubview(text3)
                
                text1.topAnchor.constraint(equalTo: self.topAnchor, constant: 50).isActive = true
                text1.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 5).isActive = true
                text1.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/2) .isActive = true
                text1.heightAnchor.constraint(equalToConstant: 90).isActive = true
                
                text2.topAnchor.constraint(equalTo: self.topAnchor, constant: 50).isActive = true
                text2.leftAnchor.constraint(equalTo: text1.rightAnchor, constant: 0).isActive = true
                text2.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/4).isActive = true
                text2.heightAnchor.constraint(equalToConstant: 90).isActive = true
                
                text3.topAnchor.constraint(equalTo: self.topAnchor, constant: 50).isActive = true
                text3.leftAnchor.constraint(equalTo: text2.rightAnchor, constant: 0).isActive = true
                text3.widthAnchor.constraint(equalTo: text2.widthAnchor, constant: -10).isActive = true
                text3.heightAnchor.constraint(equalToConstant: 90).isActive = true
            }
            let diff = myTable.getArray(withIndex: 0)!.count - textArray1.count
            if diff != 0{
            
                let base = textArray1.count
                for i in 0..<diff{
                    let text1 = VerticallyCenteredTextView()
                    text1.translatesAutoresizingMaskIntoConstraints = false
                    text1.text = myTable.getArray(withIndex: 0)![base+i]
                    text1.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                    text1.layer.cornerRadius = 10
                    text1.font = .systemFont(ofSize: 18)
//                    text1.isScrollEnabled = false
                    text1.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                    text1.layer.borderWidth = 2
                    text1.textContainer.maximumNumberOfLines = 3
                    text1.textContainer.lineBreakMode = .byTruncatingTail
                    textArray1.append(text1)
                    self.addSubview(text1)
                    
                    let text2 = VerticallyCenteredTextView()
                    text2.translatesAutoresizingMaskIntoConstraints = false
                    text2.text = myTable.getArray(withIndex: 1)![base+i]
                    text2.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                    text2.layer.cornerRadius = 10
                    text2.font = .systemFont(ofSize: 18)
//                    text2.isScrollEnabled = false
                    text2.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                    text2.layer.borderWidth = 2
                    text2.textContainer.maximumNumberOfLines = 3
                    text2.textContainer.lineBreakMode = .byTruncatingTail
                    textArray2.append(text2)
                    self.addSubview(text2)
                    
                    let text3 = VerticallyCenteredTextView()
                    text3.translatesAutoresizingMaskIntoConstraints = false
                    text3.text = myTable.getArray(withIndex: 2)![base+i]
                    text3.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                    text3.layer.cornerRadius = 10
                    text3.font = .systemFont(ofSize: 18)
//                    text3.isScrollEnabled = false
                    text3.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                    text3.layer.borderWidth = 2
                    text3.textContainer.maximumNumberOfLines = 3
                    text3.textContainer.lineBreakMode = .byTruncatingTail
                    textArray2.append(text3)
                    self.addSubview(text3)
                    
                    text1.topAnchor.constraint(equalTo: textArray1[textArray1.count-2].bottomAnchor, constant: 5).isActive = true
                    text1.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 5).isActive = true
                    text1.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/2).isActive = true
                    text1.heightAnchor.constraint(equalToConstant: 90).isActive = true
                    
                    text2.topAnchor.constraint(equalTo: textArray1[textArray1.count-2].bottomAnchor, constant: 5).isActive = true
                    text2.leftAnchor.constraint(equalTo: text1.rightAnchor, constant: 0).isActive = true
                    text2.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/4).isActive = true
                    text2.heightAnchor.constraint(equalToConstant: 90).isActive = true
                    
                    text3.topAnchor.constraint(equalTo: textArray1[textArray1.count-2].bottomAnchor, constant: 5).isActive = true
                    text3.leftAnchor.constraint(equalTo: text2.rightAnchor, constant: 0).isActive = true
                    text3.widthAnchor.constraint(equalTo: text2.widthAnchor, constant: -10).isActive = true
                    text3.heightAnchor.constraint(equalToConstant: 90).isActive = true
                }
            }
        }
        
        if latestY != nil{
            latestY!.isActive = false
            self.removeConstraint(latestY!)
        }
        latestY = self.bottomAnchor.constraint(equalTo: textArray1.last!.bottomAnchor, constant: 100)
        latestY!.isActive = true
        self.layoutIfNeeded()
        delegate.resizeScrollView()
        
        //        self.scrollView.contentSize = CGSize(width: self.view.bounds.width, height: 100)
        //        mainView.bottomAnchor.constraint(equalTo: textArray1.last!.bottomAnchor, constant: 50).isActive = false
    }
}



