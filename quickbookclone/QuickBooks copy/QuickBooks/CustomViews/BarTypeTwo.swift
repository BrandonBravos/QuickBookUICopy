//
//  BarTypeTwo.swift
//  QuickBooks
//
//  Created by Brandon Bravos on 6/3/19.
//  Copyright © 2019 Brandon Bravos. All rights reserved.
//

import UIKit

class BarTypeTwo: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
    }
    
    init(color1: UIColor, color2: UIColor, paid: Bool){
        super.init(frame: .zero)
        
        setUpView(color1: color1, color2: color2, paid: paid)
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
        
    }
    
  
    
    func setUpView(color1: UIColor, color2: UIColor, paid: Bool){
        
       
        
        let size: CGFloat = 0.5
        
        let font = UIFont.init(name: "AvenirNext-Medium", size: 16)

        let titleAmountLabel = UILabel()
        titleAmountLabel.sizeToFit()
        titleAmountLabel.text = paid ? "$0 PAID" : "$0 UNPAID"
        titleAmountLabel.font = font?.withSize(13)
        addSubview(titleAmountLabel)
        titleAmountLabel.translatesAutoresizingMaskIntoConstraints = false
        titleAmountLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        titleAmountLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        
       
        
        let historyLabel = UILabel()
        historyLabel.text = paid ? "Last 30 days" : "Last 365 days"
        historyLabel.font = font?.withSize(11)
        historyLabel.alpha = 0.4
         historyLabel.sizeToFit() 
        addSubview(historyLabel)
        historyLabel.translatesAutoresizingMaskIntoConstraints = false
        historyLabel.bottomAnchor.constraint(equalTo: titleAmountLabel.bottomAnchor).isActive = true
        historyLabel.leadingAnchor.constraint(equalTo: titleAmountLabel.trailingAnchor, constant: 3).isActive = true
      
        
        
        
        let amountLabelOne = UILabel()
        amountLabelOne.text = "$0"
        amountLabelOne.font = font?.withSize(27)
        amountLabelOne.textColor = color1
        amountLabelOne.alpha = 0.4
        amountLabelOne.sizeToFit()
        addSubview(amountLabelOne)
        amountLabelOne.translatesAutoresizingMaskIntoConstraints = false
        amountLabelOne.topAnchor.constraint(equalTo: titleAmountLabel.bottomAnchor, constant: 8).isActive = true
        amountLabelOne.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        
        
        let amountLabelTwo = UILabel()
        amountLabelTwo.text = "$0"
        amountLabelTwo.font = font?.withSize(27)
        amountLabelTwo.textColor = color2
        amountLabelTwo.alpha = 0.4
        amountLabelTwo.sizeToFit()
        addSubview(amountLabelTwo)
        amountLabelTwo.translatesAutoresizingMaskIntoConstraints = false
        amountLabelTwo.topAnchor.constraint(equalTo: titleAmountLabel.bottomAnchor, constant: 3).isActive = true
        amountLabelTwo.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        
        let barLabel1 = UILabel()
        barLabel1.text  = paid ? "NOT DEPOSITED" :  "OVERDUE"
        barLabel1.font =  font?.withSize(13)
        barLabel1.sizeToFit()
        barLabel1.alpha =  0.4
        addSubview(barLabel1)
        barLabel1.translatesAutoresizingMaskIntoConstraints = false
        barLabel1.topAnchor.constraint(equalTo: amountLabelOne.bottomAnchor).isActive = true
        barLabel1.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        
        
        
        let barLabel2 = UILabel()
        barLabel2.text  = paid ? "DEPOSITED" :  "NOT YET DUE"
        barLabel2.sizeToFit()
        barLabel2.font =  font?.withSize(13)
        barLabel2.alpha =  0.4
        addSubview(barLabel2)
        barLabel2.translatesAutoresizingMaskIntoConstraints = false
        barLabel2.topAnchor.constraint(equalTo: barLabel1.topAnchor).isActive = true
        barLabel2.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
 
        let barOne = UIView()
        barOne.alpha = 0.2
        barOne.backgroundColor = color1
        addSubview(barOne)
        barOne.translatesAutoresizingMaskIntoConstraints = false
        barOne.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        barOne.widthAnchor.constraint(equalTo: widthAnchor, multiplier: size).isActive = true
        barOne.topAnchor.constraint(equalTo: barLabel1.bottomAnchor, constant: 3).isActive = true
        barOne.heightAnchor.constraint(equalToConstant: 20).isActive = true
        barOne.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        
        let barTwo = UIView()
        barTwo.backgroundColor = color2
        barTwo.alpha = 0.2
        addSubview(barTwo)
        barTwo.translatesAutoresizingMaskIntoConstraints = false
        barTwo.leadingAnchor.constraint(equalTo: barOne.trailingAnchor, constant:  3).isActive = true
        barTwo.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        barTwo.topAnchor.constraint(equalTo: barOne.topAnchor).isActive = true
        barTwo.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
      
        
        
    }
    
    
}
