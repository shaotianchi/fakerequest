//
//  FakeRequest.swift
//  FakeRequestDemo
//
//  Created by ShaoTianchi on 14/12/20.
//  Copyright (c) 2014年 rainbow. All rights reserved.
//

import UIKit
import SwiftyJSON
import ReactiveCocoa

typealias DesignatedKeyValue = Dictionary<String, [AnyObject]>
var kClassPropertiesKey: UInt8 = 0

class FakeRequest: NSObject, UITableViewDelegate, UITableViewDataSource {
    private var notificationPool: Dictionary<String, [String : AnyObject]>
    private var notificationKey: String?
    private var notifacationTable: UITableView!
    
    let keyWindow = UIApplication.sharedApplication().windows[0] as UIWindow
    
    override init() {
        self.notificationPool = [:]
        self.notifacationTable = UITableView(frame: CGRectMake(0, 0, 200, 250))
        super.init()
        self.notifacationTable.delegate = self
        self.notifacationTable.dataSource = self
    }
    
    class var sharedInstance :FakeRequest {
        struct Singleton {
            static let instance = FakeRequest()
        }
        return Singleton.instance
    }
    
    class func Start() {
        let instance = self.sharedInstance;
        // add help btn in to window
        let btn = UIButton.buttonWithType(UIButtonType.Custom) as UIButton
        btn.frame = CGRectMake(0, 0, 44, 44)
        btn.addTarget(instance, action: Selector("helpBtnAction:"), forControlEvents: UIControlEvents.TouchUpInside)
        btn.backgroundColor = UIColor.redColor()
        instance.keyWindow.addSubview(btn)
        instance.keyWindow.bringSubviewToFront(btn)
    }
    
    class func Request(model: FRSerializable, count: Int, specialKeys: [String], specialValue: (key:String, index: Int) -> (AnyObject)) -> [String : AnyObject]? {
        
        var data = Array<[String : AnyObject]>()
        for var i = 0; i < count; i++ {
            var modelDic: Dictionary<String, AnyObject> = model.toDictionary() as Dictionary
            for key in specialKeys {
                let value: (AnyObject) = specialValue(key: key, index: i)
                modelDic.updateValue(value, forKey: key)
            }
            data.append(modelDic);
        }
        
        return ["response": ["code" : 0, "data" : data, "msg" : ""]]
    }
    
    class func RegisterNotification(#model: FRSerializable, key: String) -> RACSignal {
//        let instance = self.sharedInstance
//        var subject = RACSubject()
//        subject.name = key
//        instance.notificationPool.updateValue(["subject" : subject, "json" : model.toDictionary()], forKey: key)
//        return subject
        return RACSignal.empty()
    }
    
    class func SendNotification(key: String) {
        let instance = self.sharedInstance
        let subject = (instance.notificationPool[key]! as [String : AnyObject])["subject"] as RACSubject
        let json: AnyObject? = (instance.notificationPool[key]! as [String : AnyObject])["json"]
        subject.sendNext(json)
    }
    
    //MARK: help btn
    func helpBtnAction(sender: UIButton) {
        let containsObjects = self.keyWindow.subviews.filter{$0 as NSObject == self.notifacationTable}
        if containsObjects.count > 0 {
            self.hideNotificationTable()
        } else {
            self.showNotificationTable()
        }
    }
    
    private func showNotificationTable() {
        self.keyWindow.insertSubview(self.notifacationTable, atIndex: 1)
        self.notifacationTable.reloadData()
    }
    
    private func hideNotificationTable() {
        self.notifacationTable.removeFromSuperview()
    }
    
    //MARK: tableview
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Array(self.notificationPool.keys).count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let CellIdentifier = "NotificationCell"
        var cell: UITableViewCell? = tableView.dequeueReusableCellWithIdentifier(CellIdentifier) as? UITableViewCell
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: CellIdentifier)
        }
        cell!.textLabel?.text = Array(self.notificationPool.keys)[indexPath.row]
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        FakeRequest.SendNotification(Array(self.notificationPool.keys)[indexPath.row]);
    }
}
