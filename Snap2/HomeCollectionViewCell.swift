//
//  HomeCollectionViewCell.swift
//  Snap2
//
//  Created by Arip Khozhbanov on 05.11.2022.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    static let identifier = "HomeCollectionViewCell"
    
    override init(frame: CGRect){
        super.init(frame: frame)
        backgroundColor = .systemTeal
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
