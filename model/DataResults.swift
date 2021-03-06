//
//  DataResults.swift
//  MyNewLook
//
//  Created by 이민지 on 2022/02/12.
//

import Foundation
import RealmSwift

class DataResults: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var date: String = ""
    @objc dynamic var check: String = ""
    @objc dynamic var count: Int = 0
    
    convenience init(name: String, date: String,check: String, count: Int) {
        self.init()
        self.name = name
        self.date = date
        self.check = check
        self.count = count
    }
}
