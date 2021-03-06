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
    
    private var firebaseClient: FirebaseClient = FirebaseClient()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigationBar()
    }
    
    // MARK: - Segues
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let vc = (segue.destination as? DetailViewController)!
                vc.firebaseClient = firebaseClient
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
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
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
    
    private func setUpNavigationBar() {
        let navigationTitleFont = UIFont(name: "KFhimaji", size: 24)!
        self.navigationController?.navigationBar.titleTextAttributes = [
            NSFontAttributeName: navigationTitleFont,
            NSForegroundColorAttributeName: UIColor.white
        ]
        let backButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        backButtonItem.tintColor = UIColor.white
        navigationItem.backBarButtonItem = backButtonItem
    }
    
    @IBAction func tappedAddButton(_ sender: UIBarButtonItem) {
        channels.insert(UUID.init().uuidString, at: 0)
        let indexPath = IndexPath(row: 0, section: 0)
        self.tableView.insertRows(at: [indexPath], with: .automatic)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let roomViewController = RoomViewController.instantiate()
        navigationController?.pushViewController(roomViewController, animated: true)
        roomViewController.firebaseClient = firebaseClient
        roomViewController.channelName = channels[indexPath.row]
    }
}
