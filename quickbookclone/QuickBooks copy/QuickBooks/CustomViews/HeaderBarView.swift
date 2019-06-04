//
//  HeaderBarView.swift
//  QuickBooks
//
//  Created by Brandon Bravos on 5/30/19.
//  Copyright © 2019 Brandon Bravos. All rights reserved.
//

import UIKit

class HeaderBarView: UIView {

    let headerLabel = UILabel()
    
    let stackView = UIStackView()
    
    var headerBarXConstraint: NSLayoutConstraint?
    var searchIconXConstraint: NSLayoutConstraint?
    
    var headerMenuTapped:(()->Void)?

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // repostions the header bar based on a scroll views horizontal position
    func repositionHeaderBar(scrollPosition: CGFloat){
        
        // scrollPosition / How man cells from our table view (2 screen widths)
        let contentOffset = scrollPosition / 2
        headerBarXConstraint?.constant = contentOffset
        searchIconXConstraint?.constant = 35 - scrollPosition / 8
        
        UIView.animate(withDuration: 0.2) {
            self.layoutIfNeeded()
        }
        
    }
    
    
    
    
    
    
    
    
    
}









extension HeaderBarView{
    
    private func setUpView(){
        let menuButton = UIButton()
        menuButton.setImage( UIImage(named: "menuIcon"), for: .normal)
        menuButton.contentMode = .scaleAspectFit
        menuButton.tintColor = Colors.darkBlue
        addSubview(menuButton)
        menuButton.translatesAutoresizingMaskIntoConstraints = false
        menuButton.topAnchor.constraint(equalTo: topAnchor, constant: 5 + UIApplication.shared.statusBarFrame.height).isActive = true
        menuButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11).isActive = true
        menuButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
        menuButton.widthAnchor.constraint(equalToConstant: 35).isActive = true
        menuButton.addTarget(self, action: #selector(menuTapped), for: .touchDown)
        
        
        let searchImageView = UIImageView()
        searchImageView.image = UIImage(named: "searchIcon")
        searchImageView.contentMode = .scaleAspectFit
        searchImageView.tintColor = Colors.darkBlue
        addSubview(searchImageView)
        searchImageView.translatesAutoresizingMaskIntoConstraints = false
        searchImageView.topAnchor.constraint(equalTo: topAnchor, constant: 5 + UIApplication.shared.statusBarFrame.height).isActive = true
        
        searchImageView.heightAnchor.constraint(equalToConstant: 35).isActive = true
        searchImageView.widthAnchor.constraint(equalToConstant: 35).isActive = true
        
        searchIconXConstraint = searchImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 45)
        searchIconXConstraint!.isActive = true
        
        let font = UIFont.init(name: "AvenirNext-DemiBold", size: 17.5)
        
        headerLabel.text = "Home"
        headerLabel.textAlignment = .center
        headerLabel.font = font
        headerLabel.sizeToFit()
        addSubview(headerLabel)
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.bottomAnchor.constraint(equalTo: menuButton.bottomAnchor, constant: -6).isActive = true
        headerLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        stackView.backgroundColor = .red
        stackView.axis = .horizontal
        stackView.alignment = .fill // .leading .firstBaseline .center .trailing .lastBaseline
        stackView.distribution = .fillEqually // .fillEqually .fillProportionally .equalSpacing .equalCentering
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4).isActive = true
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        
        let dashBoardLabel = UILabel()
        dashBoardLabel.sizeToFit()
        dashBoardLabel.text = "Dashboard"
        dashBoardLabel.font = font
        dashBoardLabel.textAlignment = .center
        stackView.addArrangedSubview(dashBoardLabel)
        
        
        let activityLabel = UILabel()
        activityLabel.sizeToFit()
        activityLabel.text = "Activity"
        activityLabel.font = font
        activityLabel.textAlignment = .center
        stackView.addArrangedSubview(activityLabel)
        
        let bottomDivider = UIView()
        bottomDivider.backgroundColor = Colors.grayBorderOne
        addSubview(bottomDivider)
        bottomDivider.translatesAutoresizingMaskIntoConstraints = false
        bottomDivider.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        bottomDivider.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        bottomDivider.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        bottomDivider.heightAnchor.constraint(equalToConstant: 1.3).isActive = true
        
        let sliderBar = UIView()
        sliderBar.backgroundColor = Colors.sliderGreen
        addSubview(sliderBar)
        sliderBar.translatesAutoresizingMaskIntoConstraints = false
        sliderBar.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        sliderBar.heightAnchor.constraint(equalToConstant: 2.5).isActive = true
        sliderBar.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.25).isActive = true
        
        headerBarXConstraint = sliderBar.centerXAnchor.constraint(equalTo: dashBoardLabel.centerXAnchor)
        headerBarXConstraint!.isActive = true
        
    }
    
     @objc private func menuTapped(){
        guard let tap = headerMenuTapped else {  print("Null"); return }
        tap()
        
    }
}
