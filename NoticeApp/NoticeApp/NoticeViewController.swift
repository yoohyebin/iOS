//
//  NoticeViewController.swift
//  NoticeApp
//
//  Created by 유혜빈 on 2022/11/27.
//

import UIKit

class NoticeViewController: UIViewController {
    @IBOutlet weak var noticeView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var noticeContents: (title: String, detail: String, date: String)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        noticeView.layer.cornerRadius = 6
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        
        guard let noticeContents = noticeContents else { return }
        titleLabel.text = noticeContents.title
        detailLabel.text = noticeContents.detail
        dateLabel.text = noticeContents.date
    }

    @IBAction func tapDoneButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
