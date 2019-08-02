//
//  HeroeCasesFactory.swift
//  MarvelApp
//
//  Created by Renato Matos de Paula on 02/08/19.
//  Copyright © 2019 Renato Matos de Paula. All rights reserved.
//

import Foundation

struct HeroeCasesFactory {
    static func getCasesFactory(title: String, items: [Heroe.Cases.Items]) -> [CollectionViewSection] {
        guard items.count > 0 else { return [] }
        
        var sections: [CollectionViewSection] = []
        
        let headerComics = HeroeHeaderViewViewModel(title)
        sections.append(CollectionViewSection(items: [headerComics]))
        
        let items: [HeroeDetailCaseViewViewModel] = items.map {
            HeroeDetailCaseViewViewModel((name: $0.name ?? "", image: $0.resourceURI ?? ""))
            }.dropLast(items.count < 3 ? 0 : items.count - 3)
        
        let itemSection: CollectionViewSection = CollectionViewSection(items: items)
        let source: CollectionViewSource = CollectionViewSource(sections: [itemSection])
        
        let viewModel: CollectionViewModel = CollectionViewModel(source)
        let comicsSection: CollectionViewSection = CollectionViewSection(items: [viewModel])
        
        sections.append(comicsSection)
        
        return sections
    }
}
