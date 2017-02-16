//
//  AFNetworkingHelper.swift
//  SwiftAFHelper
//
//  Created by GES-iMac on 16/8/24.
//  Copyright © 2016年 GES-iMac. All rights reserved.
//

import AFNetworking

//定义枚举类型 Int String
enum RequestType : String {
    case GET = "GET"
    case POST = "POST"
}

class AFNetworkingHelper: AFHTTPSessionManager {
    //let是线程安全的
    /// AFNetworkingHelper单例
    static let shareInstance : AFNetworkingHelper = {
        let afHelper = AFNetworkingHelper()
        afHelper.responseSerializer.acceptableContentTypes?.insert("text/html")
        return afHelper
    }()
}

/*
 1>通过shareInstance拿到的永远是一个实例
 2>永远只有一个实例
 */

//测试网站 --- httpbin.org
// MARK: - 注释>封装请求方法
extension AFNetworkingHelper{
    
    func request(_ methodType : RequestType,urlString : String,parameters : [String : AnyObject],finished : @escaping (_ result : AnyObject?,_ error : NSError?) -> ()){
        
        //定义成功的回调闭包
        let successCallBack = {(task : URLSessionDataTask?, result : AnyObject?)->Void in
            finished(result,nil)
        }
        
        //定义失败的回调闭包
        let failureCallBack = {(task : URLSessionDataTask?, error : NSError)-> Void in
            finished(nil,error)
        }
        //发送网络请求
        if methodType == .GET {
            get(urlString, parameters: parameters,progress: nil, success: successCallBack,failure: failureCallBack)
        }else{
            post(urlString, parameters: parameters, progress: nil, success: successCallBack,failure: failureCallBack)
        }
    }
    
}


