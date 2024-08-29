//
//  EditTaskViewController.swift
//  ToDo list
//
//  Created by Mikhail Ustyantsev on 29.08.2024.
//  
//

import UIKit

class EditTaskViewController: UIViewController {
    
    
    // MARK: - Properties
    var presenter: ViewToPresenterEditTaskProtocol?
    var output: EditTodoEventHandler?
    let task: Todo
    
    let textView: UITextView = {
        let textView = UITextView()
        textView.layer.borderWidth = 2
        textView.layer.borderColor = Constants.Color.purpleIntense.cgColor
        textView.layer.cornerRadius = 10
        textView.backgroundColor = .secondarySystemBackground
        textView.font = Constants.Fonts.montserratMedium(with: 20)
        textView.textContainer.lineFragmentPadding = 0
        textView.textContainerInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        return textView
    }()
    
    let updateTaskButton: UIButton = {
        let button = UIButton(configuration: .filled())
        button.configuration?.baseBackgroundColor = Constants.Color.purpleIntense
        button.configuration?.baseForegroundColor = .white
        button.configuration?.title = Constants.String.update
        button.configuration?.cornerStyle = .large
        
        return button
    }()
    
    lazy var margins = view.safeAreaLayoutGuide
    
    init(task: Todo) {
        self.task = task
        super.init(nibName: nil, bundle: nil)
    }
    
    
    required init?(coder: NSCoder) {
        NSCoder.fatalErrorNotImplemented()
    }
    
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureTextView()
        configureUpdateButton()
    }
    
    
    private func configureViewController() {
        title = Constants.String.editTask
        view.backgroundColor = Constants.Color.background
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(closeTapped))
    }
    
    
    @objc private func closeTapped() {
        output?.cancelEditTaskClicked()
    }
    
    
    @objc private func updateTaskTapped() {
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
        output?.editTaskFinished(newText: textView.text, oldText: task.todo)
    }
    
    
    private func configureTextView() {
        view.addView(textView)
        
        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: margins.topAnchor, constant: 50),
            textView.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 10),
            textView.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -10),
            textView.heightAnchor.constraint(equalTo: margins.heightAnchor, multiplier: 0.25)
        ])
        textView.backgroundColor = Constants.Color.background
        textView.becomeFirstResponder()
        textView.insertText(task.todo)
    }
    
    
    private func configureUpdateButton() {
        view.addView(updateTaskButton)
        
        NSLayoutConstraint.activate([
            updateTaskButton.topAnchor.constraint(equalTo: textView.bottomAnchor, constant: 50),
            updateTaskButton.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 10),
            updateTaskButton.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -10),
            updateTaskButton.heightAnchor.constraint(equalToConstant: 55)
        ])
        updateTaskButton.addTarget(self, action: #selector(updateTaskTapped), for: .touchUpInside)
    }
}

extension EditTaskViewController: PresenterToViewEditTaskProtocol {
    
    // MARK: Implement View Output Methods
    func editTaskSuccess() {
        let hudView = SuccessHud.hud(inView: view, animated: true)
        hudView.text = "Updated"
        afterDelay(1.5) {
            hudView.hide()
        }
    }
    
    
    func editTaskFailed(message: String) {
        
    }
    
    
    
}
