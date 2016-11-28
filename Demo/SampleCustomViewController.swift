//
//  SampleCustomViewController.swift
//  Demo
//
//  Created by James Avakian on 11/15/16.
//  Copyright © 2016 Optical Automation, LLC. All rights reserved.
//

import UIKit
import PullToDismiss

class SampleCustomViewController: UIViewController {
    private var pullToDismiss: PullToDismiss?
    @IBOutlet private weak var coverView: UIView!
    @IBOutlet private weak var tableView: UITableView!
    
    fileprivate lazy var dataSource: [String] = { () -> [String] in
        return (0..<50).map { "Item : \($0)" }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "Cell")
        pullToDismiss = PullToDismiss(scrollView: tableView, viewController: self, navigationBar: coverView)
        Config.shared.adaptSetting(pullToDismiss: pullToDismiss)
        tableView.dataSource = self
        pullToDismiss?.delegateProxy = self
    }
    
    @IBAction func close(_: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension SampleCustomViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = dataSource[indexPath.row]
        return cell
    }
}

extension SampleCustomViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let alert = UIAlertController(title: "test", message: "\(indexPath.section)-\(indexPath.row) touch!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
