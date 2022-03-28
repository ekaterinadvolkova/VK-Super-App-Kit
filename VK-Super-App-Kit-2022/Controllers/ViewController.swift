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
        
        // Register cell
        table.register(DarkMatterTableViewCell.nib(), forCellReuseIdentifier: DarkMatterTableViewCell.identifier)
        
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
        let cell = tableView.dequeueReusableCell(withIdentifier: DarkMatterTableViewCell.identifier, for: indexPath) as! DarkMatterTableViewCell
        
         cell.configure(with: models[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
    
    // Get data from a file and convert to models
    func getData(){
        
        //convert data to models
        models = loadJson(filename: "TestData1")!
        
        //update user interface
        DispatchQueue.main.async {
            self.table.reloadData()
        }
    }
    
    
    //function to decode json
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
    
    //temperature value with key "alphanumeric" because fake data generator offered only this key availavle for free
    let alphanumeric: Int
}
