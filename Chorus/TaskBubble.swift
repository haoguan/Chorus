//
//  TaskBubble.swift
//  Chorus
//
//  Created by Hao Guan on 8/29/18.
//  Copyright © 2018 Hao Guan. All rights reserved.
//

import UIKit

class TaskBubble: UIView {
    
    enum Style {
        case red
        case yellow
        case blue
        
        var fromColor: CGColor {
            switch self {
            case .red:
                return UIColor(hexString: "#ea638cff")!.cgColor
            case .yellow:
                return UIColor(hexString: "#f2c956ff")!.cgColor
            case .blue:
                return UIColor(hexString: "#7b8beeff")!.cgColor
            }
        }
        
        var toColor: CGColor {
            switch self {
            case .red:
                return UIColor(hexString: "#e5483dff")!.cgColor
            case .yellow:
                return UIColor(hexString: "#f1c44fff")!.cgColor
            case .blue:
                return UIColor(hexString: "#4b5ee2ff")!.cgColor
            }
        }
    }
    
    init(width: CGFloat, style: Style) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = width / 2
        
        guard let gradient = layer as? CAGradientLayer else { return }
        gradient.colors = [style.fromColor, style.toColor]
        gradient.startPoint = CGPoint(x: 0.1, y: 0)
        gradient.endPoint = CGPoint(x: 0.9, y: 1)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override class var layerClass : AnyClass {
        return CAGradientLayer.self
    }
}
