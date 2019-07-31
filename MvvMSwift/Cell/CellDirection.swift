//
//  CellDirection.swift
//  MvvMSwift
//
//  Created by LCWAIKIKI on 31.07.2019.
//  Copyright © 2019 Taha. All rights reserved.
//

import UIKit

class CellDirection: CellDefault {
    
    
    @IBOutlet weak var age: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    override func setupCell(withStudent student: Student) {
        super.setupCell(withStudent: student)
        self.age.text = "\(student.age)"
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
