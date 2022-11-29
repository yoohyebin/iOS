//
//  UIButton.swift
//  InstagramSample
//
//  Created by 유혜빈 on 2022/11/28.
//

import UIKit

extension UIButton {
    func setImage(systemName: String) {
        contentHorizontalAlignment = .fill
        contentVerticalAlignment = .fill

        imageView?.contentMode = .scaleAspectFit
        imageEdgeInsets = .zero

        setImage(UIImage(systemName: systemName), for: .normal)
    }
}
