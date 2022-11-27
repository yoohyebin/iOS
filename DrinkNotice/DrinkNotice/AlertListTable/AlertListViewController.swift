//
//  AlertListViewController.swift
//  DrinkNotice
//
//  Created by 유혜빈 on 2022/11/27.
//

import UIKit

class AlertListViewController: UITableViewController {
    var alerts: [Alert] = []
    let userNotificationCenter = UNUserNotificationCenter.current()

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName: "AlertListCell", bundle: nil), forCellReuseIdentifier: "AlertListCell")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.alerts = alertList()
    }
        
    func alertList() -> [Alert] {
        guard let data = UserDefaults.standard.value(forKey: "alerts") as? Data,
              let alerts = try? PropertyListDecoder().decode([Alert].self, from: data) else { return [] }
        return alerts
    }
    
    @IBAction func tapAddButton(_ sender: UIBarButtonItem) {
        guard let addAlertViewController = storyboard?.instantiateViewController(withIdentifier: "AddAlertViewController") as? AddAlertViewController else { return }
        
        addAlertViewController.datePicked = {[weak self] date in
            guard let self = self else { return }
            var alertList = self.alertList()
            let newAlert = Alert(date: date, isOn: true)
            
            alertList.append(newAlert)
            alertList.sort { $0.date < $1.date }
            self.alerts = alertList
            
            UserDefaults.standard.set(try? PropertyListEncoder().encode(self.alerts), forKey: "alerts")
            
            self.userNotificationCenter.addNotificationRequest(by: newAlert)
            
            self.tableView.reloadData()
        }
        
        self.present(addAlertViewController, animated: true, completion: nil)
    }
    
}
extension AlertListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alerts.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "🚰 물마실 시간"
        default:
            return nil
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AlertListCell", for: indexPath) as? AlertListCell else { return UITableViewCell() }
        
        cell.alertSwitch.tag = indexPath.row
        cell.alertSwitch.isOn = alerts[indexPath.row].isOn
        cell.timeLabel.text = alerts[indexPath.row].time
        cell.meridiemLabel.text = alerts[indexPath.row].meridiem
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            userNotificationCenter.removePendingNotificationRequests(withIdentifiers: [alerts[indexPath.row].id])
            self.alerts.remove(at: indexPath.row)
            UserDefaults.standard.set(try? PropertyListEncoder().encode(self.alerts), forKey: "alerts")
            tableView.reloadData()
        default:
            break
        }
    }
}
