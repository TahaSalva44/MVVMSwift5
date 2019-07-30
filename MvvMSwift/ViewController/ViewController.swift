//
//  ViewController.swift
//  MvvMSwift
//
//  Created by LCWAIKIKI on 29.07.2019.
//  Copyright © 2019 Taha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet var viewModel: ViewModel!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        viewModel.fetchStudents {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
        tableView.dataSource = self
        tableView.delegate = self
        
    }


}

extension ViewController : UITableViewDataSource,UITableViewDelegate {
    
    //MARK : - UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.studentsDict.keys.count
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel.titleForHeaderInSection(section)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  viewModel.numberOfRowInSection(section)
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CellDefault", for: indexPath) as? CellDefault else { return UITableViewCell() }
        
        let stud = viewModel.getStudent(cell, forRowAtIndexPath: indexPath) // getStudent
        cell.setupCell(withStudent: stud) //setAttributesForCell
        
        return cell
    }
}

