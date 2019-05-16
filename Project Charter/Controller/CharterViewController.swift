//
//  CharterViewController.swift
//  Project Charter
//
//  Created by Vishal Hosakere on 12/05/19.
//  Copyright © 2019 Excelsior. All rights reserved.
//

import UIKit

class CharterViewController: UIViewController, UIScrollViewDelegate {

    private var mainTitle : UILabel!
    private var problemTitle : UILabel!
    private var problemStatement : UITextView!
    private var businessTitle : UILabel!
    private var businessStatement : UITextView!
    private var projectTitle : UILabel!
    private var projectStatement : [UILabel]!
    private var financeTitle : UILabel!
    private var Ftable1: CustomTableView!
    private var Ftable2: CustomTableView!
    private var Ftable3: CustomTableView!
    private var projectTeamTitle : UILabel!
    private var Ptable1: CustomTableView!
    private var Ptable2: CustomTableView!
    private var Ptable3: CustomTableView!
    private var mainView: UIView!
    
    var scrollView: UIScrollView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureScrollView()
//        configureViews()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if mainView != nil{
            for view in mainView.subviews{
                view.removeFromSuperview()
            }
            mainView.removeFromSuperview()
        }
        configureViews()
        mainView.layoutIfNeeded()
        print(mainView.frame.size)
        scrollView.contentSize = mainView.frame.size
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
        
        self.scrollView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        self.scrollView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        self.scrollView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        //        self.scrollView.heightAnchor.constraint(equalTo: self.view.heightAnchor).isActive = true
        self.scrollView.heightAnchor.constraint(equalTo: self.view.heightAnchor, constant: 0).isActive = true
        self.scrollView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        
    }
    
    func configureViews(){
        let table0 = HomeViewController.tableData.getTable(withIndex: 0)
        let table1 = HomeViewController.tableData.getTable(withIndex: 1)
        let table2 = HomeViewController.tableData.getTable(withIndex: 2)
        let table3 = HomeViewController.tableData.getTable(withIndex: 3)
        let table4 = HomeViewController.tableData.getTable(withIndex: 4)
        let table5 = HomeViewController.tableData.getTable(withIndex: 5)
        let table6 = HomeViewController.tableData.getTable(withIndex: 6)
        let table7 = HomeViewController.tableData.getTable(withIndex: 7)

        print(table3)
        
        self.view.backgroundColor = .lightGray
        
        mainView = UIView()
        mainView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        mainView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(mainView)
        
        mainTitle = UILabel()
        mainTitle.text = "PROJECT CHARTER - EXCELSIOR"
        mainTitle.font = mainTitle.font.withSize(25)
        mainTitle.textAlignment = .center
        mainTitle.backgroundColor = .clear
        mainTitle.textColor = .black
        mainTitle.translatesAutoresizingMaskIntoConstraints = false
        mainView.addSubview(mainTitle)
        
        problemTitle = UILabel()
        problemTitle.text = "Problem Statement / Opportunity Area"
        problemTitle.textAlignment = .center
        problemTitle.backgroundColor = .green
        problemTitle.textColor = .black
        problemTitle.translatesAutoresizingMaskIntoConstraints = false
        mainView.addSubview(problemTitle)
        
        problemStatement = UITextView()
        problemStatement.text = table0?.getArray(withIndex: 1)![0]
        problemStatement.backgroundColor = .clear
        problemStatement.textColor = .black
        problemStatement.font = problemStatement.font?.withSize(18)
        problemStatement.translatesAutoresizingMaskIntoConstraints = false
        mainView.addSubview(problemStatement)
        
        businessTitle = UILabel()
        businessTitle.text = "Business Need / Justification"
        businessTitle.textAlignment = .center
        businessTitle.backgroundColor = .green
        businessTitle.textColor = .black
        businessTitle.translatesAutoresizingMaskIntoConstraints = false
        mainView.addSubview(businessTitle)
        
        businessStatement = UITextView()
        businessStatement.text = table0?.getArray(withIndex: 1)![3]
        businessStatement.backgroundColor  = .clear
        businessStatement.textColor = .black
        businessStatement.font = businessStatement.font?.withSize(18)
        businessStatement.translatesAutoresizingMaskIntoConstraints = false
        mainView.addSubview(businessStatement)
        
        projectTitle = UILabel()
        projectTitle.text = "Project Ownership / Approval"
        projectTitle.textAlignment = .center
        projectTitle.backgroundColor = .green
        projectTitle.textColor = .black
        projectTitle.translatesAutoresizingMaskIntoConstraints = false
        mainView.addSubview(projectTitle)
        
        projectStatement = []
        for i in (table1?.getArray(withIndex: 0)?.indices)!{
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.backgroundColor = .clear
            label.textColor = .black
            label.text = (table1?.getArray(withIndex: 0)![i])! + ": " + (table1?.getArray(withIndex: 1)![i])!
            projectStatement.append(label)
            mainView.addSubview(label)
        }
        
        financeTitle = UILabel()
        financeTitle.text = "Financial Benefits / Timings"
        financeTitle.textAlignment = .center
        financeTitle.backgroundColor = .green
        financeTitle.textColor = .black
        financeTitle.translatesAutoresizingMaskIntoConstraints = false
        mainView.addSubview(financeTitle)

        let smallerFont: CGFloat = 14
        Ftable1 = CustomTableView(withTable: table2!, withIndex: 99, isCharter: true)
        Ftable1.translatesAutoresizingMaskIntoConstraints = false
        Ftable1.addMore.isHidden = true
        mainView.addSubview(Ftable1)
        Ftable1.changeFont(withSize: smallerFont)

        Ftable2 = CustomTableView(withTable: table3!, withIndex: 99, isCharter: true)
        Ftable2.translatesAutoresizingMaskIntoConstraints = false
        Ftable2.addMore.isHidden = true
        mainView.addSubview(Ftable2)
        Ftable2.changeFont(withSize: smallerFont)

        Ftable3 = CustomTableView(withTable: table4!, withIndex: 99, isCharter: true)
        Ftable3.translatesAutoresizingMaskIntoConstraints = false
        Ftable3.addMore.isHidden = true
        mainView.addSubview(Ftable3)
        Ftable3.changeFont(withSize: smallerFont)
        
        projectTeamTitle = UILabel()
        projectTeamTitle.text = "Project Team"
        projectTeamTitle.textAlignment = .center
        projectTeamTitle.backgroundColor = .green
        projectTeamTitle.textColor = .black
        projectTeamTitle.translatesAutoresizingMaskIntoConstraints = false
        mainView.addSubview(projectTeamTitle)
        
        Ptable1 = CustomTableView(withTable: table5!, withIndex: 99, isCharter: true)
        Ptable1.translatesAutoresizingMaskIntoConstraints = false
        Ptable1.addMore.isHidden = true
        mainView.addSubview(Ptable1)
        Ptable1.changeFont(withSize: smallerFont)
        
        Ptable2 = CustomTableView(withTable: table5!, withIndex: 99, isCharter: true)
        Ptable2.translatesAutoresizingMaskIntoConstraints = false
        Ptable2.addMore.isHidden = true
        mainView.addSubview(Ptable2)
        Ptable2.changeFont(withSize: smallerFont)
        
        Ptable3 = CustomTableView(withTable: table5!, withIndex: 99, isCharter: true)
        Ptable3.translatesAutoresizingMaskIntoConstraints = false
        Ptable3.addMore.isHidden = true
        mainView.addSubview(Ptable3)
        Ptable3.changeFont(withSize: smallerFont)
        
        configureConstraints()
        
    }
    
    
    func configureConstraints(){
        mainTitle.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 10).isActive = true
        mainTitle.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 10).isActive = true
        mainTitle.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -20).isActive = true
        mainTitle.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        problemTitle.topAnchor.constraint(equalTo: mainTitle.bottomAnchor, constant: 20).isActive = true
        problemTitle.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 10).isActive = true
        problemTitle.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -20).isActive = true
        
        problemStatement.topAnchor.constraint(equalTo: problemTitle.bottomAnchor, constant: 20).isActive = true
        problemStatement.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 10).isActive = true
        problemStatement.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -20).isActive = true
        problemStatement.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        businessTitle.topAnchor.constraint(equalTo: problemStatement.bottomAnchor, constant: 20).isActive = true
        businessTitle.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 10).isActive = true
        businessTitle.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -20).isActive = true
        
        businessStatement.topAnchor.constraint(equalTo: businessTitle.bottomAnchor, constant: 20).isActive = true
        businessStatement.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 10).isActive = true
        businessStatement.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -20).isActive = true
        businessStatement.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        projectTitle.topAnchor.constraint(equalTo: businessStatement.bottomAnchor, constant: 20).isActive = true
        projectTitle.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 10).isActive = true
        projectTitle.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -20).isActive = true
        
        
        for i in 0...(projectStatement.count-1)/3{
            for j in 0...2{
                if (i*3 + j) > (projectStatement.count-1){
                    break
                }
                if j == 0, i == 0{
                    projectStatement[i*3 + j].topAnchor.constraint(equalTo: projectTitle.bottomAnchor, constant: 20).isActive = true
                    projectStatement[i*3 + j].leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 20).isActive = true
                    projectStatement[i*3 + j].widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 1/3, constant: -10).isActive = true
//                    projectStatement[i*3 + j].heightAnchor.constraint(equalToConstant: 25).isActive = true
                }
                else if  j == 0, i != 0{
                    projectStatement[i*3 + j].topAnchor.constraint(equalTo: projectStatement[(i-1)*3 + j].bottomAnchor, constant: 20).isActive = true
                    projectStatement[i*3 + j].leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 20).isActive = true
                    projectStatement[i*3 + j].widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 1/3, constant: -10).isActive = true
//                    projectStatement[i*3 + j].heightAnchor.constraint(equalToConstant: 25).isActive = true
                }
                else if i == 0, j != 0{
                    projectStatement[i*3 + j].topAnchor.constraint(equalTo: projectTitle.bottomAnchor, constant: 20).isActive = true
                    projectStatement[i*3 + j].leftAnchor.constraint(equalTo: projectStatement[i*3 + j - 1].rightAnchor, constant: 0).isActive = true
                    projectStatement[i*3 + j].widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 1/3, constant: -10).isActive = true
//                    projectStatement[i*3 + j].heightAnchor.constraint(equalToConstant: 25).isActive = true
                }
                else{
                    projectStatement[i*3 + j].topAnchor.constraint(equalTo: projectStatement[(i-1)*3 + j].bottomAnchor, constant: 20).isActive = true
                    projectStatement[i*3 + j].leftAnchor.constraint(equalTo: projectStatement[i*3 + j - 1].rightAnchor, constant: 0).isActive = true
                    projectStatement[i*3 + j].widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 1/3, constant: -10).isActive = true
//                    projectStatement[i*3 + j].heightAnchor.constraint(equalToConstant: 25).isActive = true
                }
            }
        }
        
        financeTitle.topAnchor.constraint(equalTo: projectStatement.last!.bottomAnchor, constant: 20).isActive = true
        financeTitle.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 10).isActive = true
        financeTitle.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -20).isActive = true

        Ftable1.topAnchor.constraint(equalTo: financeTitle.bottomAnchor, constant: 20).isActive = true
        Ftable1.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 10).isActive = true
        Ftable1.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 1/3, constant: -5).isActive = true
        
        Ftable2.topAnchor.constraint(equalTo: financeTitle.bottomAnchor, constant: 20).isActive = true
        Ftable2.leftAnchor.constraint(equalTo: Ftable1.rightAnchor, constant: 0).isActive = true
        Ftable2.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 1/3, constant: -5).isActive = true
        
        Ftable3.topAnchor.constraint(equalTo: financeTitle.bottomAnchor, constant: 20).isActive = true
        Ftable3.leftAnchor.constraint(equalTo: Ftable2.rightAnchor, constant: 0).isActive = true
        Ftable3.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 1/3, constant: -5).isActive = true
        
        let FviewMax = (Ftable1.frame.height > Ftable2.frame.height ? (Ftable1.frame.height > Ftable3.frame.height ? Ftable1 : Ftable3): (Ftable2.frame.height > Ftable3.frame.height ? Ftable2 : Ftable3) )
        
        projectTeamTitle.topAnchor.constraint(equalTo: FviewMax!.bottomAnchor, constant: -50).isActive = true
        projectTeamTitle.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 10).isActive = true
        projectTeamTitle.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -20).isActive = true
        
        
        Ptable1.topAnchor.constraint(equalTo: projectTeamTitle.bottomAnchor, constant: 20).isActive = true
        Ptable1.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 10).isActive = true
        Ptable1.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 1/3, constant: -5).isActive = true
        
        Ptable2.topAnchor.constraint(equalTo: projectTeamTitle.bottomAnchor, constant: 20).isActive = true
        Ptable2.leftAnchor.constraint(equalTo: Ftable1.rightAnchor, constant: 0).isActive = true
        Ptable2.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 1/3, constant: -5).isActive = true
        
        Ptable3.topAnchor.constraint(equalTo: projectTeamTitle.bottomAnchor, constant: 20).isActive = true
        Ptable3.leftAnchor.constraint(equalTo: Ftable2.rightAnchor, constant: 0).isActive = true
        Ptable3.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 1/3, constant: -5).isActive = true
        
        
        let PviewMax = (Ptable1.frame.height > Ptable2.frame.height ? (Ptable1.frame.height > Ptable3.frame.height ? Ptable1 : Ptable3): (Ptable2.frame.height > Ptable3.frame.height ? Ptable2 : Ptable3) )
        
        
        
        mainView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0).isActive = true
        mainView.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 0).isActive = true
        mainView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: 0).isActive = true
        mainView.bottomAnchor.constraint(equalTo: PviewMax!.bottomAnchor, constant: 50).isActive = true
    }
    
//    func updateTexts(){
//        let table0 = HomeViewController.tableData.getTable(withIndex: 0)
//        let table1 = HomeViewController.tableData.getTable(withIndex: 1)
//        let table2 = HomeViewController.tableData.getTable(withIndex: 2)
//        let table3 = HomeViewController.tableData.getTable(withIndex: 3)
//        let table4 = HomeViewController.tableData.getTable(withIndex: 4)
//        let table5 = HomeViewController.tableData.getTable(withIndex: 5)
//        let table6 = HomeViewController.tableData.getTable(withIndex: 6)
//        let table7 = HomeViewController.tableData.getTable(withIndex: 7)
//        print(table0)
//        print(table1)
//        problemStatement.text = table0?.getArray(withIndex: 1)![0]
//        businessStatement.text = table0?.getArray(withIndex: 1)![3]
//        for i in (table1?.getArray(withIndex: 0)?.indices)!{
//            projectStatement[i].text = (table1?.getArray(withIndex: 0)![i])! + ": " + (table1?.getArray(withIndex: 1)![i])!
//        }
//    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
