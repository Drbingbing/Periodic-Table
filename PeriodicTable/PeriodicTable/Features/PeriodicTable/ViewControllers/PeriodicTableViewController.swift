//
//  PeriodicTableViewController.swift
//  PeriodicTable
//
//  Created by 鍾秉辰 on 2023/10/13.
//

import UIKit
import IGListKit

class PeriodicTableViewController: UIViewController {
    
    lazy var adapter = ListAdapter(updater: ListAdapterUpdater(), viewController: self)
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    let useCase = PeriodicTableUseCase()
    
    var sort: PeriodicTableSort = .byTable {
        didSet {
            collectionView.setCollectionViewLayout(createLayout(), animated: true)
            adapter.performUpdates(animated: true)
        }
    }
    
    override func bindingUI() {
        view.addSubview(collectionView)
        adapter.collectionView = collectionView
        adapter.dataSource = self
        
        navigationItem.title = "元素週期表"
        
        let menu = UIMenu(
            children: [
                UIAction(title: "依週期表排序") { [weak self] _ in self?.sort = .byTable },
                UIAction(title: "依族排序") { [weak self] _ in self?.sort = .byGroup },
                UIAction(title: "依週期排序") { [weak self] _ in self?.sort = .byPeriod },
                UIAction(title: "依原子序排序") { [weak self] _ in self?.sort = .byAtomicNumber },
            ]
        )
        navigationItem.setRightBarButton(UIBarButtonItem(image: UIImage(systemName: "list.dash"), menu: menu), animated: false)
        
        collectionView.setCollectionViewLayout(createLayout(), animated: false)
        collectionView.alwaysBounceHorizontal = false
        collectionView.alwaysBounceVertical = false
        collectionView.delaysContentTouches = false
        collectionView.showsHorizontalScrollIndicator = false
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds.inset(by: view.safeAreaInsets)
    }
    
    override func bindingStyle() {
        view.backgroundColor = .primaryBackground
        collectionView.backgroundColor = .clear
    }
    
    func createLayout() -> UICollectionViewLayout {
        switch sort {
        case .byTable:
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                 heightDimension: .fractionalHeight(1.0))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)

            let groupSize = NSCollectionLayoutSize(widthDimension: .estimated(64 * 18 + 72),
                                                   heightDimension: .estimated(700))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

            let section = NSCollectionLayoutSection(group: group)

            return UICollectionViewCompositionalLayout(section: section)
        default:
            return UICollectionViewFlowLayout()
        }
    }
}

extension PeriodicTableViewController: ListAdapterDataSource {
    
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        switch sort {
        case .byTable:
            return ["table"].map { $0 as ListDiffable }
        default:
            return useCase.retrieveElements(by: sort)
        }
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        switch object {
        case is String:
            return PeriodicTableSectionController()
        default:
            return PeriodicTableSortSectionController(sort: sort)
        }
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
}
