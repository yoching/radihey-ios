//
//  ListViewController.swift
//  radihey
//
//  Created by syamaoka on 2017/03/03.
//  Copyright © 2017年 syamaoka. All rights reserved.
//

import UIKit

class ListViewController: UITableViewController {
    var channels = ["A channel","B channel","C channel"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Segues
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let vc = (segue.destination as? DetailViewController)!
                print(channels[indexPath.row])
                vc.channelName = channels[indexPath.row]
            }
        }
    }
    
    // MARK: - Table View
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return channels.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel!.text = channels[indexPath.row]
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tappedAddButton(_ sender: UIBarButtonItem) {
        channels.insert(UUID.init().uuidString, at: 0)
        let indexPath = IndexPath(row: 0, section: 0)
        self.tableView.insertRows(at: [indexPath], with: .automatic)
    }
}
