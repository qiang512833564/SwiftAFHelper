//
//  ViewController.swift
//  SwiftAFHelper
//
//  Created by GES-iMac on 16/8/24.
//  Copyright © 2016年 GES-iMac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        //测试请求
        AFNetworkingHelper.shareInstance.request(.GET, urlString: "http://httpbin.org/get", parameters: ["name":"umr","age":18]) { (result, error) in
            if error != nil {
                print(error)
                return
            }
            print(result)
        }
        
    }

}

