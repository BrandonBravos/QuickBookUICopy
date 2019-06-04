//
//  BlankCell.swift
//  QuickBooks
//
//  Created by Brandon Bravos on 6/4/19.
//  Copyright © 2019 Brandon Bravos. All rights reserved.
//

import UIKit

class BlankCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = Colors.grayBackGround
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
