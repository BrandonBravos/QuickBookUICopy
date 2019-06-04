//
//  MenuCell.swift
//  QuickBooks
//
//  Created by Brandon Bravos on 6/4/19.
//  Copyright © 2019 Brandon Bravos. All rights reserved.
//

import UIKit

class MenuCell: UITableViewCell {
    
    let menuLabel = UILabel()
    let fonts = UIFont.init(name: "AvenirNext-Medium", size: 18)

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 

   private func setUpView(){
        backgroundColor = .clear
    
        menuLabel.sizeToFit()
        menuLabel.text = "MenuLabel"
        menuLabel.font = fonts
        menuLabel.textAlignment = .left
        menuLabel.textColor = Colors.menuTextColor
        menuLabel.adjustsFontSizeToFitWidth = true

        addSubview(menuLabel)
        menuLabel.translatesAutoresizingMaskIntoConstraints = false
        menuLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        menuLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10 ).isActive = true
        menuLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40 ).isActive = true
        menuLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 10).isActive = true



        
    }
    
    func setCell(title: String){
        menuLabel.text = title
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        switch selected {
        case true:
            self.menuLabel.textColor = .black
        case false:
            self.menuLabel.textColor =  Colors.menuTextColor
        }
    }

}
