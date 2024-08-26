//
//  TaskCollectionViewCell.swift
//  ToDo list
//
//  Created by Mikhail Ustyantsev on 25.08.2024.
//

import UIKit
import M13Checkbox

class TaskCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Properties
    let roundedCornerView = UIView()
    let checkBox: M13Checkbox = {
        let checkBox = M13Checkbox()
        checkBox.heightAnchor.constraint(equalToConstant: 35).isActive = true
        checkBox.widthAnchor.constraint(equalToConstant: 35).isActive = true
        checkBox.stateChangeAnimation = .fill
        checkBox.tintColor = Constants.Color.pink
        checkBox.boxLineWidth = 2
        
        return checkBox
    }()
    let taskLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.Fonts.montserratMedium(with: 16)
        label.numberOfLines = 0
        label.textColor = .label
        
        return label
    }()
    let stack: UIStackView = {
        let stack = UIStackView()
        
        return stack
    }()
    
    var task: Todo? {
        didSet {
            switch checkBox.checkState {
            case .unchecked:
                taskLabel.text = task?.todo
            case .checked:
                taskLabel.attributedText = strikeText(strike: task?.todo ?? "unknown")
            case .mixed:
                break
            }
            
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupHierarchy()
        constraintViews()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("Interface Builder is not supported!")
    }
    
    
    private func setupViews() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        roundedCornerView.backgroundColor = .secondarySystemBackground
        
        roundedCornerView.layer.masksToBounds = false
        roundedCornerView.layer.shadowOpacity = 0.23
        roundedCornerView.layer.shadowRadius = 4
        roundedCornerView.layer.shadowOffset = .zero
        roundedCornerView.layer.shadowColor = UIColor.black.cgColor
        
        checkBox.addTarget(self, action: #selector(tapOnCheckbox), for: .valueChanged)
    }
    
    
    @objc private func tapOnCheckbox() {
        if checkBox.checkState == .checked {
            taskLabel.attributedText = strikeText(strike: task?.todo ?? "unknown")
        } else {
            taskLabel.attributedText = NSAttributedString(string: task?.todo ?? "unknown")
        }
    }
    
    
    func strikeText(strike: String) -> NSMutableAttributedString {
        
        let attributeString = NSMutableAttributedString(string: strike)
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle,
                                     value: NSUnderlineStyle.single.rawValue,
                                     range: NSMakeRange(0, attributeString.length))
        
        return attributeString
    }
    
    
    private func  setupHierarchy() {
        contentView.addView(roundedCornerView)
        roundedCornerView.addView(taskLabel)
        roundedCornerView.addView(checkBox)
    }
    
    
    private func constraintViews() {
        let offset: CGFloat = 20
        NSLayoutConstraint.activate([
            roundedCornerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            roundedCornerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            roundedCornerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            roundedCornerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            taskLabel.topAnchor.constraint(equalTo: roundedCornerView.topAnchor, constant: offset),
            taskLabel.leadingAnchor.constraint(equalTo: roundedCornerView.leadingAnchor, constant: offset),
            taskLabel.trailingAnchor.constraint(equalTo: checkBox.leadingAnchor, constant: -offset),
            taskLabel.bottomAnchor.constraint(equalTo: roundedCornerView.bottomAnchor, constant: -offset),
            
            checkBox.trailingAnchor.constraint(equalTo: roundedCornerView.trailingAnchor, constant: -offset),
            checkBox.centerYAnchor.constraint(equalTo: taskLabel.centerYAnchor)
        ])
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        roundedCornerView.layer.cornerRadius = contentView.bounds.size.height / 2
    }
    
}
