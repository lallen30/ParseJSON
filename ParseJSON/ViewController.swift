//
//  ViewController.swift
//  ParseJSON
//
//  Created by Larry Allen on 8/9/21.
//

import UIKit

class ViewController: UIViewController {
    
    
    // Tutorial: https://www.youtube.com/watch?v=ih20QtEVCa0&list=WL&index=1&t=204s

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        guard let path = Bundle.main.path(forResource: "usersAPI", ofType: "txt") else {return}
        //print(path ?? "Path not found")
        let url = URL(fileURLWithPath: path)
        do {
            let data = try Data(contentsOf: url)
            let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
            // print(json)
            
            guard let array = json as? [Any] else {return}
            
            for user in array {
                guard let userDict = user as? [String: Any] else {return}
                guard let userId = userDict["id"] as? Int else { print("id is not an int"); return}
                guard let name = userDict["name"] as? String else {return}
                guard let company = userDict["company"] as? [String: String] else {return}
                guard let companyName = company["name"] else {return}
                
                if(String(userId) == "10") {
                print(userId)
                print(name)
                print(companyName)
                }
                
            }
        } catch {
            print(error)
        }
        
        
    }


}

