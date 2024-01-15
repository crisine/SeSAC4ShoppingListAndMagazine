//
//  TravelTableViewController.swift
//  SeSAC4ShoppingListAndMagazine
//
//  Created by Minho on 1/8/24.
//

import UIKit
import Kingfisher

class TravelTableViewController: UITableViewController {

    var magazineList: [Magazine] = MagazineInfo.magazine
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.separatorStyle = .none
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return magazineList.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TravelTableViewCell", for: indexPath) as! TravelTableViewCell

        let index = indexPath.row
        let imageUrl = URL(string: magazineList[index].photo_image)

        cell.photoImageView.kf.setImage(with: imageUrl)
        cell.photoImageView.contentMode = .scaleAspectFill
        cell.photoImageView.clipsToBounds = true
        cell.photoImageView.layer.cornerRadius = 16
        
        cell.titleLabel.font = .boldSystemFont(ofSize: 24)
        cell.titleLabel.textColor = .black
        cell.titleLabel.text = magazineList[index].title
        
        cell.subtitleLabel.font = .systemFont(ofSize: 14)
        cell.subtitleLabel.textColor = .gray
        
        cell.subtitleLabel.text = magazineList[index].subtitle
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyMMdd"
        
        if let date = dateFormatter.date(from: magazineList[index].date) {
            dateFormatter.dateFormat = "yy년 MM월 dd일"
            cell.dateLabel.text = dateFormatter.string(from: date)
        } else {
            print("날짜 변환 실패")
        }
        
        cell.dateLabel.font = .systemFont(ofSize: 14)
        cell.dateLabel.textColor = .gray
    
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let magazine = magazineList[indexPath.row]
        
        let vc = storyboard?.instantiateViewController(withIdentifier: MagazineWebViewController.identifier) as! MagazineWebViewController
        
        vc.configureWebView(urlString: magazine.link)
        
        navigationController?.pushViewController(vc, animated: true)
    }
}
