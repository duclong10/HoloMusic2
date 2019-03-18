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
    
    @IBOutlet weak var lblS1: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var img: UIImageView!
    
    @IBOutlet weak var lblS3: UILabel!
    @IBOutlet weak var lblS2: UILabel!
    @IBOutlet weak var lblSinger: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.detail()
    }
    
    func detail() {
        img.sd_setImage(with: URL(string: playLists!.avatar))
        lblSinger.text = playLists?.singer
        lblName.text = playLists?.name
        lblS3.text = playLists?.singer
        lblS2.text = playLists?.name
        
    }
    @IBAction func btnBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
