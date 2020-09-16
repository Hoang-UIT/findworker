//
//  OrderModel.swift
//  FindWorker
//
//  Created by hoangtp on 9/10/20.
//  Copyright © 2020 Rakumo. All rights reserved.
//

import UIKit
import RealmSwift

class OrderModel: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var userId: Int = 0
    dynamic var status = StatusOrder.status_1
    var services = List<ServiceDetailModel>()
    
    
    convenience init(_ id: Int) {
        self.init()
        self.id = id
    }
    
    override class func primaryKey() -> String? {
        return "id"
    }
    
    class func getOrder()-> OrderModel? {
        do {
            let realm = try Realm()
            if let order = (realm.objects(OrderModel.self).filter{$0.status == .status_1}).first {
                return order
            } else {
                let order = OrderModel(1)
                try realm.write {
                    realm.add(order)
                }
                return order
            }
        } catch {
            print(error.localizedDescription)
        }
        return nil
    }
    
    func addServiceDetail(model: ServiceDetailModel) {
        do {
            let realm = try Realm()
            try realm.write {
                self.services.append(model)
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func removeServiceDetail(model: ServiceDetailModel) {
        if let index = services.index(of: model) {
            services.remove(at: index)
        }
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(self, update: .modified)
            }
            
        } catch {
            print(error.localizedDescription)
        }
    }
}
