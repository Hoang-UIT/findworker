//
//  Service.swift
//  FindWorker
//
//  Created by hoangtp on 8/21/20.
//  Copyright © 2020 Rakumo. All rights reserved.
//

import Foundation

class ServiceModel: NSObject {
    var id: Int?
    var name: String?
    var icon: String?
    var isSelected: Bool = false
    var listServiceDetail = [ServiceDetailModel]()
    
    init(_ id: Int?, _ name: String?, _ icon: String?) {
        self.id = id
        self.name = name
        self.icon = icon
        
        for index in 1...10 {
            let item = ServiceDetailModel(index, "\(name ?? "") \(index)", nil)
            item.serviceId = id
            listServiceDetail.append(item)
        }
    }
}

class ServiceDetailModel: NSObject {
    var id: Int?
    var serviceId: Int?
    var name: String?
    var icon: String?
    var isSelected: Bool = false
    
    init(_ id: Int?, _ name: String?, _ icon: String?) {
        self.id = id
        self.name = name
        self.icon = icon
    }
}
