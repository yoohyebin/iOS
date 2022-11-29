//
//  BlogListViewModel.swift
//  SearchDaumBlog(MVVM)
//
//  Created by 유혜빈 on 2022/11/28.
//

import RxSwift
import RxCocoa

struct BlogListViewModel {
    let filterViewModel = FilterViewModel()
    
    let blogListCellData = PublishSubject<[BlogListCellData]>()
    let cellData: Driver<[BlogListCellData]>
    
    init() {
        self.cellData = blogListCellData
            .asDriver(onErrorJustReturn: [])
    }
}
