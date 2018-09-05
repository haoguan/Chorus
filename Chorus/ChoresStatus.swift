//
//  ChoresStatus.swift
//  Chorus
//
//  Created by Hao Guan on 8/28/18.
//  Copyright © 2018 Hao Guan. All rights reserved.
//

import UIKit

class ChoresStatus: UIView {
    
    @IBOutlet weak var statusStackView: UIStackView! {
        didSet {
            statusStackView.alpha = 0
        }
    }
    
    var bubbles: [UIView] = []
    let taskBubbleCount = 10
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        for _ in 0..<taskBubbleCount {
            let bubble = TaskBubble(width: 10, style: .red)
            addSubview(bubble)
            NSLayoutConstraint.activate([
                bubble.centerXAnchor.constraint(equalTo: centerXAnchor),
                bubble.centerYAnchor.constraint(equalTo: centerYAnchor),
                bubble.widthAnchor.constraint(equalTo: bubble.heightAnchor),
                bubble.widthAnchor.constraint(equalToConstant: 10)
            ])
            bubbles.append(bubble)
        }
        
        animateStatusView()
        animateTaskBubbles()
    }
}

// MARK: - Animation helpers
extension ChoresStatus {
    func animateStatusView() {
        let animator = UIViewPropertyAnimator(duration: 1.5, curve: .easeInOut) { [weak self] in
            self?.statusStackView.alpha = 1.0
        }
        animator.startAnimation()
    }
    
    func animateTaskBubbles() {
        let provider = UISpringTimingParameters(mass: 1.0, stiffness: 2, damping: 4.0, initialVelocity: CGVector(dx: 2.0, dy: 2.0))
        let animator = UIViewPropertyAnimator(duration: 0.75, timingParameters: provider)
        
        animator.addAnimations { [weak self] in
            guard let strongSelf = self else { return }
            let angleIncrement = (2 * .pi) / Double(strongSelf.taskBubbleCount)
            let radius = 60.0
            
            for (idx, bubble) in strongSelf.bubbles.enumerated() {
                let translateX = cos(angleIncrement * Double(idx)) * radius
                let translateY = sin(angleIncrement * Double(idx)) * radius
                bubble.transform = CGAffineTransform(translationX: CGFloat(translateX), y: CGFloat(translateY))
            }
        }
        animator.startAnimation(afterDelay: 0.25)
    }
}
