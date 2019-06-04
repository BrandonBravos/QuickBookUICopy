//
//  BarTypeOne.swift
//  QuickBooks
//
//  Created by Brandon Bravos on 6/3/19.
//  Copyright © 2019 Brandon Bravos. All rights reserved.
//

import UIKit

class BarTypeOne: UIView {

    private var barView = UIView()
    
   
    
    init(barColor: UIColor, barPercentage: CGFloat ) {
        super.init(frame: .zero)
        setUpView(color: barColor, size: barPercentage)
        
    }
    private func setUpView(color: UIColor, size: CGFloat){
        barView.backgroundColor = color
        addSubview(barView)
        barView.translatesAutoresizingMaskIntoConstraints =  false
        barView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        barView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        barView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        barView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: size).isActive = true

        
    }
    
    
    func slantedBackground(width: CGFloat, height: CGFloat){
        clipsToBounds = true
        
        
        let path = UIBezierPath(rect: CGRect(x: 0, y: 0, width: 0  , height: 0))
        var x: CGFloat = width + 50
        
        while x > 0{
            path.move(to: CGPoint(x: x , y: 0))
            path.addLine(to: CGPoint(x: x - 30, y: height))
            x = x - 10
        }
        
        //design path in layer
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = barView.backgroundColor?.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = 1.2
        
        layer.insertSublayer(shapeLayer, at: 0)
      
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
