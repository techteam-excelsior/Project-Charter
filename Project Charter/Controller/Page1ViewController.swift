//
//  Page1ViewController.swift
//  Project Charter
//
//  Created by Vishal Hosakere on 11/05/19.
//  Copyright © 2019 Excelsior. All rights reserved.
//

import UIKit



class Page1ViewController: UIViewController, UIScrollViewDelegate, UIGestureRecognizerDelegate {
    var scrollView: UIScrollView!
    var keyArray = [String]()
    var textArray1 = [UITextView]()
    var valArray = [String]()
    var textArray2 = [UITextView]()
    var latestY :NSLayoutConstraint!
    var customTable: CustomTableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureScrollView()
        updateArrays()
        //        updateViews()
        
        customTable = CustomTableView(withKeys: keyArray, withVals: valArray)
        customTable.translatesAutoresizingMaskIntoConstraints = false
        customTable.backgroundColor = .clear
        customTable.delegate = self
        scrollView.addSubview(customTable)
        customTable.leftAnchor.constraint(equalTo: scrollView.leftAnchor).isActive = true
        customTable.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        customTable.rightAnchor.constraint(equalTo: scrollView.rightAnchor).isActive = true
        customTable.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        // Do any additional setup after loading the view.
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(appMovedToForeground), name: UIApplication.willEnterForegroundNotification, object: nil)
    }
    
//    override func viewDidLayoutSubviews() {
//        customTable.layoutIfNeeded()
//        print("Page view did layout ", customTable.bounds.size)
//        resizeScrollView()
//    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        customTable.layoutIfNeeded()
        print("Page view did appear ", customTable.bounds.size)
//        resizeScrollView()
    }

    override func viewDidDisappear(_ animated: Bool) {
        print("View Disappered")
    }
    
    func updateArrays(){
        keyArray.append("What is the current Senario?")
        valArray.append("")
        keyArray.append("What is wrong with the current Senario?")
        valArray.append("")
        keyArray.append("Numbers associated with the problem (failure rate, cost, ...)")
        valArray.append("")
        keyArray.append("Where do you want to get?")
        valArray.append("")
        keyArray.append("What is the gap")
        valArray.append("")
        keyArray.append("Process Gap")
        valArray.append("")
        keyArray.append("Financial Gap")
        valArray.append("")
    }
    
    func configureScrollView()
    {
        self.scrollView = UIScrollView()
        self.scrollView.translatesAutoresizingMaskIntoConstraints = false
        self.scrollView.delegate = self
        self.view.addSubview(scrollView)
        self.scrollView.contentSize = CGSize(width: self.view.bounds.width, height: self.view.bounds.height)
        self.scrollView.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        //        self.scrollView.addSubview(mainView)
        //        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
        //        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        //        self.scrollView.addGestureRecognizer(swipeLeft)
        self.view.backgroundColor = .white
        
        self.scrollView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 150).isActive = true
        self.scrollView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        self.scrollView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        //        self.scrollView.heightAnchor.constraint(equalTo: self.view.heightAnchor).isActive = true
        self.scrollView.heightAnchor.constraint(equalTo: self.view.heightAnchor, constant: -250).isActive = true
        self.scrollView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        
        //        mainView.backgroundColor = #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
        //        mainView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        //        mainView.leftAnchor.constraint(equalTo: scrollView.leftAnchor).isActive = true
        //        mainView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        //        latestY =  mainView.bottomAnchor.constraint(equalTo: mainView.topAnchor, constant: 300)
        //        latestY.isActive = true
        
        //        self.mainView.addSubview(addMore)
        
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.customTable!
    }
    
    @objc func appMovedToForeground() {
        customTable.layoutIfNeeded()
        resizeScrollView()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


extension Page1ViewController: homeDelegate
{
    func resizeScrollView() {
        
        scrollView.contentSize = customTable.frame.size
        
        print("Changing scrollview content size to ",customTable.frame.size)
    }
}