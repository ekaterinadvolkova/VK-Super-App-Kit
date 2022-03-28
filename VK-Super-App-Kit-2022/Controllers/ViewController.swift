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
    
    func createTableHeader() -> UIView{
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height/10))
        
        //background color for header
        headerView.backgroundColor = .white
        
        
        //add frames
        var dateLabel = UILabel(frame: CGRect(x: -30, y: 10, width: view.frame.size.width/3, height: headerView.frame.size.height))
        
        var timeLabel = UILabel(frame: CGRect(x: 130, y: 10, width: view.frame.size.width/3, height: headerView.frame.size.height))
        
        var tempLabel = UILabel(frame: CGRect(x: 250, y: 10, width: view.frame.size.width/3, height: headerView.frame.size.height))
        
        //add subviews
        headerView.addSubview(dateLabel)
        headerView.addSubview(timeLabel)
        headerView.addSubview(tempLabel)
        
        //make header text centered
        dateLabel.textAlignment = .center
        timeLabel.textAlignment = .center
        tempLabel.textAlignment = .right
        
        //add text to header secrions
        dateLabel.text = "Date"
        timeLabel.text = "Time"
        tempLabel.text = "Temperature"
        
        //add fonts
        dateLabel.font = UIFont(name: "Helvetica-Bold", size: 20)
        timeLabel.font = UIFont(name: "Helvetica-Bold", size: 20)
        tempLabel.font = UIFont(name: "Helvetica-Bold", size: 20)
        
        return headerView
    }
    
    // Get data from a file and convert to models
    func getData(){
        
        //convert data to models
        models = loadJson(filename: "TestData1")!
        
        //update user interface
        DispatchQueue.main.async {
            self.table.reloadData()
            self.table.tableHeaderView = self.createTableHeader()
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
