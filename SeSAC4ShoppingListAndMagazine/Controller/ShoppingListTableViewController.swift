//
//  ShoppingListTableViewController.swift
//  SeSAC4ShoppingListAndMagazine
//
//  Created by Minho on 1/8/24.
//

import UIKit

class ShoppingListTableViewController: UITableViewController {
    
    @IBOutlet weak var shoppingListInputView: UIView!
    @IBOutlet weak var shoppingListInputTextField: UITextField!
    @IBOutlet weak var shoppingListAddButton: UIButton!
    
    var shoppingList: [ShoppingItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        shoppingListInputView.backgroundColor = .systemGray6
        shoppingListInputView.clipsToBounds = true
        shoppingListInputView.layer.cornerRadius = 16
        
        shoppingListAddButton.setTitleColor(.black, for: .normal)
        shoppingListAddButton.backgroundColor = .systemGray5
        shoppingListAddButton.clipsToBounds = true
        shoppingListAddButton.layer.cornerRadius = 8
        
        shoppingListInputTextField.backgroundColor = .systemGray6
        shoppingListInputTextField.font = .systemFont(ofSize: 16)
        shoppingListInputTextField.placeholder = "무엇을 구매하실 건가요?"
        shoppingListInputTextField.borderStyle = .none
    }

    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShoppingListTableViewCell", for: indexPath) as! ShoppingListTableViewCell

        let rowIndex = indexPath.row
        
        self.shoppingListAddButton.tag = rowIndex
        
        cell.shoppingItemLabel.text = shoppingList[rowIndex].text
        cell.checkButton.setImage(shoppingList[rowIndex].checkImage, for: .normal)
        cell.favoriteButton.setImage(shoppingList[rowIndex].favoriteImage, for: .normal)

        cell.checkButton.tag = rowIndex
        cell.checkButton.addTarget(self, action: #selector(didCheckButtonTapped), for: .touchUpInside)
        
        cell.favoriteButton.tag = rowIndex
        cell.favoriteButton.addTarget(self, action: #selector(didFavoriteButtonTapped), for: .touchUpInside)
        
        cell.shoppingListView.backgroundColor = .systemGray6
        cell.shoppingListView.clipsToBounds = true
        cell.shoppingListView.layer.cornerRadius = 8
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }

    @IBAction func didShoppingListAddbuttonTapped(_ sender: UIButton) {
        
        guard let itemText = shoppingListInputTextField.text else { return }
        shoppingListInputTextField.text = ""
        
        let shoppingItem = ShoppingItem(text: itemText, checkImage: UIImage(systemName: "checkmark.square")!.withTintColor(.black, renderingMode: .alwaysOriginal), favoriteImage: UIImage(systemName: "star")!.withTintColor(.black, renderingMode: .alwaysOriginal))
        
        shoppingList.append(shoppingItem)
        
        tableView.reloadData()
        tableView.reloadRows(at: [IndexPath(row: shoppingList.count, section: 0)], with: .fade)
    }
    
    
    @objc func didCheckButtonTapped(_ sender: UIButton) {
        let index = sender.tag
        
        shoppingList[index].isChecked.toggle()
        
        switch shoppingList[index].isChecked {
        case true:
            shoppingList[index].checkImage = UIImage(systemName: "checkmark.square.fill")!.withTintColor(.black, renderingMode: .alwaysOriginal)
        case false:
            shoppingList[index].checkImage = UIImage(systemName: "checkmark.square")!.withTintColor(.black, renderingMode: .alwaysOriginal)
        }
        
        tableView.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .fade)
    }
    
    @objc func didFavoriteButtonTapped(_ sender: UIButton) {
        let index = sender.tag
        
        shoppingList[index].isFavorited.toggle()
        
        switch shoppingList[index].isFavorited {
        case true:
            shoppingList[index].favoriteImage = UIImage(systemName: "star.fill")!.withTintColor(.black, renderingMode: .alwaysOriginal)
        case false:
            shoppingList[index].favoriteImage = UIImage(systemName: "star")!.withTintColor(.black, renderingMode: .alwaysOriginal)
        }
        
        tableView.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .fade)
    }
    
}
