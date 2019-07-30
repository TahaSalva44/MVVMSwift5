//
//  FetchData.swift
//  MvvMSwift
//
//  Created by LCWAIKIKI on 30.07.2019.
//  Copyright © 2019 Taha. All rights reserved.
//

import Foundation

class FetchData: NSObject,Codable {
    
    var studentsDict = [String:[Student]]()
    
    func fetchStudents(completion: @escaping ([String:[Student]]) -> ()){
        
        let urlFromStr = URL(string:"https://my-json-server.typicode.com/arivvelluck/JSON/allStudents")
        
        guard let url = urlFromStr else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {return}
            
            if let students = try? JSONDecoder().decode([Student].self, from: data){
                for stud in students {
                    if !self.studentsDict.keys.contains(stud.groupName){
                        self.studentsDict[stud.groupName] = [Student]()
                    }
                    self.studentsDict[stud.groupName]?.append(stud)
                }
                
                completion(self.studentsDict)
            }
        }.resume()
        
        
        
        
    }
    
}
