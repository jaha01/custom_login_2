//
//  Holiday.swift
//  Custom_login
//
//  Created by Jahongir on 2/15/21.
//  Copyright © 2021 Jahongir. All rights reserved.
//

import Foundation


struct HolidayResponse: Decodable {
    var response:  Holidays
    
}

struct Holidays: Decodable {
    var holiday:  [HolidayDetail]
    
}

struct HolidayDetail: Decodable {
    var name: String
    var date: DateInfo
    
}

struct DateInfo: Decodable {
    var  iso:  String
    
}
