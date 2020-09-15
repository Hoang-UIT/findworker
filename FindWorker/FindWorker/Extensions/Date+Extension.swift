//
//  Date+Extension.swift
//  FindWorker
//
//  Created by hoangtp on 9/9/20.
//  Copyright © 2020 Rakumo. All rights reserved.
//

import Foundation

extension Date {
    
    static func stringToDate(_ dateString: String, _ dateFormat: String ) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        return dateFormatter.date(from: dateString)
    }
    
    func toString(_ dateFormat  : String ) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        return dateFormatter.string(from: self)
    }
}
