
import UIKit
let someInstance: UIViewController = UIViewController()
// someInstance is of type SomeBaseClass at compile time, but
// someInstance is of type SomeSubClass at runtime
NSStringFromClass(someInstance.dynamicType.classForCoder())
NSStringFromClass(someInstance.dynamicType)
// prints "SomeSubClass"

protocol Serializable {
    init(dictionary: [NSObject: AnyObject])
}

class Test {
    var tt: String = "1"
}
    
var t = Test()
//t.classForCoder.description()

var ggg = Test.self

class JModel {
    class func jsonDesc() -> String {
        return ""
    }
}

class JArray<T>: ArrayLiteralConvertible{
    typealias Element = T
    var array: Array<T>
    init() {
        array = Array<T>()
    }
    
    init(arr: Array<T>) {
        array = arr
    }
    
    subscript(i: Int) -> T {
        return array[i]
    }
    
    required convenience
    init(arrayLiteral elements: T...) {
        self.init(arr: elements)
    }
    
    
}

extension Array {
    static func arrayJsonValue() -> String {
        var value: String = "["
        if T.self is String.Type {
            value = "String"
        } else if T.self is Int.Type {
            value = "1"
        } else if T.self is Double.Type {
            value = "1.00"
        } else if T.self is Float.Type {
            value = "1.00"
        } else if T.self is Array<AnyObject>.Type {
            value = Array<AnyObject>.arrayJsonValue()
        } else if T.self is Dictionary<String, AnyObject>.Type {
            
        } else if T.self is JModel.Type {
        }
        return ""
    }
}

var ja1: JArray<String> = ["1","2"]
ja1[0]
var ja = JArray<String>()


protocol JSONable {
    class func JSONDescription() -> String
}

class TModel: JSONable {
    var name = "123"
    class func JSONDescription() -> String {
        return "{\"name\" : \"sdfa\"}"
    }
}

class CTModel: TModel {
    override class func JSONDescription() -> String {
        return "{\"name\" : \"sdfa\"}"
    }
}


class __Serializable : NSObject{
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
            
            if propValue is __Serializable {
                propertiesDictionary.setValue((propValue as __Serializable).toDictionary(), forKey: propName!)
            } else if propValue is Array<__Serializable> {
                var subArray = Array<NSDictionary>()
                for item in (propValue as Array<__Serializable>) {
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


class TTTT: __Serializable {
    var name = "123"
    var iii = 123
    var aaa = ["1","2","3"]
}

var tg = TTTT()
tg.toJsonString()

