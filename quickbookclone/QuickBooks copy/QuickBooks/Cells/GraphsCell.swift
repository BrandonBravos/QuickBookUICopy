//
//  GraphsCell.swift
//  QuickBooks
//
//  Created by Brandon Bravos on 6/4/19.
//  Copyright © 2019 Brandon Bravos. All rights reserved.
//

import UIKit

class GraphsCell: UICollectionViewCell {
    
    let stackView = UIStackView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
        
    }
    
   private func setUpView(){
        
        backgroundColor = Colors.grayBackGround
    
        
  
        
        let scrollView = UIScrollView()
        addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        stackView.axis = .vertical
        stackView.spacing = 10;
        scrollView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 10).isActive = true
        stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10).isActive = true
        stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -10).isActive = true
        stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -80).isActive = true
        stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -20).isActive = true
        
        addViewToStack(barView: ProfitLossView())
        addViewToStack(barView: InvoiceView())
        addViewToStack(barView: ExpensesView())
        
    }
    
    func addViewToStack(barView: UIView){
        barView.sizeToFit()
        barView.clipsToBounds = true
        barView.layer.borderWidth = 1.4
        barView.layer.cornerRadius = 2
        barView.layer.borderColor = Colors.grayBorderOne.cgColor
        stackView.addArrangedSubview(barView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
