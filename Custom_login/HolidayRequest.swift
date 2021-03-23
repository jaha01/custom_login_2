//
//  HolidayRequest.swift
//  Test
//
//  Created by Dimka Novikov on 16.02.2021.
//

import Foundation

enum HolidayError: Error{
    case noDataAvailable
    case canNotProcessData
}

struct HolidayRequest {
    let resourceURL: URL
    let API_KEY = "99bf6e4e64dbdebd0bbb763fc5888fd7e241bab5"
    
    init(countryCode: String) {
        let date = Date()
        let format = DateFormatter()
        format.dateFormat = "yyyy"
        let currentYear = format.string(from: date)
        
        let resourseString = "https://calendarific.com/api/v2/holidays?api_key=\(self.API_KEY)&country=\(countryCode)&year=\(currentYear)"
        
        guard let resourceURL = URL(string: resourseString) else {
            fatalError("Error getting URL from String")
        }
        
        self.resourceURL = resourceURL
        
    }
    
    
    public func getHolidays(with completion: @escaping (Result<[HolidayDetail], HolidayError>) -> ()) {
        
        DispatchQueue.main.async {
            
            URLSession.shared.dataTask(with: self.resourceURL) { data, _, _ in
                
                if let jsonData = data {
                    do {
                        let holidayResponse = try JSONDecoder().decode(HolidayResponse.self, from: jsonData)
                        completion(.success(holidayResponse.response.holiday))
                    } catch {
                        completion(.failure(.canNotProcessData))
                    }
                } else {
                    completion(.failure(.canNotProcessData))
                }
                
                
            }.resume()
            
        }
        
    }
}

