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
        
        //get file path
        let path = Bundle.main.path(forResource: "TestData1.json", ofType: nil)
    
        //convert data to models
        loadJson(filename: "TestData1")
        
        //update user interface
    }
    
    func loadJson(filename fileName: String) -> [CellContent]? {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode([CellContent].self, from: data)
                return jsonData
            } catch {
                print("error:\(error)")
            }
        }
        return nil
    }
}

struct CellContent: Decodable {
    let date: String
    let time: String
    let alphanumeric: Int
}



