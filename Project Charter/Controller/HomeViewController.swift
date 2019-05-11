//
//  HomeViewController.swift
//  Main
//
//  Created by Gaurav Pai on 17/03/19.
//  Copyright © 2019 Gaurav Pai. All rights reserved.
//

import UIKit

var data = helperDatabase()

class HomeViewController:  UIViewController , UIScrollViewDelegate, UIGestureRecognizerDelegate, AppFileManipulation, AppFileStatusChecking, AppFileSystemMetaData, UITextViewDelegate, UIPageViewControllerDelegate {
    
    
    // MARK: - Properties
    static var delegate: HomeControllerDelegate?
    var scrollView: UIScrollView!
    var mainView: UIView!
    
    //variables that falicitate drawing arrows between two pluses(circle view with plus image inside)
    var jsonData : Data?
    var oldjSONData : Data?
    static var uniqueProcessID = 0
    
//    let cellId = "page1cell"
//    var products : [Product] = [Product]()
    
    var keyArray = [String]()
    var textArray1 = [UITextView]()
    var valArray = [String]()
    var textArray2 = [UITextView]()
    var latestY :NSLayoutConstraint!
    var customTable: CustomTableView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        configureNavigationBar()
        configureScrollView()
        updateArrays()
//        updateViews()
        
        customTable = CustomTableView(withKeys: keyArray, withVals: valArray)
        customTable.translatesAutoresizingMaskIntoConstraints = false
        customTable.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
        customTable.delegate = self
        scrollView.addSubview(customTable)
        customTable.leftAnchor.constraint(equalTo: scrollView.leftAnchor).isActive = true
        customTable.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        customTable.rightAnchor.constraint(equalTo: scrollView.rightAnchor).isActive = true
        customTable.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        
        ContainerViewController.menuDelegate = self
//        createProductArray()
//        tableView.register(ProductCell.self, forCellReuseIdentifier: cellId)
  
        // End of funciton viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        scrollView.contentSize = mainView.frame.size
        
    }
    
//    func createProductArray() {
//        products.append(Product(productName: "Glasses", productImage: #imageLiteral(resourceName: "plus") , productDesc: "This is best Glasses I've ever seen"))
//        products.append(Product(productName: "Desert", productImage: #imageLiteral(resourceName: "plus") , productDesc: "This is so yummy"))
//        products.append(Product(productName: "Camera Lens", productImage:  #imageLiteral(resourceName: "plus"), productDesc: "I wish I had this camera lens"))
//    }
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ProductCell
//        let currentLastItem = products[indexPath.row]
//        cell.product = currentLastItem
//        return cell
//    }
//
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return products.count
//    }
//
    
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
    
    
//    func updateViews(){
//        if keyArray.count == textArray1.count{
//            return
//        }
//
//        if textArray1.count == 0{
//            let text1 = UITextView()
//            text1.translatesAutoresizingMaskIntoConstraints = false
//            text1.text = keyArray[0]
//            text1.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
//            text1.layer.cornerRadius = 10
//            text1.font = .systemFont(ofSize: 18)
//            text1.isScrollEnabled = false
//            textArray1.append(text1)
//            mainView.addSubview(text1)
//
//            let text2 = UITextView()
//            text2.translatesAutoresizingMaskIntoConstraints = false
//            text2.text = valArray[0]
//            text2.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
//            text2.layer.cornerRadius = 10
//            text2.font = .systemFont(ofSize: 18)
//            text2.isScrollEnabled = false
//            textArray2.append(text2)
//            mainView.addSubview(text2)
//
//            text1.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 50).isActive = true
//            text1.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 5).isActive = true
//            text1.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 1/2) .isActive = true
//            text1.heightAnchor.constraint(equalToConstant: 90).isActive = true
//
//            text2.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 50).isActive = true
//            text2.leftAnchor.constraint(equalTo: text1.rightAnchor, constant: 0).isActive = true
//            text2.widthAnchor.constraint(equalTo: text1.widthAnchor, constant: -10).isActive = true
//            text2.heightAnchor.constraint(equalToConstant: 90).isActive = true
//        }
//        let diff = keyArray.count - textArray1.count
//        if diff == 0{
//            return
//        }
//        let base = textArray1.count - 1
//        for i in 0...diff{
//            let text1 = UITextView()
//            text1.translatesAutoresizingMaskIntoConstraints = false
//            text1.text = keyArray[base+i]
//            text1.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
//            text1.layer.cornerRadius = 10
//            text1.font = .systemFont(ofSize: 18)
//            text1.isScrollEnabled = false
//            text1.textContainer.maximumNumberOfLines = 3
//            textArray1.append(text1)
//            mainView.addSubview(text1)
//
//            let text2 = UITextView()
//            text2.translatesAutoresizingMaskIntoConstraints = false
//            text2.text = valArray[base+i]
//            text2.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
//            text2.layer.cornerRadius = 10
//            text2.font = .systemFont(ofSize: 18)
//            text2.isScrollEnabled = false
//            text1.textContainer.maximumNumberOfLines = 3
//            textArray2.append(text2)
//            mainView.addSubview(text2)
//
//            text1.topAnchor.constraint(equalTo: textArray1[textArray1.count-2].bottomAnchor, constant: 5).isActive = true
//            text1.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 5).isActive = true
//            text1.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 1/2) .isActive = true
//            text1.heightAnchor.constraint(equalToConstant: 90).isActive = true
//
//            text2.topAnchor.constraint(equalTo: textArray1[textArray1.count-2].bottomAnchor, constant: 5).isActive = true
//            text2.leftAnchor.constraint(equalTo: text1.rightAnchor, constant: 0).isActive = true
//            text2.widthAnchor.constraint(equalTo: text1.widthAnchor, constant: -10).isActive = true
//            text2.heightAnchor.constraint(equalToConstant: 90).isActive = true
//        }
//
//        latestY.isActive = false
//        mainView.removeConstraint(latestY)
//        latestY = mainView.bottomAnchor.constraint(equalTo: textArray1.last!.bottomAnchor, constant: 50)
//        latestY.isActive = true
//
//
////        self.scrollView.contentSize = CGSize(width: self.view.bounds.width, height: 100)
////        mainView.bottomAnchor.constraint(equalTo: textArray1.last!.bottomAnchor, constant: 50).isActive = false
//    }
    
    
    
    func textViewDidChange(_ textView: UITextView) {
        print("Called")
        let fixedWidth = CGFloat(180)
        let newSize = textView.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
        var newFrame = textView.frame
        newFrame.size = CGSize(width: max(newSize.width, fixedWidth), height: newSize.height)
        textView.frame = newFrame

        
//        let distanceToBottom = self.scrollView.frame.size.height - (activeField?.frame.origin.y)! - (activeField?.frame.size.height)!
//        let collapseSpace = keyboardHeight - distanceToBottom
//        if collapseSpace > 0 {
//            // set new offset for scroll view
//            UIView.animate(withDuration: 0.3, animations: {
//                // scroll to the position above keyboard 10 points
//                self.scrollView.contentOffset = CGPoint(x: self.lastOffset.x, y: collapseSpace + 10)
//            })
//        }
//        print("In text view: ",self.contentView.frame)
//        //Update the scrollView content size to account for the increased contentView
//        let size = self.mainView.frame.size
//        self.scrollView.contentSize = CGSize(width: size.width, height: size.height + keyboardHeight)
//        self.contentView.layoutIfNeeded()
    }
    
    // MARK: - Handlers
    
    func configureScrollView()
    {
        self.scrollView = UIScrollView()
        self.scrollView.translatesAutoresizingMaskIntoConstraints = false
        self.scrollView.delegate = self
        self.view.addSubview(scrollView)
        self.scrollView.contentSize = CGSize(width: self.view.bounds.width, height: self.view.bounds.height)
        self.mainView = UIView()
        self.scrollView.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        self.mainView.backgroundColor = .clear
        self.mainView.translatesAutoresizingMaskIntoConstraints = false
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

    func configureNavigationBar()
    {
        
        navigationController?.navigationBar.barTintColor = UIColor.darkGray
        navigationController?.navigationBar.barStyle = .blackTranslucent
        navigationItem.title = "Excelsior: Project Charter"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "options")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(didClickMenu))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "exit")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(didClickExit))
    }
    
    func checkForChanges()
    {
        
    }
    
    func load_action()
    {
        
    }
    
    func restoreState(allData: entireData)
    {
        
    }
    
    //    Generates unique ID for the shapes
    func getUniqueID() -> Int{
        HomeViewController.uniqueProcessID += 1
        return HomeViewController.uniqueProcessID
    }
    
    @objc func didClickExit(){
        
        checkForChanges()
        dismiss(animated: true, completion: nil)
    }
    
    
    @objc func didClickMenu()
    {
        HomeViewController.delegate?.handleMenuToggle(forMenuOption: nil)
    }

    // End of Class HomeViewController
}


// Extenstions

extension UIImage {
    func isEqual(to image: UIImage) -> Bool {
        guard let data1: Data = self.pngData(),
            let data2: Data = image.pngData() else {
                return false
        }
        return data1.elementsEqual(data2)
    }
}

extension FloatingPoint {
    func rounded(to value: Self, roundingRule: FloatingPointRoundingRule = .toNearestOrAwayFromZero) -> Self{
        return (self / value).rounded(roundingRule) * value
        
    }
}

extension CGPoint {
    func rounded(to value: CGFloat, roundingRule: FloatingPointRoundingRule = .toNearestOrAwayFromZero) -> CGPoint{
        return CGPoint(x: CGFloat((self.x / value).rounded(.toNearestOrAwayFromZero) * value), y: CGFloat((self.y / value).rounded(.toNearestOrAwayFromZero) * value))
    }
}

extension CGRect {
    func rounded(to value: CGFloat, roundingRule: FloatingPointRoundingRule = .toNearestOrAwayFromZero) -> CGRect{
        return CGRect(x: self.origin.x, y: self.origin.y, width: CGFloat((self.width / value).rounded(.toNearestOrAwayFromZero) * value), height: CGFloat((self.height / value).rounded(.toNearestOrAwayFromZero) * value))
    }
}

extension UIViewController {
    
    func showToast(message : String) {
        
        let toastLabel = UILabel(frame: CGRect(x:0, y: 0, width: 150, height: 40))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center;
        toastLabel.font = UIFont(name: "Montserrat-Light", size: 12.0)
        toastLabel.text = "  "+message+"  "
        toastLabel.sizeToFit()
        toastLabel.center = CGPoint(x: self.view.frame.width/2, y: self.view.frame.height-75)
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 5;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    } }

extension UIViewController {
    func showInputDialog(title:String? = nil,
                         subtitle:String? = nil,
                         actionTitle:String? = "Add",
                         cancelTitle:String? = "Cancel",
                         inputPlaceholder:String? = nil,
                         inputKeyboardType:UIKeyboardType = UIKeyboardType.default,
                         cancelHandler: ((UIAlertAction) -> Swift.Void)? = nil,
                         actionHandler: ((_ text: String?) -> Void)? = nil) {
        
        let alert = UIAlertController(title: title, message: subtitle, preferredStyle: .alert)
        alert.addTextField { (textField:UITextField) in
            textField.placeholder = inputPlaceholder
            textField.keyboardType = inputKeyboardType
        }
        alert.addAction(UIAlertAction(title: actionTitle, style: .destructive, handler: { (action:UIAlertAction) in
            guard let textField =  alert.textFields?.first else {
                actionHandler?(nil)
                return
            }
            actionHandler?(textField.text)
        }))
        alert.addAction(UIAlertAction(title: cancelTitle, style: .cancel, handler: cancelHandler))
        
        self.present(alert, animated: true, completion: nil)
    }
}

extension HomeViewController: homeDelegate
{
    func resizeScrollView() {
        print("Changing scrollview content size")
        scrollView.contentSize = customTable.frame.size
    }
}

extension HomeViewController: menuControllerDelegate
{
    func moveToTrash() {
        
    }
    
    func listTrashItems() {
        
    }
    
    func saveIntoVariables()
    {
        
    }
    
    func saveViewState() {
        
        saveIntoVariables()
        
        //        let path = getURL(for: .Documents).appendingPathComponent(LandingPageViewController.projectName)
        let fileName = LandingPageViewController.projectName+".excelsior"
        if writeFile(containing: String(data: jsonData!, encoding: .utf8)!, to: getURL(for: .ProjectInShared), withName: fileName) {
            self.showToast(message: "Saved Successfully.")
        }
        print(getURL(for: .Shared))
    }
    
    func saveViewStateAsNew() {
        
        let alert = UIAlertController(title: "Enter the name of the Project", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "The name should be unique"
        })
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            if ((alert.textFields?.first?.text) != nil)
            {
                LandingPageViewController.projectName = alert.textFields!.first!.text!
                let directory = FileHandling(name: LandingPageViewController.projectName)
                if directory.createSharedProjectDirectory(), directory.createDocumentsProjectDirectory()
                {
                    print("Directory successfully created!")
                    //                    let path = self.getURL(for: .Documents).appendingPathComponent(LandingPageViewController.projectName)
                    self.saveIntoVariables()
                    let fileName = LandingPageViewController.projectName+".excelsior"
                    if self.writeFile(containing: String(data: self.jsonData!, encoding: .utf8)!, to: self.getURL(for: .ProjectInShared), withName: fileName)
                    {
                        self.showToast(message: "Saved Successfully")
                    }
                }
            }
        }))
        self.present(alert, animated: true)
    }
    
    func takeScreenShot()
    {
        self.showToast(message: "Screenshot captured!")
        
    }
    
    func exportAsPDF()
    {
        self.showToast(message: "PDF created successfully")
        
    }
}


extension String {
    func encodeUrl() -> String? {
        return self.addingPercentEncoding( withAllowedCharacters: NSCharacterSet.urlQueryAllowed)
    }
    func decodeUrl() -> String? {
        return self.removingPercentEncoding
    }
}
