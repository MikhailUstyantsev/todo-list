//
//  TodoListViewController.swift
//  ToDo list
//
//  Created by Mikhail Ustyantsev on 25.08.2024.
//
//

import UIKit

class TodoListViewController: UIViewController {
    
    enum Section {
        case main
    }
    
    
    //MARK: - Properties
    typealias DataSource = UICollectionViewDiffableDataSource<Section, Todo>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Section, Todo>
    var presenter: ViewToPresenterTodoListProtocol?
    private lazy var collectionView: UICollectionView = {
        let collection = UICollectionView(
            frame: .zero,
            collectionViewLayout: generateLayout())
        return collection
    }()
    private lazy var collectionDataSource = makeDataSource()
    let addNewTaskButton = AddNewTaskButton(backgroundColor: Constants.Color.purpleIntense, foregroundColor: .white)
    private lazy var margins = view.safeAreaLayoutGuide
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureCollectionView()
        configureAddNewTaskButton()
        presenter?.startFetchingTodoList()
    }
    
    
    private func configureViewController() {
        title = Constants.String.homeScreenTitle
        view.backgroundColor = Constants.Color.background
    }
    
    
    private func configureCollectionView() {
        view.addView(collectionView)
        collectionView.register(
            TaskCollectionViewCell.self,
            forCellWithReuseIdentifier: String(describing: TaskCollectionViewCell.self))
        collectionView.delegate = self
      
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: margins.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: margins.bottomAnchor)
        ])
        collectionView.backgroundColor = Constants.Color.background
    }
    
    
    private func configureAddNewTaskButton() {
        view.addSubview(addNewTaskButton)
        NSLayoutConstraint.activate([
            addNewTaskButton.centerXAnchor.constraint(equalTo: margins.centerXAnchor),
            addNewTaskButton.heightAnchor.constraint(equalToConstant: 60),
            addNewTaskButton.widthAnchor.constraint(equalTo: addNewTaskButton.heightAnchor),
            addNewTaskButton.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: -10)
        ])
    }
    
    
    private func generateLayout() -> UICollectionViewLayout {
        let inset: CGFloat = 10
        
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .estimated(60))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .estimated(60))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 15
        section.contentInsets = NSDirectionalEdgeInsets(top: inset, leading: inset, bottom: inset, trailing: inset)
        return UICollectionViewCompositionalLayout(section: section)
    }
    
    
    // MARK: - DataSource methods
    private func makeDataSource() -> DataSource {
        let dataSource = DataSource(
            collectionView: collectionView,
            cellProvider: { (collectionView, indexPath, item) ->
                UICollectionViewCell? in
                
                let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: String(describing: TaskCollectionViewCell.self),
                    for: indexPath) as? TaskCollectionViewCell
                cell?.task = item
                cell?.delegate = self
                return cell
            })
        return dataSource
    }
    
    
    private func applySnapshot(with items: [Todo], animatingDifferences: Bool = true) {
        var snapshot = Snapshot()
        snapshot.appendSections([.main])
        snapshot.appendItems(items)
        collectionDataSource.apply(snapshot, animatingDifferences: animatingDifferences)
    }
}

extension TodoListViewController: PresenterToViewTodoListProtocol {
    // MARK: - Implementing View Output Methods
    
    func refreshList() {
        
    }
    
    
    func showTodoList(todoArray: [Todo]) {
        DispatchQueue.main.async { [weak self] in
            self?.applySnapshot(with: todoArray)
        }
    }
    
    
    func showError() {
        
    }
}


extension TodoListViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let item = collectionDataSource.itemIdentifier(for: indexPath) else { return }
        print(item.todo)
    }
    
}


extension TodoListViewController: TaskCollectionViewCellDelegate {
    
    func updateTaskListWith(_ task: Todo?) {
        let updated = presenter?.todoArray.map { $0.todo == task?.todo ? task : $0 } as? [Todo]
        presenter?.todoArray = updated ?? []
        presenter?.updatePersistense()
    }
}
    

