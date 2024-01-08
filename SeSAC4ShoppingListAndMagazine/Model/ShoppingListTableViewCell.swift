//
//  ShoppingListTableViewCell.swift
//  SeSAC4ShoppingListAndMagazine
//
//  Created by Minho on 1/8/24.
//

import UIKit

class ShoppingListTableViewCell: UITableViewCell {

    @IBOutlet weak var checkButton: UIButton!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var shoppingItemLabel: UILabel!
    @IBOutlet weak var shoppingListView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
