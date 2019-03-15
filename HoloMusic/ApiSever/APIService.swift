//
//  APIService.swift
//  HoloMusic
//
//  Created by Trương Thắng on 3/14/19.
//  Copyright © 2019 Trương Thắng. All rights reserved.
//

import Foundation
import Alamofire
import UIKit




open class APIService {
    
    let headers: HTTPHeaders = [
        "Accept": "application/json",
        "Content-Type": "application/x-www-form-urlencoded"
    ]
    
    
    static let sharedInstance = APIService()
    
    
    
    func httpRequestAPI(url:String,params:[String:Any],meThod:MethodApi,completionHandler: @escaping (NSDictionary,String)->()) {
        
        if meThod == .PostApi {
            Alamofire.request(url, method: .post, parameters: params, encoding: URLEncoding.default, headers: nil).responseJSON { (response:DataResponse<Any>) in
                
                switch(response.result) {
                case .success(let JSON):
                    if response.result.value != nil{
                        
                        
                        completionHandler(JSON as! NSDictionary,"")
                        
                    }
                    break
                    
                case .failure(_):
                    completionHandler (NSDictionary(),"Fail")
                    break
                }
            }
        }else if meThod == .GetApi {
            Alamofire.request(url, method: .get, parameters: params, encoding: URLEncoding.default, headers: nil).responseJSON { (response:DataResponse<Any>) in
                
                switch(response.result) {
                case .success(let JSON):
                    if response.result.value != nil{
                        completionHandler (JSON  as! NSDictionary,"")
                    }
                    break
                    
                case .failure(_):
                    completionHandler (NSDictionary(),"Fail")
                    break
                }
            }
        }else if meThod == .PutApi {
            Alamofire.request(url, method: .put, parameters: params, encoding: URLEncoding.default, headers: nil).responseJSON { (response:DataResponse<Any>) in
                
                switch(response.result) {
                case .success(let JSON):
                    if response.result.value != nil{
                        completionHandler (JSON  as! NSDictionary,"")
                    }
                    break
                    
                case .failure(_):
                    completionHandler (NSDictionary(),"Fail")
                    break
                }
            }
        }
        
    }
    
   
    func getMp3(parmas :NSDictionary, completionHander: @escaping (NSDictionary, String)-> ()){
       
        let url = mp3Url
        self.httpRequestAPI(url: url, params: parmas as! [String:Any], meThod: MethodApi.GetApi) { (response, error) in
            completionHander(response,error)
            
        }
        
        
    }
}

