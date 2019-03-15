//
//  Mp3ViewController.swift
//  HoloMusic
//
//  Created by Trương Thắng on 3/14/19.
//  Copyright © 2019 Trương Thắng. All rights reserved.
//

import UIKit

class Mp3ViewController: UIViewController {
    var playLists : SongModel?
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var img: UIImageView!
    
    @IBOutlet weak var lblSinger: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.detail()
    }
    
    func detail() {
        img.sd_setImage(with: URL(string: playLists!.avatar))
        lblSinger.text = playLists?.singer
        lblName.text = playLists?.name
    }
    @IBAction func btnBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
