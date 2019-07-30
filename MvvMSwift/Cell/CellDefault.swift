//
//  CellDefault.swift
//  MvvMSwift
//
//  Created by LCWAIKIKI on 30.07.2019.
//  Copyright © 2019 Taha. All rights reserved.
//

import UIKit

class CellDefault: UITableViewCell {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var lastName: UILabel!
    
    
    func setupCell(withStudent student : Student){
        self.name.text = student.firstName
        self.lastName.text = student.lastName
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
