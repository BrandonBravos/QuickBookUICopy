//
//  ProfitandLossView.swift
//  QuickBooks
//
//  Created by Brandon Bravos on 5/30/19.
//  Copyright © 2019 Brandon Bravos. All rights reserved.
//

import UIKit

class ProfitLossView: UIView {

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
        titleLabel.text = "Profit and Loss"
        titleLabel.font = font
        titleLabel.sizeToFit()
        titleLabel.alpha = 0.4
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        
        let lastMonthLabel = UILabel()
        lastMonthLabel.text = "Last 30 Days"
        lastMonthLabel.font = font
        lastMonthLabel.sizeToFit()
        lastMonthLabel.textColor = Colors.darkBlue
        addSubview(lastMonthLabel)
        lastMonthLabel.translatesAutoresizingMaskIntoConstraints = false
        lastMonthLabel.topAnchor.constraint(equalTo: topAnchor, constant: 17).isActive = true
        lastMonthLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15).isActive = true
        
        let amountLabel = UILabel()
        amountLabel.text = "$0"
        amountLabel.font = font?.withSize(27)
        amountLabel.sizeToFit()
        amountLabel.alpha = 0.6
        addSubview(amountLabel)
        amountLabel.translatesAutoresizingMaskIntoConstraints = false
        amountLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8).isActive = true
        amountLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor, constant: 0).isActive = true
        
        let netProfitLabel = UILabel()
        netProfitLabel.text = "NET PROFIT"
        netProfitLabel.font = font?.withSize(11)
        netProfitLabel.sizeToFit()
        netProfitLabel.alpha = 0.4
        addSubview(netProfitLabel)
        netProfitLabel.translatesAutoresizingMaskIntoConstraints = false
        netProfitLabel.topAnchor.constraint(equalTo: amountLabel.bottomAnchor, constant:-2).isActive = true
        netProfitLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor, constant: 0).isActive = true
        
        
        
        let barOne = BarTypeOne(barColor: Colors.sliderGreen, barPercentage: 0.65)
        barOne.alpha = 0.4
        addSubview(barOne)
        barOne.translatesAutoresizingMaskIntoConstraints = false
        barOne.topAnchor.constraint(equalTo: netProfitLabel.bottomAnchor, constant: 8).isActive = true
        barOne.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor, constant: 0).isActive = true
        barOne.heightAnchor.constraint(equalToConstant: 20).isActive = true
        barOne.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.7).isActive = true
        barOne.slantedBackground(width: UIScreen.main.bounds.width * 0.69, height: 20)

        let barOneLabel = UILabel()
        barOneLabel.text = "$0 \n Income"
        barOneLabel.font = font?.withSize(11)
        barOneLabel.sizeToFit()
        barOneLabel.alpha = 0.4
        barOneLabel.numberOfLines = 2
        addSubview(barOneLabel)
        barOneLabel.translatesAutoresizingMaskIntoConstraints = false
        barOneLabel.topAnchor.constraint(equalTo: barOne.topAnchor, constant: -3).isActive = true
        barOneLabel.leadingAnchor.constraint(equalTo: barOne.trailingAnchor, constant: 5).isActive = true
        
        let barTwo = BarTypeOne(barColor: Colors.darkBlue, barPercentage: 0.85)
        barTwo.alpha = 0.4
        addSubview(barTwo)
        barTwo.translatesAutoresizingMaskIntoConstraints = false
        barTwo.topAnchor.constraint(equalTo: barOneLabel.bottomAnchor, constant: 13).isActive = true
        barTwo.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor, constant: 0).isActive = true
        barTwo.heightAnchor.constraint(equalToConstant: 20).isActive = true
        barTwo.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.45).isActive = true
      //  barTwo.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -17).isActive = true
        barTwo.slantedBackground(width: UIScreen.main.bounds.width * 0.44, height: 20)
        
        let barTwoLabel = UILabel()
        barTwoLabel.text = "$0 \n Expenses"
        barTwoLabel.font = font?.withSize(11)
        barTwoLabel.sizeToFit()
        barTwoLabel.alpha = 0.4
        barTwoLabel.numberOfLines = 2
        addSubview(barTwoLabel)
        barTwoLabel.translatesAutoresizingMaskIntoConstraints = false
        barTwoLabel.topAnchor.constraint(equalTo: barTwo.topAnchor, constant: -3).isActive = true
        barTwoLabel.leadingAnchor.constraint(equalTo: barTwo.trailingAnchor, constant: 5).isActive = true
        
        let connectBankButton = UIButton()
        connectBankButton.setTitle("Connect Bank Account", for: .normal)
        connectBankButton.setTitleColor(Colors.darkBlue, for: .normal)
        connectBankButton.layer.borderColor = Colors.grayBorderOne.cgColor
        connectBankButton.layer.borderWidth = 1.4
        addSubview(connectBankButton)
        connectBankButton.translatesAutoresizingMaskIntoConstraints = false
        connectBankButton.topAnchor.constraint(equalTo: barTwo.bottomAnchor, constant: 17).isActive = true
        connectBankButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: -1.4).isActive = true
        connectBankButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 1.4).isActive = true
        connectBankButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -1.4).isActive = true
        connectBankButton.heightAnchor.constraint(equalToConstant: 45).isActive = true




    }
    
    
    
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
