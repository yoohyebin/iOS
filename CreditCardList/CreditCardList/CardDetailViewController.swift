//
//  CardDetailViewController.swift
//  CreditCardList
//
//  Created by 유혜빈 on 2022/11/27.
//

import UIKit
import Lottie

class CardDetailViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var moneyLottie: UIView!
    @IBOutlet weak var periodLabel: UILabel!
    @IBOutlet weak var conditionLabel: UILabel!
    @IBOutlet weak var benefitConditionLabel: UILabel!
    @IBOutlet weak var benefitDetailLabel: UILabel!
    @IBOutlet weak var benefitDateLabel: UILabel!
    
    var promotionDetail: PromotionDetail?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let animationView = AnimationView(name: "money")
        self.moneyLottie.contentMode = .scaleAspectFit
        self.moneyLottie.addSubview(animationView)
        animationView.frame = self.moneyLottie.bounds
        animationView.loopMode = .loop
        animationView.play()
        
        guard let detail = promotionDetail else { return }
        self.titleLabel.text = """
            \(detail.companyName)카드 쓰면
            \(detail.amount)만원 드려요
            """
        self.periodLabel.text = detail.period
        self.conditionLabel.text = detail.condition
        self.benefitConditionLabel.text = detail.benefitCondition
        self.benefitDetailLabel.text = detail.benefitDetail
        self.benefitDateLabel.text = detail.benefitDate
    }

}
