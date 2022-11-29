//
//  AlertActionConvertible.swift
//  SearchDaumBlog(MVVM)
//
//  Created by 유혜빈 on 2022/11/28.
//

import UIKit

protocol AlertActionConvertible {
    var title: String { get }
    var style: UIAlertAction.Style { get }
}
