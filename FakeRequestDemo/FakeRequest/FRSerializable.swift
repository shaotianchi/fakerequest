//
//  FRSerializable.swift
//  FakeRequestDemo
//
//  Created by ShaoTianchi on 15/1/3.
//  Copyright (c) 2015年 rainbow. All rights reserved.
//


class FRSerializable: NSObject {
    func toDictionary() -> NSDictionary {
        var aClass : AnyClass? = self.dynamicType
        var propertiesCount : CUnsignedInt = 0
        let propertiesInAClass : UnsafeMutablePointer<objc_property_t> = class_copyPropertyList(aClass, &propertiesCount)
        var propertiesDictionary : NSMutableDictionary = NSMutableDictionary()
        
        for var i = 0; i < Int(propertiesCount); i++ {
            var property = propertiesInAClass[i]
            var propName = NSString(CString: property_getName(property), encoding: NSUTF8StringEncoding)
            var propType = property_getAttributes(property)
            var propValue : AnyObject! = self.valueForKey(propName!);
            
            if propValue is FRSerializable {
                propertiesDictionary.setValue((propValue as FRSerializable).toDictionary(), forKey: propName!)
            } else if propValue is Array<FRSerializable> {
                var subArray = Array<NSDictionary>()
                for item in (propValue as Array<FRSerializable>) {
                    subArray.append(item.toDictionary())
                }
                propertiesDictionary.setValue(subArray, forKey: propName!)
            } else if propValue is NSData {
                propertiesDictionary.setValue((propValue as NSData).base64EncodedStringWithOptions(nil), forKey: propName!)
            } else if propValue is Bool {
                propertiesDictionary.setValue((propValue as Bool).boolValue, forKey: propName!)
            } else if propValue is NSDate {
                var date = propValue as NSDate
                let dateFormatter = NSDateFormatter()
                dateFormatter.dateFormat = "Z"
                var dateString = NSString(format: "/Date(%.0f000%@)/", date.timeIntervalSince1970, dateFormatter.stringFromDate(date))
                propertiesDictionary.setValue(dateString, forKey: propName!)
            } else {
                propertiesDictionary.setValue(propValue, forKey: propName!)
            }
        }
        
        return propertiesDictionary
    }
    
    func toJson() -> NSData! {
        var dictionary = self.toDictionary()
        var err: NSError?
        return NSJSONSerialization.dataWithJSONObject(dictionary, options:NSJSONWritingOptions(0), error: &err)
    }
    
    func toJsonString() -> NSString! {
        return NSString(data: self.toJson(), encoding: NSUTF8StringEncoding)
    }
    override
    init() { }
}
