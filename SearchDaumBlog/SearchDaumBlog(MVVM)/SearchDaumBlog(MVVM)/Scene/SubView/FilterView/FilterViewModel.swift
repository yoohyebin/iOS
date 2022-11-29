//
//  FilterViewModel.swift
//  SearchDaumBlog(MVVM)
//
//  Created by 유혜빈 on 2022/11/28.
//

import RxSwift
import RxCocoa

struct FilterViewModel {
    let sortButtonTapped = PublishRelay<Void>()
    let shouldUpdateType: Observable<Void>
    
    init() {
        self.shouldUpdateType = sortButtonTapped
            .asObservable()
    }
}
