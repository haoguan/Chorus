//
//  ChoresStatus.swift
//  Chorus
//
//  Created by Hao Guan on 8/28/18.
//  Copyright © 2018 Hao Guan. All rights reserved.
//

import UIKit

class ChoresStatus: UIView {
    
    var bubbles: [UIView] = []
    let taskBubbleCount = 10
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let angleIncrement = (2 * .pi) / Double(taskBubbleCount)
        let radius = 50.0
        
        for _ in 0..<taskBubbleCount {
            let bubble = TaskBubble(frame: CGRect(x: 0, y: 0, width: 10, height: 10), style: .red)
            addSubview(bubble)
            NSLayoutConstraint.activate([
                bubble.centerXAnchor.constraint(equalTo: centerXAnchor),
                bubble.centerYAnchor.constraint(equalTo: centerYAnchor),
                bubble.widthAnchor.constraint(equalTo: bubble.heightAnchor),
                bubble.widthAnchor.constraint(equalToConstant: 10)
            ])
            bubbles.append(bubble)
        }
        
        UIView.animate(withDuration: 1.0) {
            for (idx, bubble) in self.bubbles.enumerated() {
                let translateX = cos(angleIncrement * Double(idx)) * radius
                let translateY = sin(angleIncrement * Double(idx)) * radius
                bubble.transform = CGAffineTransform(translationX: CGFloat(translateX), y: CGFloat(translateY))
            }
        }
    }
}
