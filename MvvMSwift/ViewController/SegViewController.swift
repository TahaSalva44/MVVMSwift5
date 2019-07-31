//
//  SegViewController.swift
//  MvvMSwift
//
//  Created by LCWAIKIKI on 31.07.2019.
//  Copyright © 2019 Taha. All rights reserved.
//

import UIKit

class SegViewController: UIViewController {

    
    @IBOutlet var segViewModel: SegViewModel!
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.allowsSelection = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
    }
    
}


extension SegViewController : UITableViewDelegate,UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         guard let cell = tableView.dequeueReusableCell(withIdentifier: "CellDirection", for: indexPath) as? CellDirection else { return UITableViewCell() }
        
        cell.setupCell(withStudent: SegViewModel.student)
        
        
            return cell
    }
    
    
}
