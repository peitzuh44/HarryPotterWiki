//
//  WizardListVC.swift
//  HarryPotterWiki
//
//  Created by Pei-Tzu Huang on 2024/9/18.
//
import UIKit

class WizardListVC: UIViewController {
    
    var tableView = UITableView()
    var students: [Student] = []
    
    struct Cells {
        static let wizardCell = "WizardCell"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Hogwarts Student"
        fetchStudentData()
        configureTableView()
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        setTableViewDelegates()
        tableView.rowHeight = 100
        tableView.register(StudentCell.self, forCellReuseIdentifier: Cells.wizardCell)
        tableView.pin(to: view)
    }
    
    func setTableViewDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
  

}

extension WizardListVC: UITableViewDelegate, UITableViewDataSource {
    
    // How many rows to show in a section?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }
    
    //
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.wizardCell) as! StudentCell
        let student = students[indexPath.row]
        cell.set(student: student)
        return cell
    }
    
    
}

extension WizardListVC {
    
    // MARK: API fetching
    func fetchStudentData() {
        
        // make sure that there's and URL
        guard let url = URL(string: "https://hp-api.onrender.com/api/characters/students") else {
            return
        }
        
        // This function will return data, response or error
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Error fetchin students: \(error)")
                return
            }
            
            // make that there's data
            guard let data = data else { return }
            
            do {
                let students = try JSONDecoder().decode([Student].self , from: data)
                DispatchQueue.main.async {
                    self.students = students
                    self.tableView.reloadData()
                }
            } catch let error {
                print("Failed to decode JSON \(error)")
            }
                
        }
        .resume()
        
        
    }
    
}


struct Student: Codable {
    let id: String
    let name: String
    let house: String
    let image: String?
    
    enum CodingKeys: String, CodingKey {
        case id, name, house, image
    }
}

struct WizardImage {
    static let harryPotter = UIImage(named: "harry-potter")!
    static let ronWeasley = UIImage(named: "ron-weasley")!
    static let hermioneGranger = UIImage(named: "hermione-granger")!
}
