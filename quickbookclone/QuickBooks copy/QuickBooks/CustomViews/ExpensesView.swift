//
//  ExpensesView.swift
//  QuickBooks
//
//  Created by Brandon Bravos on 6/3/19.
//  Copyright © 2019 Brandon Bravos. All rights reserved.
//

import UIKit

class ExpensesView: UIView {
 
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = Colors.grayBackGround2
        clipsToBounds = true
        setUpView()
        
    }
    
    var buttonTapped:(()->Void)?
    
    
  
    
    private func setUpView(){
        
        let font = UIFont.init(name: "AvenirNext-Medium", size: 16)
        
        let color1 =  Colors.darkBlue
        let color2 = UIColor.blue
        
        let titleLabel = UILabel()
        titleLabel.text = "Expenses"
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
        
     
        let barView = UIView()
        addSubview(barView)
        barView.translatesAutoresizingMaskIntoConstraints = false
        barView.topAnchor.constraint(equalTo: amountLabel.bottomAnchor, constant: 50).isActive = true
        barView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        barView.widthAnchor.constraint(equalToConstant: 1).isActive  = true
        barView.heightAnchor.constraint(equalToConstant: 1).isActive = true

        let bar1 = UIBezierPath(arcCenter: barView.center, radius: 50, startAngle: -CGFloat.pi/2, endAngle: CGFloat.pi/2, clockwise: true)
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = bar1.cgPath
        shapeLayer.strokeColor = color2.cgColor.copy(alpha: 0.6)
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = 17
        
        barView.layer.addSublayer(shapeLayer)
        
        let bar2 = UIBezierPath(arcCenter: barView.center, radius: 50, startAngle: -CGFloat.pi/2, endAngle: CGFloat.pi/2, clockwise: false)
        let shapeLayer2 = CAShapeLayer()
        shapeLayer2.path = bar2.cgPath
        shapeLayer2.strokeColor = color1.cgColor.copy(alpha: 0.6)
        shapeLayer2.fillColor = UIColor.clear.cgColor
        shapeLayer2.lineWidth = 17
        
        barView.layer.addSublayer(shapeLayer2)

        let catagoryOne = catagoryView(color: color1, catagory: "Catagory")
        catagoryOne.sizeToFit()
        addSubview(catagoryOne)
        catagoryOne.translatesAutoresizingMaskIntoConstraints = false
        catagoryOne.topAnchor.constraint(equalTo: barView.bottomAnchor, constant: 50).isActive = true
        catagoryOne.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        catagoryOne.widthAnchor.constraint(equalTo: widthAnchor).isActive = true


        let catagoryTwo = catagoryView(color: color2, catagory: "Catagory")
        catagoryTwo.sizeToFit()
        addSubview(catagoryTwo)
        catagoryTwo.translatesAutoresizingMaskIntoConstraints = false
        catagoryTwo.topAnchor.constraint(equalTo: catagoryOne.bottomAnchor, constant: 10).isActive = true
        catagoryTwo.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        catagoryTwo.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        catagoryTwo.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        
    }
    
    
    func catagoryView(color: UIColor, catagory: String) -> UIView{
        let view = UIView()
        
        let subColorView = UIView()
        subColorView.alpha = 0.6
        subColorView.backgroundColor = color
        view.addSubview(subColorView)
        subColorView.translatesAutoresizingMaskIntoConstraints = false
        subColorView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        subColorView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        subColorView.widthAnchor.constraint(equalToConstant: 17).isActive = true
        subColorView.heightAnchor.constraint(equalToConstant: 17).isActive = true

        
        let priceLabel = UILabel()
        priceLabel.sizeToFit()
        priceLabel.font =  UIFont.init(name: "AvenirNext-Medium", size: 15)
        priceLabel.alpha = 0.4
        priceLabel.text = "$0"
        view.addSubview(priceLabel)
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.topAnchor.constraint(equalTo: subColorView.topAnchor).isActive = true
        priceLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
        
        
        let catagoryLabel = UILabel()
        catagoryLabel.sizeToFit()
        catagoryLabel.font =  UIFont.init(name: "AvenirNext-Medium", size: 15)
        catagoryLabel.alpha = 0.4
        catagoryLabel.text = catagory
        view.addSubview(catagoryLabel)
        catagoryLabel.translatesAutoresizingMaskIntoConstraints = false
        catagoryLabel.topAnchor.constraint(equalTo: subColorView.topAnchor).isActive = true
        catagoryLabel.leadingAnchor.constraint(equalTo: subColorView.trailingAnchor, constant: 5).isActive = true
        catagoryLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 3).isActive = true
        return view
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
