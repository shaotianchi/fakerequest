//
//  ViewController.swift
//  FakeRequestDemo
//
//  Created by ShaoTianchi on 14/12/20.
//  Copyright (c) 2014年 rainbow. All rights reserved.
//

import UIKit


class LoginModel: FRSerializable {
    var userName: String?;
    var psw: String?;
    var user_id: Int?;
}

class Naaaaa: FRSerializable {
    var name: String = "123"
    var sss : Int = 123
    var ggg = ["123", "222", "444"]
}

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var loginModel = LoginModel()
        loginModel.userName = "1"
        loginModel.psw      = "2"
        let result =
        FakeRequest.Request(loginModel, count: 10, specialKeys: ["user_id"]) { (key, index) -> (AnyObject) in
            return index
        }
//        println(FakeRequest.Request(Naaaaa(), count: 6, designatedValues: true))
        println(result)
        
        FakeRequest.RegisterNotification(model: Naaaaa(), key: "Socket").subscribeNext { (json) -> Void in
            println(json)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

