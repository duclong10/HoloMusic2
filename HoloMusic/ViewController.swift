//
//  ViewController.swift
//  HoloMusic
//
//  Created by Trương Thắng on 3/12/19.
//  Copyright © 2019 Trương Thắng. All rights reserved.
//

import UIKit

struct Song {
    var thumbnail: UIImage?
    var title: String
    var artist: String
}

class ViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {
    
    var number = ["1","2","3","4","5","6"]
    var imgMp3 = ["h1","h2","h3","h4","h5","h6"]
    
    var data: [Song] = []

    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        data = [Song(thumbnail: UIImage(named: "h1"), title: "Hello", artist: "Tuan Hung"),
                Song(thumbnail: UIImage(named: "h2"), title: "Gia nhu", artist:"Dan Truong"),
                Song(thumbnail: UIImage(named: "h3"), title: "Anh khac Hay em khac", artist: "Dan Phuong"),
                Song(thumbnail: UIImage(named: "h4"), title: "Neu em di", artist: "My Tam"),
                Song(thumbnail: UIImage(named: "h5"), title: "Minh tung quen nhau", artist: "Long Duc"),
                Song(thumbnail: UIImage(named: "h6"), title: "Trang giay trang", artist: "Pham Truong")]
        
        tableview.delegate = self
        tableview.dataSource = self
       
        tableview.register(UINib (nibName: "HeaderTableCell", bundle: nil), forCellReuseIdentifier: "HeaderTableCell")
        tableview.register(UINib (nibName: "DetailTableCell", bundle: nil), forCellReuseIdentifier: "DetailTableCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailTableCell", for: indexPath) as! DetailTableCell
//        cell.imageAnh.image = UIImage(named: img[indexPath.row])
        let obj = data[indexPath.row]
        cell.img.image = obj.thumbnail
        cell.lblCs.text = obj.artist
        cell.lblName.text = obj.title
        cell.lblNuber.text = number[indexPath.row]
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
       let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderTableCell") as! HeaderTableCell
       return cell
        
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        vc.imgMp3 = imgMp3
//        self.navigationController?.pushViewController(mh, animated: true)
        self.navigationController?.present(vc, animated: true, completion: nil)

    }


}

