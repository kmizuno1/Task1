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
            Name(id: 1,name: "Shiro"),
            Name(id: 2,name: "Lina"),
            Name(id: 3,name: "Wakaba"),
            Name(id: 4,name: "Rin")
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
        nameCell.label_id.text = String(nameList[indexPath.row].Id)
        nameCell.label_name.text = nameList[indexPath.row].Name
        return nameCell
    }
    
    //name昇順でソート
    @IBAction func sortByName(_ sender: Any) {
        nameList.sort{$0.Name < $1.Name}
        tableView.reloadData()
    }
    
    //id昇順でソート
    @IBAction func sortById(_ sender: Any) {
        nameList.sort{$0.Id < $1.Id}
        tableView.reloadData()
    }


}

//カスタムクラスを作成
class Name{
    let Id:Int
    let Name:String
    init(id:Int,name:String) {
        Id = id
        Name = name
    }
}

