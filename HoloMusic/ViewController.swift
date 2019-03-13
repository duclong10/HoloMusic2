//
//  ViewController.swift
//  HoloMusic
//
//  Created by Trương Thắng on 3/12/19.
//  Copyright © 2019 Trương Thắng. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {
    
    var img = ["1.png","2.png","3.png","4.png","5.png","6.png"]
    var imgMp3 = ["h1","h2","h3","h4","h5","h6"]

    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
       
        tableview.register(UINib (nibName: "HeaderTableCell", bundle: nil), forCellReuseIdentifier: "HeaderTableCell")
        tableview.register(UINib (nibName: "DetailTableCell", bundle: nil), forCellReuseIdentifier: "DetailTableCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return img.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailTableCell", for: indexPath) as! DetailTableCell
        cell.imageAnh.image = UIImage(named: img[indexPath.row])
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
        return 50
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let mh = sb.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        mh.imgMp3 = imgMp3
        self.navigationController?.pushViewController(mh, animated: true)

    }


}

