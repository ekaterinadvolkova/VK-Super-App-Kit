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
        
        // Register 3 cells
        table.register(DateTableViewCell.nib(), forCellReuseIdentifier: DateTableViewCell.identifier)
        table.register(TimeTableViewCell.nib(), forCellReuseIdentifier: TimeTableViewCell.identifier)
        table.register(TemperatureTableViewCell.nib(), forCellReuseIdentifier: TemperatureTableViewCell.identifier)
        
        table?.delegate = self
        table?.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool){
            super.viewDidAppear(animated)
            getData()
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
        
        //validate that file exists
        let path = Bundle.main.path(forResource: "TestData1.json", ofType: nil)
        guard let data = path else {
            print("something went wrong")
            return
        }
        
        //convert data to models
        //update user interface
    }
}

struct CellContent: Codable {
    let date: String
    let time: String
    let temperature: Int
}

