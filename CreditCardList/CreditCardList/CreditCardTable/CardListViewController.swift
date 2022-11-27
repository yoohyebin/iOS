//
//  CardListViewController.swift
//  CreditCardList
//
//  Created by 유혜빈 on 2022/11/27.
//

import UIKit
import FirebaseDatabase
import Kingfisher
import FirebaseFirestore

class CardListViewController: UITableViewController {
    var ref: DatabaseReference!     //Firebase Realtime Database
    var db = Firestore.firestore() //Firebase Firestore
    
    var creditCardList: [CreditCard] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //UITableView
        let nibName = UINib(nibName: "CardListTableViewCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "CardListTableViewCell")
        
        //self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CardListCellTableViewCell")

        
        /*Firebase Database 읽기*/
        self.ref = Database.database().reference()
        
        self.ref.observe(.value) { snapshot in
            guard let value = snapshot.value as? [String: [String: Any]] else { return }
            do {
                let jsonData = try JSONSerialization.data(withJSONObject: value)
                let cardData = try JSONDecoder().decode([String: CreditCard].self, from: jsonData)
                let cardList = Array(cardData.values)
                self.creditCardList = cardList.sorted { $0.rank < $1.rank }
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch let error {
                print("Error json parsing \(error)")
            }
        }
        
        /*Firebase Firestore 읽기*/
//        db.collection("creditCardList").addSnapshotListener { snapshot, error in
//            guard let documents = snapshot?.documents else {
//                print("Error Firestore fetching document: \(String(describing: error))")
//                return
//            }
//
//            self.creditCardList = documents.compactMap { doc -> CreditCard? in
//                do {
//                    let jsonData = try JSONSerialization.data(withJSONObject: doc.data(), options: [])
//                    let creditCard = try JSONDecoder().decode(CreditCard.self, from: jsonData)
//                    return creditCard
//                } catch let error {
//                    print("Error json parsing \(error)")
//                    return nil
//                }
//            }.sorted { $0.rank < $1.rank }
//
//            DispatchQueue.main.async {
//                self.tableView.reloadData()
//            }
//        }
    }
}

//UITableView
extension CardListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return creditCardList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CardListTableViewCell", for: indexPath) as? CardListTableViewCell else { return UITableViewCell() }
        
        let imageURL = URL(string: creditCardList[indexPath.row].cardImageURL)
        cell.cardImageView.kf.setImage(with: imageURL)
        cell.rankLabel.text = "\(creditCardList[indexPath.row].rank)위"
        cell.promotionLabel.text = "\(creditCardList[indexPath.row].promotionDetail.amount)만원 증정"
        cell.cardNameLabel.text = creditCardList[indexPath.row].name
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //상세화면 전달
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let detailViewController = storyboard.instantiateViewController(identifier: "CardDetailViewController") as? CardDetailViewController else { return }
        
        detailViewController.promotionDetail = creditCardList[indexPath.row].promotionDetail
        self.show(detailViewController, sender: nil)
        
        /*Firebase Database 쓰기
        let cardID = creditCardList[indexPath.row].id
        //option1
        self.ref.child("Item\(cardID)/isSelected").setValue(true)
        //option2
        self.ref.queryOrdered(byChild: "id").queryEqual(toValue: cardID).observe(.value) {[weak self] snapshot in
            guard let self = self,
                  let value = snapshot.value as? [String: [String: Any]],
                  let key = value.keys.first else { return }
            
            self.ref.child("\(key)/isSelected").setValue(true)
        }
        */
        
        /*Firebase Firestore 쓰기
        let cardID = creditCardList[indexPath.row].id
        
        //option1
        self.db.collection("creditCardList").document("card\(cardID)").updateData(["isSelected": true])
        
        //option2
        self.db.collection("creditCardList").whereField("id", isEqualTo: cardID).getDocuments { snapshot, error in
            guard let document = snapshot?.documents.first else {
                print("Error Firestore fetching document: \(String(describing: error))")
                return
            }
            
            document.reference.updateData(["isSelected": true])
        }
         */
    }
    
    //Firebase Database/Firestore 삭제
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            /*Firebase Realtime Database 삭제
            let cardID = creditCardList[indexPath.row].id
            self.ref.queryOrdered(byChild: "id").queryEqual(toValue: cardID).observe(.value) {[weak self] snapshot in
                guard let self = self,
                      let value = snapshot.value as? [String: [String: Any]],
                      let key = value.keys.first else { return }
                
                self.ref.child(key).removeValue()
            }
            */
            
            /*Firebase Firestore 삭제*/
            let cardID = creditCardList[indexPath.row].id
            
            //option1
            self.db.collection("creditCardList").document("card\(cardID)").delete()
            
            //option2
            self.db.collection("creditCardList").whereField("id", isEqualTo: cardID).getDocuments { snapshot, error in
                guard let document = snapshot?.documents.first else {
                    print("Error Firestore fetching document: \(String(describing: error))")
                    return
                }

                document.reference.delete()
            }
        }
    }
}
