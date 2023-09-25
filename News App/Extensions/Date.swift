//
//  Date.swift
//  News App
//
//  Created by Evgeny on 24.09.23.
//

import Foundation


extension String {
    
    func convertDateString() -> String? {
            return convert(dateString: self, fromDateFormat: "yyyy-MM-dd'T'HH:mm:ssZ", toDateFormat: "MMM d, y")
        }


        func convert(dateString: String, fromDateFormat: String, toDateFormat: String) -> String? {

            let fromDateFormatter = DateFormatter()
            fromDateFormatter.dateFormat = fromDateFormat

            if let fromDateObject = fromDateFormatter.date(from: dateString) {

                let toDateFormatter = DateFormatter()
                toDateFormatter.dateFormat = toDateFormat

                let newDateString = toDateFormatter.string(from: fromDateObject)
                return newDateString
            }

            return nil
        }
}
