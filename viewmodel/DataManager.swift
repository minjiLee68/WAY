//
//  DataManager.swift
//  MyNewLook
//
//  Created by 이민지 on 2022/02/16.
//

import UIKit
import RealmSwift

class DataManager {
    static let shared = DataManager()
    
    var realm: Realm
    var result: Results<DataResults>?
    
    var data1: DataResults?
    var data2: DataResults?
    var data3: DataResults?
    
    private init() {
        realm = try! Realm()
        result = realm.objects(DataResults.self)
    }
 
    func realmData(check: String, name: String, date: String, count: Int) {
        if let data1 = realm.objects(DataResults.self)
            .filter(NSPredicate(format: "name = %@ AND date = %@", name, date))
            .first {
            testCode(data1, check, count)
        } else {
            try! self.realm.write {
                let mainData = self.contents(name: name, date: date, check: check, count: count)
                self.realm.add(mainData)
                print("\(Realm.Configuration.defaultConfiguration.fileURL!)")
            }
        }
    }
    
    func testCode(_ data1 : DataResults, _ check : String, _ count: Int){
        try! realm.write {
            data1.check = check
            if check == "false" {
                data1.count -= 1
            } else {
                data1.count += 1
            }
        }
    }
    
    
    
    func countDB(count: Int) {
        UserDefaults.standard.set(count, forKey: "count")
    }
    
    func countDBSet(key defaultName: String) -> Int? {
        let count = UserDefaults.standard.integer(forKey: defaultName)
        return count
    }

    func contents(name: String, date: String, check: String, count: Int) -> DataResults {
        let content = DataResults()
        content.name = name
        content.date = date
        content.check = check
        content.count = count
        return content
    }
}
