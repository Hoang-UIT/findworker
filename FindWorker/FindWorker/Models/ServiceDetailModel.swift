//
//  ServiceDetailModel.swift
//  FindWorker
//
//  Created by hoangtp on 9/16/20.
//  Copyright © 2020 Rakumo. All rights reserved.
//

import RealmSwift

class ServiceDetailModel: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var serviceId: Int = 0
    @objc dynamic var name: String? = nil
    @objc dynamic var icon: String? = nil
    @objc dynamic var isSelected: Bool = false
    
    convenience init(_ id: Int, _ name: String?, _ icon: String?) {
        self.init()
        self.id = id
        self.name = name
        self.icon = icon
    }
    
    override class func primaryKey() -> String? {
        return "id"
    }
}
