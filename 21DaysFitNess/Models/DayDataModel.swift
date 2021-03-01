//
//  Days.swift
//  21DaysFitNess
//
//  Created by Nguyen Vu on 04/02/2021.
//

import Foundation
class DayDataModel: NSObject {
    var actionId: Int = 0
    var time: Int = 0
    func initLoad(_ json:  [String: Any]) -> DayDataModel{
        if let temp = json["actionId"] as? Int { actionId = temp }
        if let temp = json["time"] as? Int { time = temp }
        return self
    }
}


class exerciseModel: NSObject {
    var name: String = ""
    var listEx: [DayDataModel] =  [DayDataModel]()
    func initLoad(_ json:  [String: Any]) -> exerciseModel{
        if let temp = json["name"] as? String { name = temp }
        if let temp = json["exercise"] as? [[String: Any]] {
            for item in temp{
                var sonitem:DayDataModel = DayDataModel()
                sonitem = sonitem.initLoad(item)
                listEx.append(sonitem)
            }
        }
        return self
    }
}

