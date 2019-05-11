//
//  LandingPageViewController.swift
//  diagram_iOS
//
//  Created by Gaurav Pai on 01/04/19.
//  Copyright © 2019 Gaurav Pai. All rights reserved.
//

import UIKit

class LandingPageViewController: UIViewController {
    
    var stackView = UIStackView()
    static var projectName = ""
    static var applicationName = "Project Charter"
    var listController = UITableViewController()
    var projectListTable : UITableView!
    var projectList = [String]()
    var cellId = "projectlistcell"
    
    
    var createButton : UIButton
    {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "plus"), for: .normal)
        button.addTarget(self, action: #selector(openNewDoc), for: .touchUpInside)
        return button
    }
    
    var loadButton : UIButton {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "plus"), for: .normal)
        button.addTarget(self, action: #selector(loadExistingDoc), for: .touchUpInside)
        return button
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
        navigationController?.navigationBar.barTintColor = UIColor.darkGray
        navigationController?.navigationBar.barStyle = .blackOpaque
        navigationItem.title = "Excelsior: Project Charter"
        addButtons()

    }
    

    
    
    func addButtons()
    {
        stackView.isUserInteractionEnabled = true
        stackView.distribution  = UIStackView.Distribution.equalSpacing
        stackView.alignment = UIStackView.Alignment.center
        stackView.spacing = 30
        
        stackView.addArrangedSubview(createButton)
        stackView.addArrangedSubview(loadButton)
        //stackView.addArrangedSubview(recentsButton)
        self.view.addSubview(stackView)
        setupButtonLayout()
        
    }
    
    func setupButtonLayout()
    {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 100).isActive = true
        stackView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -100).isActive = true
        stackView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 200).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: 140).isActive = true
    }
    
    func populateProjectList(){
        let obj = FileHandling(name: "")
        projectList = obj.listSharedProjects()
        listController.tableView.delegate = self
        listController.tableView.dataSource = self
        listController.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        
    }

    func setNavigationBar() {
//        let screenSize: CGRect = UIScreen.main.bounds
//        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: screenSize.width, height: 80))
//        let navItem = UINavigationItem(title: "")
//        let doneItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(createSegue))
//        navItem.rightBarButtonItem = doneItem
//        navBar.setItems([navItem], animated: false)
//        self.view.addSubview(navBar)
    }
    

// OBJC Action Handlers
    @objc func loadExistingDoc()
    {
        let alert = UIAlertController(title: "Choose your project", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        populateProjectList()
        
        listController.preferredContentSize = CGSize(width: alert.view.frame.width, height: 400)
        
        alert.setValue(listController, forKey: "contentViewController")
        self.present(alert, animated: true)
    }
    
    @objc func openNewDoc(){
//        print("clicked")
        
        let alert = UIAlertController(title: "Enter the name of the Project", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "The name should be unique"
        })
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler:
        { action in
            if ((alert.textFields?.first?.text) != nil)
            {
                LandingPageViewController.projectName = alert.textFields!.first!.text!
                    let directory = FileHandling(name: LandingPageViewController.projectName)
//                    if directory.createSharedProjectDirectory()
//                    {
//                        if directory.createDocumentsProjectDirectory()
//                        {
                            print("Directory successfully created!")
                            let cont = ContainerViewController()
                            self.present(cont, animated: true)
//                        }
//                        else {self.showToast(message: "Project Name already exists.")}
                        
//                    }
//                    else {self.showToast(message: "Project Name already exists.")}
            }
        }))
        self.present(alert, animated: true)
    }

}


// MARK :- Entensions
extension LandingPageViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return projectList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let  cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell.textLabel?.text = projectList[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let cVC = ContainerViewController()
        let container = ContainerViewController()
        LandingPageViewController.projectName = projectList[indexPath.row]
        dismiss(animated: true) {
            self.present(container, animated: true)
        }
        
    }
}
