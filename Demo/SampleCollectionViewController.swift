//
//  SampleCollectionViewController.swift
//  Demo
//
//  Created by James Avakian on 11/15/16.
//  Copyright © 2016 Optical Automation, LLC. All rights reserved.
//

import UIKit
import PullToDismiss

private let reuseIdentifier = "Cell"

class SampleCollectionViewController: UICollectionViewController {

    private var pullToDismiss: PullToDismiss?

    override func loadView() {
        super.loadView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        navigationItem.title = "Sample Table View"
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = .orange
        navigationController?.navigationBar.setValue(UIBarPosition.topAttached.rawValue, forKey: "barPosition")
        pullToDismiss = PullToDismiss(scrollView: collectionView!)
        Config.shared.adaptSetting(pullToDismiss: pullToDismiss)
        pullToDismiss?.delegateProxy = self
        view.backgroundColor = .white
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        let r = CGFloat(arc4random_uniform(100)) / 100.0
        let g = CGFloat(arc4random_uniform(100)) / 100.0
        let b = CGFloat(arc4random_uniform(100)) / 100.0
        cell.backgroundColor = UIColor(red: r, green: g, blue: b, alpha: 1.0)
        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let alert = UIAlertController(title: "test", message: "\(indexPath.section)-\(indexPath.item) touch!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

}
