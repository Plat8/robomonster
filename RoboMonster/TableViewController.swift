//
//  ViewController.swift
//  RoboMonster
//
//  Created by Platon on 07.09.2022.
//

import UIKit

class TableViewController: UITableViewController , UISearchBarDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        updateInterface()
        
    }

    var robots = [Robot(name: "Monster", type: .Robot),
                  Robot(name: "Alien", type: .Face),
                  Robot(name: "Predator", type: .Kitten),
                  Robot(name: "Drone", type: .Robot)]
                  
    var filteredRobots = [Robot]()
    

    @IBOutlet weak var searchBar: UISearchBar!
    
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredRobots.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView .dequeueReusableCell(withIdentifier: "roboCell")
        
        if let cell = cell {
            var config = cell.defaultContentConfiguration() // *
            config.text = filteredRobots[indexPath.row].name
            config.secondaryText = filteredRobots[indexPath.row].type.description
                cell.contentConfiguration = config
            return cell
        }
        
        return UITableViewCell()
    }
    

    
                  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var index = self.tableView.indexPathForSelectedRow?.row
        
        if let index = index, index != NSNotFound, index > -1 {
            let detailViewController = segue.destination as! RobotViewController
            detailViewController.robot = filteredRobots[index]
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

        updateInterface()
        
    }
    
    @IBAction func createNewPush(_ sender: Any) {
        
        let alert = UIAlertController(title: "New Robot", message: "Type New Robot Name", preferredStyle: .alert)
        
        
        alert.addTextField()
        
        weak var weakSelf = self
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
            let text = alert.textFields?.first?.text
            if let text = text, !text.isEmpty
            {
                weakSelf!.robots.append(Robot(name: text, type: .Monster))
                weakSelf!.updateInterface()
            }
            
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        present(alert, animated: true)
    }
    
    func updateInterface()
    {
        let searchText = searchBar.text!
        
        filteredRobots = searchText.isEmpty ? robots : robots.filter{($0.name.lowercased().contains(searchText.lowercased()))}

        tableView.reloadData()
        
    }
    
    
}
