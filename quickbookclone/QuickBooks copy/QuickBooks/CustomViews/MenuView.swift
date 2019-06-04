//
//  MenuView.swift
//  QuickBooks
//
//  Created by Brandon Bravos on 6/4/19.
//  Copyright © 2019 Brandon Bravos. All rights reserved.
//

import UIKit

class MenuView: UIView{
    
    lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.separatorColor = .clear
        tv.delegate = self
        tv.dataSource = self
        return tv
    }()
    
    let font = UIFont.init(name: "AvenirNext-Medium", size: 12)

    var companySectionTitles = ["Home","Reciept Capture", "Products & Services"]
    var contactsSectionTitles = ["Customers & Projects", "Vendors"]
    var transactionSectionTitles = ["Banking", "Chart of Accounts", "Expenses", "Estimates", "Invoices", "Sales and Reciepts", "Bank Deposits", "Notes & Attatchments"]
    var reportsSectionTitles = ["Profit & Loss", "Balance Sheet"]
    var helpSectionTitles = ["Help & Feedback", "Settings"]

    


    


    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
      
   
    }
    
   
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}




















extension MenuView: UITableViewDelegate, UITableViewDataSource{
   
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let titleArray = ["COMPANY","CONTACTS","TRANSACTIONS","REPORTS","HELP AND SETTINGS"]
        
        return sectionHeader(title: titleArray[section])
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 25
    }
  
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
    


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return companySectionTitles.count
        case 1:
            return contactsSectionTitles.count
        case 2:
            return transactionSectionTitles.count
        case 3:
            return reportsSectionTitles.count
        case 4:
            return helpSectionTitles.count
        default:
            return 0
        }
    }
  
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath) as! MenuCell

        switch indexPath.section {
        case 0:
            cell.setCell(title: companySectionTitles[indexPath.row])
            return cell
        case 1:
            cell.setCell(title: contactsSectionTitles[indexPath.row])
            return cell
        case 2:
            cell.setCell(title: transactionSectionTitles[indexPath.row])
            return cell
        case 3:
            cell.setCell(title: reportsSectionTitles[indexPath.row])
            return cell
        case 4:
            cell.setCell(title: helpSectionTitles[indexPath.row])
            return cell
        default:
            return cell
        }
        
       
   
    }
    
    
    
    
    
}


extension MenuView{
    func setUpView(){
       
        self.backgroundColor = Colors.menuDarkBlue
        clipsToBounds = true
        
        let companyNameLabel = UILabel()
        companyNameLabel.sizeToFit()
        companyNameLabel.text = "Bravo4Brandon"
        companyNameLabel.font = font?.withSize(18)
        companyNameLabel.textAlignment = .left
        companyNameLabel.textColor = Colors.menuTextColor
        companyNameLabel.adjustsFontSizeToFitWidth = true
        addSubview(companyNameLabel)
        companyNameLabel.translatesAutoresizingMaskIntoConstraints = false
        companyNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 85).isActive = true
        companyNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10 ).isActive = true
        companyNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40 ).isActive = true
        
        addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: companyNameLabel.bottomAnchor, constant: 10).isActive = true
        tableView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        tableView.register(MenuCell.self, forCellReuseIdentifier: "MenuCell")
        tableView.backgroundColor = .clear

        
        
        let shadowView = UIView()
        shadowView.backgroundColor = .black
        addSubview(shadowView)
        shadowView.translatesAutoresizingMaskIntoConstraints = false
        shadowView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        shadowView.leadingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        shadowView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        shadowView.widthAnchor.constraint(equalToConstant: 45).isActive = true
        shadowView.layer.shadowColor = UIColor.black.cgColor
        shadowView.layer.shadowOpacity = 1
        shadowView.layer.shadowOffset = .zero
        shadowView.layer.shadowRadius = 15
    }
    
    func sectionHeader(title: String)-> UIView{
        let headerView = UILabel()
        headerView.text = "    \(title)"
        headerView.textColor = .white
        headerView.backgroundColor = Colors.menuSectionColor
        headerView.font = font?.withSize(12)
        return headerView
    }
    
}
