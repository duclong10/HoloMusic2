//
//  SongsModel.swift
//  HoloMusic
//
//  Created by Trương Thắng on 3/14/19.
//  Copyright © 2019 Trương Thắng. All rights reserved.
//

import Foundation

struct SongModel {
    var name : String = ""
    var singer : String = ""
    var avatar : String = ""
    
    init(json: [String:Any]) {
        self.name = json["name"] as! String
        self.singer = json["singer"] as! String
        self.avatar = json["avatar"] as! String
        
    }
}
