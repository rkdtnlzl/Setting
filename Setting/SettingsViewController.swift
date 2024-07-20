//
//  ViewController.swift
//  Setting
//
//  Created by 강석호 on 7/20/24.
//

import UIKit

class SettingsViewController: BaseViewController {
    
    private var collectionView: UICollectionView!
    private var dataSource: UICollectionViewDiffableDataSource<Section, SettingItem>!
    
    let allSettingList = [SettingItem(title: "공지사항"), SettingItem(title: "실험실"), SettingItem(title: "버전 정보")]
    let privateSettingList = [SettingItem(title: "개인/보안"), SettingItem(title: "알림"), SettingItem(title: "채팅")]
    let etc = [SettingItem(title: "고객센터/도움말")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        configureDataSource()
        applySnapshot()
    }
    
    private func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        view.addSubview(collectionView)
    }
    
    private func createLayout() -> UICollectionViewLayout {
        var configuration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        configuration.headerMode = .supplementary
        return UICollectionViewCompositionalLayout.list(using: configuration)
    }
    
    private func configureDataSource() {
        let cellRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, SettingItem> { cell, indexPath, item in
            var content = cell.defaultContentConfiguration()
            content.text = item.title
            cell.contentConfiguration = content
        }
        
        let headerRegistration = UICollectionView.SupplementaryRegistration<UICollectionViewListCell>(elementKind: UICollectionView.elementKindSectionHeader) { supplementaryView, elementKind, indexPath in
            var content = supplementaryView.defaultContentConfiguration()
            content.text = Section.allCases[indexPath.section].rawValue
            supplementaryView.contentConfiguration = content
        }
        
        dataSource = UICollectionViewDiffableDataSource<Section, SettingItem>(collectionView: collectionView) { (collectionView, indexPath, item) -> UICollectionViewCell? in
            collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: item)
        }
        
        dataSource.supplementaryViewProvider = { (view, kind, indexPath) in
            return self.collectionView.dequeueConfiguredReusableSupplementary(using: headerRegistration, for: indexPath)
        }
    }
    
    private func applySnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, SettingItem>()
        
        snapshot.appendSections([.allSettings])
        snapshot.appendItems(allSettingList, toSection: .allSettings)
        
        snapshot.appendSections([.privateSettings])
        snapshot.appendItems(privateSettingList, toSection: .privateSettings)
        
        snapshot.appendSections([.etcSettings])
        snapshot.appendItems(etc, toSection: .etcSettings)
        
        dataSource.apply(snapshot, animatingDifferences: false)
    }
}
