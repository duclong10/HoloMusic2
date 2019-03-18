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
        if json["name"] != nil{
             self.name = json["name"] as! String
        }
        if json["singer"] != nil{
            self.singer = json["singer"] as! String
        }
        if json["avatar"] != nil{
            self.avatar = json["avatar"] as! String
        }
        
        
    }
}
