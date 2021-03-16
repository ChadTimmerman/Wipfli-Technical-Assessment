//
//  Label.swift
//  wipfli-tech-assessment
//
//  Created by Chad Timmerman on 3/16/21.
//

import UIKit

enum LabelStyle {
    case light
    case regular
    case bold
}

class Label: UILabel {
    
    init(style: LabelStyle) {
        super.init(frame: .zero)
        
        switch style {
        case .light:
            font = UIFont.systemFont(ofSize: 12, weight: .light)
        case .regular:
            font = UIFont.systemFont(ofSize: 14, weight: .regular)
        case .bold:
            font = UIFont.systemFont(ofSize: 16, weight: .bold)
        }
        
        applyStyling()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func applyStyling() {
        textColor = .black
    }
    
}
