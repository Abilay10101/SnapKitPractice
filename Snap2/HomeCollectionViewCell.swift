//
//  HomeCollectionViewCell.swift
//  Snap2
//
//  Created by Arip Khozhbanov on 05.11.2022.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    static let identifier = "HomeCollectionViewCell"
    
    private lazy var carouselView: CarouselView = {
        let frame = CGRect(x: 0, y: 0, width: contentView.frame.width, height: contentView.frame.height)
        let carouselView = CarouselView(frame: frame )
        contentView.addSubview(carouselView)
        return carouselView
    }()
    
    var cellModel: Model? {
        didSet {
            carouselView.model = cellModel?.model
        }
    }
    
    override init(frame: CGRect){
        super.init(frame: frame)
        backgroundColor = .systemTeal
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        carouselView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    struct Model {
        var title: String?
        var description: String?
        var likeImage: Bool
        var model: CarouselView.Model?
    }
    
    override func prepareForReuse() {
        cellModel = nil
    }
}
