//
//  ViewController.swift
//  Task1
//
//  Created by k.mizuno@appdevteam.work on 2019/11/18.
//  Copyright © 2019 k.mizuno@appdevteam.work. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource{


    @IBOutlet weak var tableView: UITableView!
    
    var nameList:[Name] = [Name]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        
        nameList += [
            Name(id: 1,name: "Shiro", armStrength: 5),
            Name(id: 2,name: "Lina", armStrength: 20),
            Name(id: 3,name: "Wakaba", armStrength: 1),
            Name(id: 4,name: "Rin", armStrength: 1000)
        ]
        
    }
    
    //MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //セルを取得する
        let nameCell: NameCell = tableView.dequeueReusableCell(withIdentifier: "NameCell", for: indexPath) as! NameCell
        
        //セルに表示する値を固定する
        nameCell.label_id.text = String(nameList[indexPath.row].id)
        nameCell.label_name.text = nameList[indexPath.row].name
        nameCell.label_armStrength.text = String(nameList[indexPath.row].armStrength)
        return nameCell
    }
    
    //name昇順でソート
    @IBAction func sortByName(_ sender: Any) {
        nameList.sort{$0.name < $1.name}
        tableView.reloadData()
    }
    
    //id昇順でソート
    @IBAction func sortById(_ sender: Any) {
        nameList.sort{$0.id < $1.id}
        tableView.reloadData()
    }

    //腕力降順でソート
    @IBAction func sortByArmStrength(_ sender: Any) {
        nameList.sort{$1.armStrength < $0.armStrength}
        tableView.reloadData()
    }
    
}

//MARK: - カスタムクラスを作成

class Name{
    let id:Int
    let name:String
    let armStrength:Int
    init(id:Int,name:String,armStrength:Int) {
        self.id = id
        self.name = name
        self.armStrength = armStrength
    }
}

