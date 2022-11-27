//
//  BeerDetailViewController.swift
//  Brewery
//
//  Created by 유혜빈 on 2022/11/27.
//

import UIKit

class BeerDetailViewController: UITableViewController {
    var beer: Beer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = beer?.name ?? "이름 없는 맥주"
        
        tableView = UITableView(frame: tableView.frame, style: .insetGrouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "BeerDetailListCell")
        tableView.rowHeight = UITableView.automaticDimension
        
        let headerView = UIImageView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 300))
        let imageURL = URL(string: beer?.imageURL ?? "")
        headerView.contentMode = .scaleAspectFit
        headerView.kf.setImage(with: imageURL, placeholder: #imageLiteral(resourceName: "beer_icon"))
        tableView.tableHeaderView = headerView
    }
}

//UITableView DataSource, Delegate
extension BeerDetailViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 3:
            return beer?.foodParing?.count ?? 0
        default:
            return 1
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "ID"
        case 1:
            return "Description"
        case 2:
            return "Brewers Tips"
        case 3:
            let foodParing = beer?.foodParing?.count ?? 0
            let containFoodParing = foodParing != 0
            return containFoodParing ? "Food Paring" : nil
        default:
            return nil
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "BeerDetailListCell")
        cell.textLabel?.numberOfLines = 0
        cell.selectionStyle = .none
        
        switch indexPath.section {
        case 0:
            cell.textLabel?.text = String(describing: beer?.id ?? 0)
            return cell
        case 1:
            cell.textLabel?.text = beer?.description ?? "설명 없는 맥주"
            return cell
        case 2:
            cell.textLabel?.text = beer?.brewersTips ?? "팁 없는 맥주"
            return cell
        default:
            cell.textLabel?.text = beer?.foodParing?[indexPath.row] ?? ""
            return cell
        }
    }
}
