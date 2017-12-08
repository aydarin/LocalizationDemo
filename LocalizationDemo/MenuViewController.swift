//
//  MenuViewController.swift
//  LocalizationDemo
//
//  Created by Aydar Mukhametzyanov on 12/8/17.
//  Copyright © 2017 Aydar Mukhametzyanov. All rights reserved.
//

import UIKit

struct MenuItem {
    let title: String
    let segueIdentifier: String
}

class MenuViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    
    private let items = [MenuItem(title: "Plurals", segueIdentifier: "plurals"),
                         MenuItem(title: "Adaptive strings", segueIdentifier: "adaptive"),
                         MenuItem(title: "Combined strings", segueIdentifier: "combined")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tableView.reloadData()
    }
}

extension MenuViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        performSegue(withIdentifier: items[indexPath.row].segueIdentifier, sender: nil)
    }
}

extension MenuViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let string = items[indexPath.row].title as NSString
        cell.textLabel?.text = string as String
        return cell
    }
    
}
