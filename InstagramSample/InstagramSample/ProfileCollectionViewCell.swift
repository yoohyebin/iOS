//
//  ProfileCollectionViewCell.swift
//  InstagramSample
//
//  Created by 유혜빈 on 2022/11/28.
//

import SnapKit
import UIKit

final class ProfileCollectionViewCell: UICollectionViewCell {
    private let imageView = UIImageView()

    func setup(with image: UIImage) {
        addSubview(imageView)
        imageView.snp.makeConstraints { $0.edges.equalToSuperview() }

        imageView.backgroundColor = .tertiaryLabel
    }
}
