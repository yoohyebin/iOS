//
//  CardListTableViewCell.swift
//  CreditCardList
//
//  Created by 유혜빈 on 2022/11/27.
//

import UIKit

class CardListTableViewCell: UITableViewCell {
    @IBOutlet weak var cardImageView: UIImageView!
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var promotionLabel: UILabel!
    @IBOutlet weak var cardNameLabel: UILabel!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
}
