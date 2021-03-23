//
//  IosAcademyViewController.swift
//  Custom_login
//
//  Created by Jahongir on 2/18/21.
//  Copyright © 2021 Jahongir. All rights reserved.
//

import UIKit

class IosAcademyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let url = "https://api.sunrise-sunset.org/json?date=2021-02-18&lat=-74.0060&lng=40.7128&formatted=0"
        getData(from: url)
    }

    
}




struct Response: Codable {
    let result: MyResult?
    let status: String?
}

struct MyResult: Codable {
    let sunrise: String
    let sunset: String
    let solar_noon: String
    let day_lenght: Int
    let civil_twilight_begin: String
    let civil_twilight_end: String
    let nautical_twilight_begin: String
    let nautical_twilight_end: String
    let astronomical_twilight_begin: String
    let astronomical_twilight_end: String
    
}


extension UIViewController{
    
    func getData(from url: String){
      let   task =  URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { data, response, error in
          
            guard let data = data, error == nil else {
                print("somthing went wrong")
                return
            }
            
            var result: Response?
            do {
                result = try JSONDecoder().decode(Response.self, from: data)
            }
            catch {
                print("failed to convert\(error.localizedDescription)")
            }
            guard let json = result else {
                return
            }
        print(json.status!)
        print(json.result?.sunrise)
        print("!!!!!!!!!!!!!!!!!!!!!!!!")

            })
        task.resume()
    }
}
