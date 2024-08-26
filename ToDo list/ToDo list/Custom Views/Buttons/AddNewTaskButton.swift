//
//  AddNewTaskButton.swift
//  ToDo list
//
//  Created by Mikhail Ustyantsev on 26.08.2024.
//

import UIKit

class AddNewTaskButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        NSCoder.fatalErrorNotImplemented()
    }
    
    
    convenience init(backgroundColor: UIColor, foregroundColor: UIColor, systemImageName: String = "plus") {
        self.init(frame: .zero)
        set(backgroundColor: backgroundColor, foregroundColor: foregroundColor, systemImageName: systemImageName)
    }
    
    
    private func configure() {
        
        configuration              = .filled()
        configuration?.cornerStyle = .capsule
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    func set(backgroundColor: UIColor, foregroundColor: UIColor, systemImageName: String) {
        configuration?.baseBackgroundColor = backgroundColor
        configuration?.baseForegroundColor = foregroundColor
        configuration?.image            = UIImage(systemName: systemImageName)
    }

}
