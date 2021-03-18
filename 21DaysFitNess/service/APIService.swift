//
//  APIService.swift
//  Bai1LamQuenJSON
//
//  Created by hehehe on 6/23/20.
//  Copyright © 2020 hehehe. All rights reserved.
//

import UIKit

typealias ApiCompletion = (_ data: Any?, _ error: Error?) -> ()

typealias ApiParam = [String: Any]

enum ApiMethod: String {
    case GET = "GET"
    case POST = "POST"
}
extension String {
    func addingPercentEncodingForURLQueryValue() -> String? {
        let allowedCharacters = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-._~")
        return self.addingPercentEncoding(withAllowedCharacters: allowedCharacters)
    }
}

extension Dictionary {
    func stringFromHttpParameters() -> String {
        let parameterArray = self.map { (key, value) -> String in
            let percentEscapedKey = (key as! String).addingPercentEncodingForURLQueryValue()!
            if value is String {
                let percentEscapedValue = (value as! String).addingPercentEncodingForURLQueryValue()!
                return "\(percentEscapedKey)=\(percentEscapedValue)"
            }
            else {
                return "\(percentEscapedKey)=\(value)"
            }
        }
        return parameterArray.joined(separator: "&")
    }
}
class APIService:NSObject {
    static let shared: APIService = APIService()
    
    
    private func convertToJson(_ byData: Data) -> Any? {
        do {
            return try JSONSerialization.jsonObject(with: byData, options: [])
        } catch {
            //            self.debug("convert to json error: \(error)")
        }
        return nil
    }
    //http://api.mangageek.net/comics/features?package_name=net.mangamaster.super&version_code=200&version_name=1.2.0.0&channel=google&sign=6e02c5f1e43cc41efe3b13655f2094c7&platform=android&lang=en&country=US&sim=us
    
    func plan_FAT_BURNING_EXERCISE(closure: @escaping (_ response: [exerciseModel]?, _ error: Error?) -> Void) {
        do {
            if let file = Bundle.main.url(forResource: "plan_WAIST_EXERCISE", withExtension: "json") {
                let data = try Data(contentsOf: file)
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                var listExreturn: [exerciseModel] = [exerciseModel]()
                if let dict = json as? [Dictionary<String,AnyObject>] {
                    for item in dict {
                        var dataEx: exerciseModel = exerciseModel()
                        dataEx = dataEx.initLoad(item)
                        listExreturn.append(dataEx)
                    }
                    closure(listExreturn, nil)
                }
            }
        } catch {
            print(error.localizedDescription)
            closure(nil, nil)
        }
        closure(nil, nil)
    }
    
    func plan_WAIST_EXERCISE(closure: @escaping (_ response: [exerciseModel]?, _ error: Error?) -> Void) {
        do {
            if let file = Bundle.main.url(forResource: "plan_WAIST_EXERCISE", withExtension: "json") {
                let data = try Data(contentsOf: file)
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                var listExreturn: [exerciseModel] = [exerciseModel]()
                if let dict = json as? [Dictionary<String,AnyObject>] {
                    for item in dict {
                        var dataEx: exerciseModel = exerciseModel()
                        dataEx = dataEx.initLoad(item)
                        listExreturn.append(dataEx)
                    }
                    closure(listExreturn, nil)
                }
            }
        } catch {
            print(error.localizedDescription)
            closure(nil, nil)
        }
        closure(nil, nil)
    }
    
    func plan_LEG_FAT_BURNING_EXERCISE(closure: @escaping (_ response: [exerciseModel]?, _ error: Error?) -> Void) {
        do {
            if let file = Bundle.main.url(forResource: "plan_LEG_FAT_BURNING_EXERCISE", withExtension: "json") {
                let data = try Data(contentsOf: file)
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                var listExreturn: [exerciseModel] = [exerciseModel]()
                if let dict = json as? [Dictionary<String,AnyObject>] {
                    for item in dict {
                        var dataEx: exerciseModel = exerciseModel()
                        dataEx = dataEx.initLoad(item)
                        listExreturn.append(dataEx)
                    }
                    closure(listExreturn, nil)
                }
            }
        } catch {
            print(error.localizedDescription)
            closure(nil, nil)
        }
        closure(nil, nil)
    }
    
    func plan_HIP_EXERCISE(closure: @escaping (_ response: [exerciseModel]?, _ error: Error?) -> Void) {
        do {
            if let file = Bundle.main.url(forResource: "plan_HIP_EXERCISE", withExtension: "json") {
                let data = try Data(contentsOf: file)
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                var listExreturn: [exerciseModel] = [exerciseModel]()
                if let dict = json as? [Dictionary<String,AnyObject>] {
                    for item in dict {
                        var dataEx: exerciseModel = exerciseModel()
                        dataEx = dataEx.initLoad(item)
                        listExreturn.append(dataEx)
                    }
                    closure(listExreturn, nil)
                }
            }
        } catch {
            print(error.localizedDescription)
            closure(nil, nil)
        }
        closure(nil, nil)
    }
    
    func plan_default(closure: @escaping (_ response: [planModel]?, _ error: Error?) -> Void) {
        do {
            if let file = Bundle.main.url(forResource: "plan_default", withExtension: "json") {
                let data = try Data(contentsOf: file)
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                var listPlanReturn: [planModel] = [planModel]()
                if let dict = json as? [Dictionary<String,AnyObject>] {
                    for item in dict {
                        var dataPlan = planModel()
                        dataPlan = dataPlan.initLoad(item)
                        listPlanReturn.append(dataPlan)
                    }
                    closure(listPlanReturn, nil)
                }
            }
        } catch {
            print(error.localizedDescription)
            closure(nil, nil)
        }
        closure(nil, nil)
    }
    
}
