//
//  Category.swift
//  TodoDMD
//
//  Created by Dennis Dwarte on 23/7/19.
//  Copyright © 2019 Dennis Dwarte. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var colour: String = ""
    let items = List<Item>()
    
    
}
