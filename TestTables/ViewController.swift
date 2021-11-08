//
//  ViewController.swift
//  TestTables
//
//  Created by Vincent Cubit on 11/8/21.
//


import UIKit


// Can also extend UITableViewDelegate & UITableViewDataSource on ViewController up here
class ViewController: UIViewController {
    
    
    @IBOutlet weak var proficiencySegement: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    
    
    // The color that each cell's text will be
    private var selectedProficiencyColor: UIColor = .systemBlue
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Set your table view's delegate and dataSource to this class
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        
    }


}


// The tableView's delegate and dataSource in your ViewController
extension ViewController: UITableViewDelegate {
    
    
    // There will be the count of your array's items in this table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return proficiencies.count
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 62
    }
    
    
}


extension ViewController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        // Match the cell ID for indexPath of the table
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        
        // Set text of each row to be the matching index in your array
        cell.textLabel?.text = proficiencies[indexPath.row]
        
        
        // Set the color to your class variable for segemented color
        cell.textLabel?.textColor = self.selectedProficiencyColor
        
        
        return cell
        
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Makes it so when you select a row it does not stay selected
        tableView.deselectRow(at: indexPath, animated: true)
    
        
        // Grab a reference of each cell from the tableView
        let cell = tableView.cellForRow(at: indexPath)
        
        
        // If normal selected, label
        // If double, orange
        switch self.proficiencySegement.selectedSegmentIndex {
        
        
        case 0:
            self.selectedProficiencyColor = .label
        default:
            self.selectedProficiencyColor = .systemOrange
            
            
        }
        
        
        // If the cell's text is label or orange, change it to blue to deselect
        if cell?.textLabel?.textColor == UIColor.label
            || cell?.textLabel?.textColor == UIColor.systemOrange {
            self.selectedProficiencyColor = .systemBlue
        }
        
        
        // Reload the selected rows to update color
        tableView.reloadRows(at: [indexPath], with: .automatic)
        
        
    }
    
    
}

