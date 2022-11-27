//
//  ContentCollectionViewCell.swift
//  NetflixStyleApp
//
//  Created by 유혜빈 on 2022/11/27.
//

import UIKit

class ContentCollectionViewCell: UICollectionViewCell {
    let imageView = UIImageView()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 5
        contentView.clipsToBounds = true
        
        imageView.contentMode = .scaleToFill
        
        contentView.addSubview(imageView)
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
