//
//  ReviewWritePresenter.swift
//  BookReview
//
//  Created by 유혜빈 on 2023/01/13.
//

import Foundation

protocol ReviewWriteProtocol {
    func setupNavigationBar()
    func showCloseAlertController()
    func close()
    func setupViews()
    func presentSearchBookController()
    func updateViews(_ title: String, _ imageURL: URL?)
}

final class ReviewWritePresenter {
    private let viewController: ReviewWriteProtocol
    private let userDefaultsManager = UserDefaultsManager()
    
    private var book: Book?
    let contentsTextViewPlaceHolderText = "내용을 입력해주세요."
    
    init(viewController: ReviewWriteProtocol) {
        self.viewController = viewController
    }
    
    func viewDidLoad(){
        viewController.setupNavigationBar()
        viewController.setupViews()
    }
    
    func didTapLeftBarButton(){
        viewController.showCloseAlertController()
    }
    
    func didTapRightBarButton(_ content: String?){
        guard
            let book = book,
            let content = content,
            content != contentsTextViewPlaceHolderText
        else {return}
        let bookReview = BookReview(title: book.title,
                                    contents: content,
                                    imageURL: book.imageURL)
       
        userDefaultsManager.setReview(bookReview)
        viewController.close()
    }
    func didTapBoolTitleButton(){
        viewController.presentSearchBookController()
    }
}

extension ReviewWritePresenter: SearchBookDelegate{
    func selectBook(_ book: Book) {
        self.book = book
        viewController.updateViews(book.title, book.imageURL)
    }
}
