//
//  PlanData.swift
//  21DaysFitNess
//
//  Created by Nguyen Vu on 01/03/2021.
//

import Foundation

class planModel: NSObject {
    var pic_path: String = ""
    var tts_text: String = ""
    var task_name: String = ""
    var task_type: String = ""
    var tts_advice: String = ""
    var tts_speed: String = ""
    var task_mode: String = ""
    var duration: Int = 0
    var id: Int = 0
    
    func initLoad(_ json:  [String: Any]) -> planModel{
        if let temp = json["pic_path"] as? String { pic_path = temp }
        if let temp = json["tts_text"] as? String { tts_text = temp }
        if let temp = json["task_name"] as? String { task_name = temp }
        if let temp = json["task_type"] as? String { task_type = temp }
        if let temp = json["tts_advice"] as? String { tts_advice = temp }
        if let temp = json["tts_speed"] as? String { tts_speed = temp }
        if let temp = json["task_mode"] as? String { task_mode = temp }
        if let temp = json["duration"] as? Int { duration = temp }
        if let temp = json["id"] as? Int { id = temp }
        return self
    }
}
