//
//  ViewController.swift
//  TableView
//
//  Created by Omid Heydarzadeh on 6/29/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let fruits = [
        Fruit.init(name: "Apple", image: "apple", price: "5"),
        Fruit.init(name: "Banana", image: "banana", price: "4"),
        Fruit.init(name: "Grapes", image: "grapes", price: "3"),
        Fruit.init(name: "Melon", image: "melon", price: "6"),
        Fruit.init(name: "Water Melon", image: "watermelon", price: "7"),
        Fruit.init(name: "Peach", image: "peach", price: "4")
    ]
    
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CustomCell.self, forCellReuseIdentifier: "cell")
        tableView.rowHeight = 120
        
    }
    
    // implement data source for table view
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fruits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell
        let fruit = fruits[indexPath.row]
        cell.fruitImage.image = UIImage(named: fruit.image)
        cell.fruitName.text = fruit.name
        cell.fruitPrice.text = "$ \(fruit.price)"
        return cell
    }
    
    // implement delegate for table view
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print(#function)
        print("cell of \(fruits[indexPath.row].name) is clicked")
    }
    
    
}

// MARK: - Custom Cell

class CustomCell: UITableViewCell {
    
    let fruitImage = UIImageView()
    let fruitName = UILabel()
    let fruitPrice = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(fruitImage)
        addSubview(fruitName)
        addSubview(fruitPrice)
        fruitImage.frame = CGRect(x: 10, y: 10, width: 100, height: 100)
        fruitName.frame = CGRect(x: 120, y: 20, width: 120, height: 30)
        fruitPrice.frame = CGRect(x: 120, y: 60, width: 120, height: 30)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Model

struct Fruit {
    var name: String
    var image: String
    var price: String
}
