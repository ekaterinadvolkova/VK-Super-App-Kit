//
//  ViewController.swift
//  VK-Super-App-Kit-2022
//
//  Created by Ekaterina Volkova on 27/03/2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var table: UITableView!
    
    var models = [CellContent]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Register 1 cell
        table.register(DarkMatterTableViewCell.nib(), forCellReuseIdentifier: DarkMatterTableViewCell.identifier)
        
        table?.delegate = self
        table?.dataSource = self
    }
    
    //Table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    // Get data from a file and convert to models
    func getData(){
        //validate file exists
        
        //convert data to models
        var fileData: CellContent?
        do {
            
        }
        catch {
            
        }
        
        //update user interface
        
    }
    
}

struct CellContent {
    let timeAndIndicator: String
}

