//
//  UICollectionViewCompositionalLayout+Layouts.swift
//  iOSPlantManager
//
//  Created by joaovitor on 17/02/22.
//

import UIKit

struct ElementKind {
    static let sectionHeader = "section-header-element-kind"
}

extension UICollectionViewCompositionalLayout {
    static func `default`() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { section, _ in
            switch section {
            case 0:
                return .staticSection()
            case 1:
                return .carouselSection()
            default:
                return .defaultSection()
            }
        }
    }
}

extension NSCollectionLayoutSection {
    static func staticSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(100))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(100))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(top: 0, leading: 32, bottom: 0, trailing: 32)
        
        return section
    }
    
    static func carouselSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(76), heightDimension: .absolute(40))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(40))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.interItemSpacing = .flexible(4)
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = .init(top: 0, leading: 32, bottom: 0, trailing: 0)
        
        let sectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(80))
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: sectionHeaderSize,
                                                                        elementKind: ElementKind.sectionHeader,
                                                                        alignment: .top)
        
        section.boundarySupplementaryItems = [sectionHeader]
        
        return section
    }
    
    static func defaultSection() -> NSCollectionLayoutSection {
        let itemCellSize = calculateCellSize()
        let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(itemCellSize), heightDimension: .absolute(itemCellSize))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
         
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(0.5))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.interItemSpacing = .fixed(12)
        group.edgeSpacing = .init(leading: nil, top: nil, trailing: nil, bottom: .fixed(12))
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(top: 32, leading: 32, bottom: 32, trailing: 32)
        
        return section
    }
    
    private static func calculateCellSize() -> CGFloat {
        let width = UIScreen.main.bounds.width
        return (width - 76) / 2
    }
}
