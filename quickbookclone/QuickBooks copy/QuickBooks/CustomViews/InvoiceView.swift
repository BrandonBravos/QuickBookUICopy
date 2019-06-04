//
//  InvoiceView.swift
//  QuickBooks
//
//  Created by Brandon Bravos on 6/3/19.
//  Copyright © 2019 Brandon Bravos. All rights reserved.
//

import UIKit

class InvoiceView: UIView {
    
    
    var tempLastView: UIView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = Colors.grayBackGround2
        clipsToBounds = true
        setUpView()
        
    }
    
    var buttonTapped:(()->Void)?
    
    private func setUpView(){
        
        let font = UIFont.init(name: "AvenirNext-Medium", size: 16)
        
        let titleLabel = UILabel()
        titleLabel.text = "Invoices"
        titleLabel.font = font
        titleLabel.sizeToFit()
        titleLabel.alpha = 0.4
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        
        let paidBar = BarTypeTwo(color1: .orange, color2: .gray, paid: false)
        paidBar.sizeToFit()
        addSubview(paidBar)
        paidBar.translatesAutoresizingMaskIntoConstraints = false
        paidBar.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 17).isActive = true
        paidBar.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
        paidBar.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15).isActive = true
        
        let unpaidBar = BarTypeTwo(color1: Colors.darkerGreen, color2: .green , paid: true)
        unpaidBar.sizeToFit()
        addSubview(unpaidBar)
        unpaidBar.translatesAutoresizingMaskIntoConstraints = false
        unpaidBar.topAnchor.constraint(equalTo: paidBar.bottomAnchor, constant: 17).isActive = true
        unpaidBar.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
        unpaidBar.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15).isActive = true
        
        
        tempLastView = unpaidBar
        
        let creatInvoiceButton = UIButton()
        creatInvoiceButton.setTitle("Create invoice", for: .normal)
        creatInvoiceButton.setTitleColor(Colors.darkBlue, for: .normal)
        creatInvoiceButton.layer.borderColor = Colors.grayBorderOne.cgColor
        creatInvoiceButton.layer.borderWidth = 1.4
        addSubview(creatInvoiceButton)
        creatInvoiceButton.translatesAutoresizingMaskIntoConstraints = false
        creatInvoiceButton.topAnchor.constraint(equalTo: tempLastView!.bottomAnchor, constant: 17).isActive = true
        creatInvoiceButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: -1.4).isActive = true
        creatInvoiceButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 1.4).isActive = true
        creatInvoiceButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -1.4).isActive = true
        creatInvoiceButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        
        
        
    }
    
    
    
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
