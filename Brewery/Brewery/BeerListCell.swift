//
//  BeerListCell.swift
//  Brewery
//
//  Created by 유혜빈 on 2022/11/27.
//

import UIKit
import SnapKit
import Kingfisher

class BeerListCell: UITableViewCell {
    let beerImageView = UIImageView()
    let nameLabel = UILabel()
    let taglineLabel = UILabel()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        [beerImageView, nameLabel, taglineLabel].forEach {
            contentView.addSubview($0)
        }
        
        beerImageView.contentMode = .scaleAspectFit
        nameLabel.font = .systemFont(ofSize: 18, weight: .bold)
        nameLabel.numberOfLines = 2
        
        taglineLabel.font = .systemFont(ofSize: 14, weight: .light)
        taglineLabel.textColor = .systemBlue
        taglineLabel.numberOfLines = 0
        
        beerImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.top.bottom.equalToSuperview().inset(20)
            $0.width.equalTo(80)
            $0.height.equalTo(120)
        }
        
        nameLabel.snp.makeConstraints {
            $0.leading.equalTo(beerImageView.snp.trailing).offset(10)
            $0.bottom.equalTo(beerImageView.snp.centerY)
            $0.trailing.equalToSuperview().inset(20)
        }
        
        taglineLabel.snp.makeConstraints {
            $0.leading.trailing.equalTo(nameLabel)
            $0.top.equalTo(nameLabel.snp.bottom).offset(5)
        }
    }
    
    func configure(with beer: Beer) {
        let imageURL = URL(string: beer.imageURL ?? "")
        beerImageView.kf.setImage(with: imageURL, placeholder: #imageLiteral(resourceName: "beer_icon"))
        nameLabel.text = beer.name ?? "이름 없는 맥주"
        taglineLabel.text = beer.tagLine
        accessoryType = .disclosureIndicator
        selectionStyle = .none
    }
}
