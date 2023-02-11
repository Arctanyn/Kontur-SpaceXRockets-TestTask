//
//  CompositionalLayoutHelper.swift
//  Kontur-TestTask
//
//  Created by Малиль Дугулюбгов on 11.02.2023.
//

import UIKit

struct CompositionalLayoutHelper {
    enum GroupAlignment {
        case horizontal
        case vertical
    }
    
    //MARK: - Methods
    
    static func createItem(widthDimension: NSCollectionLayoutDimension,
                           heightDimention: NSCollectionLayoutDimension,
                           contentInsets: NSDirectionalEdgeInsets = .zero) -> NSCollectionLayoutItem {
        let item = NSCollectionLayoutItem(
            layoutSize: .init(widthDimension: widthDimension, heightDimension: heightDimention)
        )
        item.contentInsets = contentInsets
        return item
    }
    
    static func createGroup(alignment: GroupAlignment,
                            widthDimension: NSCollectionLayoutDimension,
                            heightDimention: NSCollectionLayoutDimension,
                            subitems: [NSCollectionLayoutItem],
                            contentInsets: NSDirectionalEdgeInsets = .zero,
                            interItemSpacing: NSCollectionLayoutSpacing? = nil) -> NSCollectionLayoutGroup {
        var group: NSCollectionLayoutGroup!
        switch alignment {
        case .horizontal:
            group = NSCollectionLayoutGroup.horizontal(
                layoutSize: .init(
                    widthDimension: widthDimension,
                    heightDimension: heightDimention
                ),
                subitems: subitems
            )
        case .vertical:
            group = NSCollectionLayoutGroup.vertical(
                layoutSize: .init(
                    widthDimension: widthDimension,
                    heightDimension: heightDimention
                ),
                subitems: subitems
            )
        }
        group.interItemSpacing = interItemSpacing
        group.contentInsets = contentInsets
        return group
    }
    
    static func createSection(group: NSCollectionLayoutGroup,
                              scrollingBehavior: UICollectionLayoutSectionOrthogonalScrollingBehavior = .none,
                              interGroupSpacing: CGFloat = 0,
                              contentInsets: NSDirectionalEdgeInsets = .zero) -> NSCollectionLayoutSection {
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = scrollingBehavior
        section.interGroupSpacing = interGroupSpacing
        section.contentInsets = contentInsets
        return section
    }
}
