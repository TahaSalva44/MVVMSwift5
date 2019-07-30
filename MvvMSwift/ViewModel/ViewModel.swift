//
//  ViewModel.swift
//  MvvMSwift
//
//  Created by LCWAIKIKI on 30.07.2019.
//  Copyright © 2019 Taha. All rights reserved.
//

import Foundation

class ViewModel : NSObject {
    
    var namePass : String?
    var lastNamePass : String?
    var agePass : Int?
    var urlPass : String?
    
    
    @IBOutlet weak var fetchData: FetchData!
    
    
    var studentsDict = [String:[Student]]()
    var allGroupNames = [String]()
    
    
    func fetchStudents(completion: @escaping () -> () ) {
        fetchData?.fetchStudents { students in
            
            self.studentsDict = students
            self.allGroupNames = Array(self.studentsDict.keys).sorted()
            
            completion()
        }
    }
    
    
    func titleForHeaderInSection (_ section: Int) -> String {
        return allGroupNames[section]
    }
    
    
    
    func numberOfRowInSection (_ section:Int) -> Int {
        let sectionName = allGroupNames[section]
        let arrayStuds = studentsDict[sectionName]
        
        return arrayStuds?.count ?? 0
    }
    
    
    func getStudent(_ cell:CellDefault, forRowAtIndexPath indexPath:IndexPath) -> Student {
        let sectionName = allGroupNames[indexPath.section]
        let arrayStuds = studentsDict[sectionName]
        
        let stud = arrayStuds![indexPath.row]
        
        return stud
    }
    
    
    
    
}
