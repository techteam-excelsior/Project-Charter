//
//  CustomTableView.swift
//  Project Charter
//
//  Created by Vishal Hosakere on 08/05/19.
//  Copyright © 2019 Excelsior. All rights reserved.
//

import UIKit

class CustomTableView: UIView {

    private var keyArray = [String]()
    private var textArray1 = [UITextView]()
    private var valArray = [String]()
    private var textArray2 = [UITextView]()
    private var valArray2 = [String]()
    private var textArray3 = [UITextView]()
    private var columnCount = 0
    
    
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
    
    convenience init(withKeys keys: [String], withVals vals: [String], withVals2 vals2: [String] = [], columnCount columns: Int = 2){
        self.init()
        keyArray = keys
        valArray = vals
        valArray2 = vals2
        columnCount = columns
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
        print("cliked add more  ", keyArray.count)
        keyArray.append("")
        valArray.append("")
        print(keyArray.count)
        updateViews()
    }
    
    func updateViews(){
        if keyArray.count == textArray1.count{
            print("No increase in rows")
            return
        }
        
        if columnCount == 2{
            if textArray1.count == 0{
                let text1 = UITextView()
                text1.translatesAutoresizingMaskIntoConstraints = false
                text1.text = keyArray[0]
                text1.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                text1.layer.cornerRadius = 10
                text1.font = .systemFont(ofSize: 18)
                text1.isScrollEnabled = false
                text1.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                text1.layer.borderWidth = 2
                text1.textContainer.maximumNumberOfLines = 3
                textArray1.append(text1)
                self.addSubview(text1)
                
                let text2 = UITextView()
                text2.translatesAutoresizingMaskIntoConstraints = false
                text2.text = valArray[0]
                text2.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                text2.layer.cornerRadius = 10
                text2.font = .systemFont(ofSize: 18)
                text2.isScrollEnabled = false
                text2.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                text2.layer.borderWidth = 2
                text2.textContainer.maximumNumberOfLines = 3
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
            let diff = keyArray.count - textArray1.count
            if diff == 0{
                return
            }
            let base = textArray1.count
            for i in 0..<diff{
                let text1 = UITextView()
                text1.translatesAutoresizingMaskIntoConstraints = false
                text1.text = keyArray[base+i]
                text1.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                text1.layer.cornerRadius = 10
                text1.font = .systemFont(ofSize: 18)
                text1.isScrollEnabled = false
                text1.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                text1.layer.borderWidth = 2
                text1.textContainer.maximumNumberOfLines = 3
                textArray1.append(text1)
                self.addSubview(text1)
                
                let text2 = UITextView()
                text2.translatesAutoresizingMaskIntoConstraints = false
                text2.text = valArray[base+i]
                text2.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                text2.layer.cornerRadius = 10
                text2.font = .systemFont(ofSize: 18)
                text2.isScrollEnabled = false
                text2.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                text2.layer.borderWidth = 2
                text1.textContainer.maximumNumberOfLines = 3
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
                let text1 = UITextView()
                text1.translatesAutoresizingMaskIntoConstraints = false
                text1.text = keyArray[0]
                text1.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                text1.layer.cornerRadius = 10
                text1.font = .systemFont(ofSize: 18)
                text1.isScrollEnabled = false
                text1.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                text1.layer.borderWidth = 2
                text1.textContainer.maximumNumberOfLines = 3
                textArray1.append(text1)
                self.addSubview(text1)
                
                let text2 = UITextView()
                text2.translatesAutoresizingMaskIntoConstraints = false
                text2.text = valArray[0]
                text2.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                text2.layer.cornerRadius = 10
                text2.font = .systemFont(ofSize: 18)
                text2.isScrollEnabled = false
                text2.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                text2.layer.borderWidth = 2
                text2.textContainer.maximumNumberOfLines = 3
                textArray2.append(text2)
                self.addSubview(text2)
                
                let text3 = UITextView()
                text3.translatesAutoresizingMaskIntoConstraints = false
                text3.text = valArray[0]
                text3.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                text3.layer.cornerRadius = 10
                text3.font = .systemFont(ofSize: 18)
                text3.isScrollEnabled = false
                text3.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                text3.layer.borderWidth = 2
                text3.textContainer.maximumNumberOfLines = 3
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
            let diff = keyArray.count - textArray1.count
            if diff != 0{
            
                let base = textArray1.count
                for i in 0..<diff{
                    let text1 = UITextView()
                    text1.translatesAutoresizingMaskIntoConstraints = false
                    text1.text = keyArray[base+i]
                    text1.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                    text1.layer.cornerRadius = 10
                    text1.font = .systemFont(ofSize: 18)
                    text1.isScrollEnabled = false
                    text1.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                    text1.layer.borderWidth = 2
                    text1.textContainer.maximumNumberOfLines = 3
                    textArray1.append(text1)
                    self.addSubview(text1)
                    
                    let text2 = UITextView()
                    text2.translatesAutoresizingMaskIntoConstraints = false
                    text2.text = valArray[base+i]
                    text2.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                    text2.layer.cornerRadius = 10
                    text2.font = .systemFont(ofSize: 18)
                    text2.isScrollEnabled = false
                    text2.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                    text2.layer.borderWidth = 2
                    text2.textContainer.maximumNumberOfLines = 3
                    textArray2.append(text2)
                    self.addSubview(text2)
                    
                    let text3 = UITextView()
                    text3.translatesAutoresizingMaskIntoConstraints = false
                    text3.text = valArray[base+i]
                    text3.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                    text3.layer.cornerRadius = 10
                    text3.font = .systemFont(ofSize: 18)
                    text3.isScrollEnabled = false
                    text3.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                    text3.layer.borderWidth = 2
                    text3.textContainer.maximumNumberOfLines = 3
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
