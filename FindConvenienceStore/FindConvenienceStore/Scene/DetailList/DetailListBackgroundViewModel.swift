//
//  DetailListBackgroundViewModel.swift
//  FindConvenienceStore
//
//  Created by 유혜빈 on 2023/01/07.
//

import RxSwift
import RxCocoa

struct DetailListBackgroundViewModel {
    //viewModel -> view
    let isStatusLabelHidden: Signal<Bool>
    
    //외부에서 전달받을 값
    let shouldHideStatusLabel = PublishSubject<Bool>()
    
    init() {
        isStatusLabelHidden = shouldHideStatusLabel
            .asSignal(onErrorJustReturn: true)
    }
}
