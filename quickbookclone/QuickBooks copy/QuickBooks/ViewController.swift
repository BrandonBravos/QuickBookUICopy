//
//  ViewController.swift
//  QuickBooks
//
//  Created by Brandon Bravos on 5/30/19.
//  Copyright © 2019 Brandon Bravos. All rights reserved.
//



import UIKit

class ViewController: UIViewController {

    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.isPagingEnabled = true
        cv.delegate = self
        cv.dataSource = self
        return cv
    }()
    
    let headerView = HeaderBarView()
    var headerXLayoutConstraint : NSLayoutConstraint?

    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        setUpView()
        
    }
    
    func menuTapped(){
        UIView.animate(withDuration: 0.2) {
            let constantValue = self.headerXLayoutConstraint!.constant
            self.headerXLayoutConstraint!.constant = constantValue > UIScreen.main.bounds.width/2 ? 0 : UIScreen.main.bounds.width/2  + 50
            self.view.layoutIfNeeded()
        }
    }
    
    

    
}


















extension ViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let path = UIScreen.main.bounds
        return CGSize(width: path.width, height: path.height - (UIApplication.shared.statusBarFrame.height + 89))
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      
        switch indexPath.row {
        case 0:
              let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GraphsCell", for: indexPath) as! GraphsCell
              return cell

        default:
              let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BlankCell", for: indexPath) as! BlankCell
              return cell

        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        headerView.repositionHeaderBar(scrollPosition: scrollView.contentOffset.x)
        
    }
    
}









extension ViewController{
   
    func setUpView(){
        view.backgroundColor = Colors.grayBackGround
        
        headerView.sizeToFit()
        view.addSubview(headerView)
        headerView.translatesAutoresizingMaskIntoConstraints = false
        headerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        headerXLayoutConstraint = headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        headerXLayoutConstraint!.isActive = true
        headerView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        headerView.heightAnchor.constraint(equalToConstant:  UIApplication.shared.statusBarFrame.height + 89).isActive = true
        headerView.headerMenuTapped = menuTapped
        
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: headerView.bottomAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: headerView.leadingAnchor).isActive = true
        collectionView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        collectionView.register(GraphsCell.self, forCellWithReuseIdentifier: "GraphsCell")
        collectionView.register(BlankCell.self, forCellWithReuseIdentifier: "BlankCell")

        let menuView = MenuView()
        view.addSubview(menuView)
        menuView.translatesAutoresizingMaskIntoConstraints = false
        menuView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        menuView.trailingAnchor.constraint(equalTo: headerView.leadingAnchor).isActive = true
        menuView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        menuView.widthAnchor.constraint(equalToConstant:  UIScreen.main.bounds.width/2  + 50).isActive = true

        
        
        view.sendSubviewToBack(menuView)
        
        


        
    }
    
    
}
