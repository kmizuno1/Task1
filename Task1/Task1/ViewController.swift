//
//  ViewController.swift
//  Task1
//
//  Created by k.mizuno@appdevteam.work on 2019/11/18.
//  Copyright © 2019 k.mizuno@appdevteam.work. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{


    @IBOutlet weak var tableView: UITableView!
    
    var nameList:[Name] = [Name]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        nameList.append(Name(data: (1,"Shiro")))
        nameList.append(Name(data: (2,"Lina")))
        nameList.append(Name(data: (3,"Wakaba")))
        nameList.append(Name(data: (4,"Rin")))
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //セルを取得する
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        //セルに表示する値を固定する
        cell.textLabel!.text = nameList[indexPath.row].name
        return cell
    }
    
    @IBAction func sortByName(_ sender: Any) {
        nameList.sort{$0.name < $1.name}
        tableView.reloadData()
    }
    
    @IBAction func sortById(_ sender: Any) {
        nameList.sort{$0.id < $1.id}
        tableView.reloadData()
    }
    


}

class Name:NSObject {
    var id:Int
    var name:String
    init(data:(Int,String)) {
        id = data.0
        name = data.1
    }
}

