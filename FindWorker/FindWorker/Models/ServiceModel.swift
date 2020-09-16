//
//  ServiceModel.swift
//  FindWorker
//
//  Created by hoangtp on 9/16/20.
//  Copyright © 2020 Rakumo. All rights reserved.
//

import RealmSwift
import Realm
class ServiceModel: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String? = nil
    @objc dynamic var icon: String? = nil
    @objc dynamic var isSelected: Bool = false
    var listServiceDetail = List<ServiceDetailModel>()

    override class func primaryKey() -> String? {
        return "id"
    }
    
    convenience init(_ id: Int, _ name: String?, _ icon: String?) {
        self.init()
        self.id = id
        self.name = name
        self.icon = icon
        
        for index in 1...10 {
            let item = ServiceDetailModel((id * 100) + index, "\(name ?? "") \(index)", nil)
            item.serviceId = id
            listServiceDetail.append(item)
        }
    }

}
