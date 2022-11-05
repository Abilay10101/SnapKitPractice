//
//  CarouselView.swift
//  Snap2
//
//  Created by Arip Khozhbanov on 05.11.2022.
//

import UIKit

class CarouselView: UIView {
    
    private lazy var imageViews = [ imageViewOne , imageViewTwo , imageViewThree]
    
    var model: Model? {
        didSet {
            if let model = model { setupImages(model: model) }
        }
    }

    private lazy var imageViewOne: UIImageView = {
        var imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var imageViewTwo: UIImageView = {
        var imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var imageViewThree: UIImageView = {
        var imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubview(imageViewOne)
        addSubview(imageViewTwo)
        addSubview(imageViewThree)
    }
    
    func setupConstraints() {
        imageViewOne.snp.makeConstraints { make in
            make.left.top.bottom.equalToSuperview()
            make.width.equalToSuperview().offset(-(frame.width / 2) - 20)
        }
        imageViewTwo.snp.makeConstraints { make in
            make.left.equalTo(imageViewOne.snp.right).offset(1)
            make.top.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalToSuperview().offset(-(frame.height / 2) - 1)
        }
        imageViewThree.snp.makeConstraints { make in
            make.left.equalTo(imageViewOne.snp.right).offset(1)
            make.top.equalTo(imageViewTwo.snp.bottom).offset(1)
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    private func setupImages(model: Model) {
        for (index, view) in imageViews.enumerated() {
            let hasAnotherImage = model.images.count > index
            if hasAnotherImage { view.image = model.images[index] }
        }
    }
    
    struct Model {
        var images: [UIImage]
    }

}
