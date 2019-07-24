//
//  Item.swift
//  TodoDMD
//
//  Created by Dennis Dwarte on 23/7/19.
//  Copyright © 2019 Dennis Dwarte. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var done: Bool = false
    @objc dynamic var dateCreated: Date?
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
    
}
