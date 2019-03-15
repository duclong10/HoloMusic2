//
//  ViewController.swift
//  HoloMusic
//
//  Created by Trương Thắng on 3/12/19.
//  Copyright © 2019 Trương Thắng. All rights reserved.
//

import UIKit
import SDWebImage


struct Song {
    var thumbnail: UIImage?
    var title: String
    var artist: String
}

class ViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {
    
    var number = ["1","2","3","4","5","6"]
    var imgMp3 = ["h1","h2","h3","h4","h5","h6"]
    var lstPlaylis = [SongModel]()
    
//    var data: [Song] = []

    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
        getApi(prams: ["":""])
       
        tableview.register(UINib (nibName: "DetailTableCell", bundle: nil), forCellReuseIdentifier: "DetailTableCell")
    }
    
    func getApi(prams:NSDictionary)  {
        DataViewMdel.getApiMpp3(params: prams) { (lstSong, error) in
            self.lstPlaylis = lstSong
            self.tableview.reloadData()
        }
    
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if lstPlaylis != nil{
            return lstPlaylis.count
        }
        return 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailTableCell", for: indexPath) as! DetailTableCell
        let obj = lstPlaylis[indexPath.row]
        cell.lblCs.text = obj.singer
        cell.lblName.text = obj.name
        cell.img.sd_setImage(with: URL(string: obj.avatar))
        cell.lblNuber.text = "\(indexPath.row + 1)"
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.01
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
//        vc.playLists = self.lstPlaylis[indexPath.row]
        self.navigationController?.present(vc, animated: true, completion: nil)

    }


}

