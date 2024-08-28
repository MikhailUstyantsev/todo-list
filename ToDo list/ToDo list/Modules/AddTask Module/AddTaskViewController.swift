//
//  AddTaskViewController.swift
//  ToDo list
//
//  Created by Mikhail Ustyantsev on 27.08.2024.
//
//

import UIKit

final class AddTaskViewController: UIViewController {
    
    // MARK: - Properties
    weak var presenter: ViewToPresenterAddTaskProtocol?
    let textView: UITextView = {
        let textView = UITextView()
        textView.layer.borderWidth = 2
        textView.layer.borderColor = Constants.Color.purpleIntense.cgColor
        textView.layer.cornerRadius = 10
        textView.backgroundColor = .secondarySystemBackground
        textView.font = Constants.Fonts.montserratMedium(with: 20)
        textView.textContainer.lineFragmentPadding = 10
        textView.textContainerInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        return textView
    }()
    let addTaskButton: UIButton = {
        let button = UIButton(configuration: .filled())
        button.configuration?.baseBackgroundColor = Constants.Color.purpleIntense
        button.configuration?.baseForegroundColor = .white
        button.configuration?.title = Constants.String.add
        button.configuration?.cornerStyle = .large
        
        return button
    }()
    lazy var margins = view.safeAreaLayoutGuide
    
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureTextView()
        configureAddButton()
    }
    
    
    private func configureViewController() {
        title = Constants.String.addNewTask
        view.backgroundColor = Constants.Color.background
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(closeTapped))
        textView.delegate = self
    }
    
    
    @objc private func closeTapped() {
        presenter?.cancelTaskClicked()
    }
    
    
    @objc private func addTaskTapped() {
        guard !textView.text.isEmpty else {
            Utilities.showAlert(
                strTitle: Constants.String.error,
                strMessage: Constants.String.fillOutTheForm,
                parent: self,
                OKButtonTitle: nil,
                CancelButtonTitle: nil,
                okBlock: nil,
                cancelBlock: nil
            )
            return
        }
        presenter?.addTaskClicked(with: textView.text)
    }
    
    
    private func configureTextView() {
        view.addView(textView)
        
        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: margins.topAnchor, constant: 50),
            textView.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 10),
            textView.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -10),
            textView.heightAnchor.constraint(equalTo: margins.heightAnchor, multiplier: 0.3)
        ])
        textView.backgroundColor = Constants.Color.background
        textView.becomeFirstResponder()
    }
    
    
    private func configureAddButton() {
        view.addView(addTaskButton)
        
        NSLayoutConstraint.activate([
            addTaskButton.topAnchor.constraint(equalTo: textView.bottomAnchor, constant: 50),
            addTaskButton.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 10),
            addTaskButton.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -10),
            addTaskButton.heightAnchor.constraint(equalToConstant: 55)
        ])
        addTaskButton.addTarget(self, action: #selector(addTaskTapped), for: .touchUpInside)
    }
    
    
    deinit {
        print("deinit from AddTaskViewController")
    }
}

extension AddTaskViewController: PresenterToViewAddTaskProtocol{
    // TODO: Implement View Output Methods
}


extension AddTaskViewController: UITextViewDelegate {
    
}
