//
//  DataViewMdel.swift
//  HoloMusic
//
//  Created by Trương Thắng on 3/14/19.
//  Copyright © 2019 Trương Thắng. All rights reserved.
//

import UIKit

class DataViewMdel: NSObject {
    
    
    static func getApiMpp3(params : NSDictionary,completHander: @escaping ([SongModel], String)->()){
        
        var lstSong = [SongModel]()
        
        APIService.sharedInstance.getMp3(parmas: params) { (response, error) in
            if error == ""{
                let respone = response as! [String:Any]
                let data = respone["data"] as! [String:Any]
                let lstPlaylists = data["playlists"] as! [[String:Any]]
                for dict in lstPlaylists {
                    
                    let obj = SongModel.init(json: dict)
                    lstSong.append(obj)
                    
                }
                
                
                completHander(lstSong,error)
                
                
            }else{
                print("")
            }
        }
        
    }

}
