//
//  DropDownView.swift
//  Practice
//
//  Created by Berkin Sili on 24.11.2019.
//  Copyright © 2019 Berkin Sili. All rights reserved.
//

import UIKit

protocol DropDownContainerProtocol {
    func getOptions() -> [String]
    func setSelected(index: Int)
}

class DropDownView: UIView {
    
    let tableView = UITableView()
    var delegate: DropDownContainerProtocol?
    var optionList: [String] = []
    
    struct TableCellConstants {
        static let nibName = "DropDownTVC"
        static let identifier = "OptionCellIdentifier"
    }
    
    func configureDropDownMenu(){
        //TODO: remove force unwrapping and handle error gracefully here
        optionList = delegate!.getOptions()
        setupTableView()
    }
    
    func setupTableView() {
        tableView.register(UINib(nibName: TableCellConstants.nibName, bundle: nil), forCellReuseIdentifier: TableCellConstants.identifier)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        self.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        tableView.reloadData()
    }
}
extension DropDownView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate?.setSelected(index: indexPath.row)
    }
}
extension DropDownView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return optionList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultCell") as! DropDownTVC
        let optionLabel = self.optionList[indexPath.row]
        
        cell.configure(text: optionLabel)
        return cell
    }
}
