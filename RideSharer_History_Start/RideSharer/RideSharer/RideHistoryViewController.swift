//
//  RideHistoryViewController.swift
//  RideSharer
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate
{
    let rideHistory = [("Driver: Joe, 12/29/2021", "$26.50"),
                           ("Driver: Sandra, 01/03/2022", "$13.10"),
                           ("Driver: Hank, 01/11/2022", "$16.20"),
                           ("Driver: Michelle, 01/19/2022", "$8.50")]
    
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.rideHistory.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell",for: indexPath)
        
        cell.textLabel?.text =
            self.rideHistory[indexPath.row].0
        
        return cell
        
    }
    
    //Alert
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let alertTitle = "Price of this trip"
        let message = "The Price in USD: \(self.rideHistory[indexPath.row].1)"
        let alert=UIAlertController(title: alertTitle, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert,animated: true,completion: nil)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.register(UITableViewCell.self,
                               forCellReuseIdentifier: "TableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
    }
}

