//
//  ReviewListPresenter.swift
//  BookReview
//
//  Created by 유혜빈 on 2023/01/13.
//

import UIKit
import Kingfisher

protocol ReviewListProtocol {
    func setupNavigationBar()
    func setupViews()
    func presentToReviewWriteViewController()
    func reloadTableView()
}

final class ReviewListPresenter: NSObject {
    private let viewController: ReviewListProtocol
    private let userDefaultsManager = UserDefaultsManager()
    
    private var reviews: [BookReview] = []
    
    init(viewController: ReviewListProtocol) {
        self.viewController = viewController
    }
    
    func viewDidLoad(){
        viewController.setupNavigationBar()
        viewController.setupViews()
    }
    
    func viewWillAppear(){
        reviews = userDefaultsManager.getReviews()
        viewController.reloadTableView()
    }
    
    func didTapRightBarButtonItem() {
        viewController.presentToReviewWriteViewController()
    }
}

extension ReviewListPresenter: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reviews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle,
                                   reuseIdentifier: nil)
        let review = reviews[indexPath.row]
        
        cell.textLabel?.text = review.title
        cell.detailTextLabel?.text = review.contents
        //cell.imageView?.kf.setImage(with: review.imageURL)
        cell.imageView?.kf.setImage(with: review.imageURL, placeholder: .none) { _ in
            cell.setNeedsLayout()
        }

        cell.selectionStyle = .none
        
        return cell
    }
}
