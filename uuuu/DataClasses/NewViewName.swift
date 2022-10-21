//
//  NewViewName.swift
//  uuuu
//
//  Created by Евгения Аникина on 29.07.2022.
//

import Foundation

struct NewViewName: Equatable {

    static func == (lhs: NewViewName, rhs: NewViewName) -> Bool {
        return lhs.id == rhs.id
    }

    var id: String?
    var name: String?

    init() {

    }

    init(id: String,
         name: String,
    ) {
        self.id = id
        self.name = name
    }

    init(object: [String: Any]) {
        id = String.pjs(object["id"])
        name = String.pjs(object["name"])
    }

    func getJSONforCreating() -> String {
        var nameArr = [String: Any]()
        nameArr["name"] = name
        nameArr["id"] = id

        return DataHelper.dictionaryToJson(dict: nameArr)
    }
    
    func getJSONforUpdating() -> String {
        var nameArr = [String: Any]()
        nameArr["name"] = name
        nameArr["id"] = id
        
        print("name \(nameArr)")

        return DataHelper.dictionaryToJson(dict: nameArr)
    }
    
    static func compareListsWithNewViewName(firstArr: [NewViewName], secondArr: [NewViewName]) -> ([NewViewName], [NewViewName]) {
        var newUserCSList:[NewViewName] = [NewViewName]()
        var oldUserCSList:[NewViewName] = [NewViewName]()

        firstArr.forEach { item in
            var found = false
            secondArr.forEach { itemUserCS2 in
                if item == itemUserCS2 {
                    found = true
                }
            }
            if found {
                oldUserCSList.append(item)
            } else {
                newUserCSList.append(item)
            }
        }
        return (newUserCSList, oldUserCSList)
    }

}

enum NewViewNameRole: String, CaseIterable {
    case admin = "ADMIN"
    case member = "MEMBER"
    case guest = "GUEST"
    case owner = "OWNER"
}
