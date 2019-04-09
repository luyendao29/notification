//
//  ViewController.swift
//  notificationClass
//
//  Created by hoanganh on 4/8/19.
//  Copyright © 2019 hoanganh. All rights reserved.
//

import UIKit

class Person {
    var image: Data?
    var name: String?
    var price: String?
    init(image: Data , name: String, price: String) {
        self.image = image
        self.name = name
        self.price = price
    }
}

class ViewController: UIViewController{

    @IBOutlet weak var tableView: UITableView!
    var perSon = [Person]()
    override func viewDidLoad() {
        super.viewDidLoad()
        perSon = [
            Person(image: ((UIImage(named: "1")?.pngData())!), name: "hot1", price: "2$"),
            Person(image: ((UIImage(named: "2")?.pngData())!), name: "hot2", price: "2$"),
            Person(image: ((UIImage(named: "3")?.pngData())!), name: "hot3", price: "2$")
        ]
        tableView.dataSource = self
        tableView.delegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(update(notification:)), name: .notifications, object: nil)
    }
    @objc func update(notification: NSNotification){
       
        if let indexPath = tableView.indexPathForSelectedRow{
            perSon[indexPath.row] = notification.object as! Person
            
        }else{
            perSon.append(notification.object as! Person)
        }
        tableView.reloadData()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as? DetailViewController
        if let indexPath = tableView.indexPathForSelectedRow{
            let data = perSon[indexPath.row]
            vc?.perSon1 = data
        }
    }


}
extension ViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return perSon.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.indexPath = indexPath
        let list = perSon[indexPath.row]
        cell.images.image = UIImage(data: list.image!)
        cell.names.text = list.name
        cell.price.text = list.price
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            perSon.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
    
}

