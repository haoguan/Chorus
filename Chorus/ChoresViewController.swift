//
//  ChoresViewController.swift
//  Chorus
//
//  Created by Hao Guan on 8/19/18.
//  Copyright © 2018 Hao Guan. All rights reserved.
//

import UIKit

class ChoresViewController: UIViewController {
    @IBOutlet weak var choresTableView: UITableView! {
        didSet {
            choresTableView.estimatedRowHeight = 50.0
            choresTableView.rowHeight = UITableView.automaticDimension
            choresTableView.dataSource = self
            choresTableView.delegate = self
            choresTableView.separatorStyle = .none
        }
    }
}

extension ChoresViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ChoresCell") as? ChoresCell else { return UITableViewCell() }
        cell.label.text = "My Task"
        return cell
    }
}

extension ChoresViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.alpha = 0
        let animator = UIViewPropertyAnimator(duration: 1.0, curve: .easeInOut) {
            cell.layer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
            cell.transform = CGAffineTransform(translationX: -50, y: 0)
        }
        let delay = Double(indexPath.row) * 0.05
        animator.startAnimation(afterDelay: delay)
        
        let alphaAnimator = UIViewPropertyAnimator(duration: 1.0, controlPoint1: CGPoint(x: 1.35, y: 0.3), controlPoint2: CGPoint(x: 0.35, y: 0.8)) {
            cell.alpha = 0.8
        }
        alphaAnimator.startAnimation(afterDelay: delay)
    }
}
