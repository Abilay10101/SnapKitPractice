//
//  HomeViewModel.swift
//  Snap2
//
//  Created by Arip Khozhbanov on 03.11.2022.
//

import UIKit

class HomeViewModel {
    
    private let imageNames = ["1" , "2" , "3", "1", "2", "3", "1" , "2" , "3"]
    private let titles = ["Nature" , "Beaches" , "StarPlatinum"]
    
    //MARK: - CollectionView DataSource
    func numberOfRows() -> Int {
        return 20
    }
    
    func modelFor(row: Int) -> HomeCollectionViewCell.Model {
        let randomImage = imageNames.random(3)
        let title = titles.randomElement()
        let like = [true , false].randomElement() ?? false
        let carouselModel = CarouselView.Model(images: randomImage)
        let model = HomeCollectionViewCell.Model(title: title, description: "This is demo description", likeImage: like, model: carouselModel)
        return model
    }
    
}

extension Collection {
    func choose(_ n : Int) -> ArraySlice<Element>{ shuffled().prefix(n) }
    
    func random(_ n: Int ) -> [UIImage] {
        let names = choose(n)
        let images = names.map { return UIImage(named: $0 as! String)! }
        return images
    }
}
