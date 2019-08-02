//
//  HeroeDetailViewModel.swift
//  MarvelApp
//
//  Created by Renato Matos de Paula on 31/07/19.
//  Copyright © 2019 Renato Matos de Paula. All rights reserved.
//

import Foundation

class HeroeDetailViewModel {
    private let model: Heroe
    
    var title: String {
        return name
    }
    
    var name: String {
        return model.name ?? ""
    }
    
    var thumb: String {
        guard let thumb = model.thumbnail, let path = thumb.path, let ext = thumb.extension else {
            return ""
        }
        return "\(path).\(ext)"
    }
    
    var comics: [Heroe.Cases.Items] {
        guard let comics = model.comics else { return [] }
        return comics.items ?? []
    }
    
    var events: [Heroe.Cases.Items] {
        guard let events = model.events else { return [] }
        return events.items ?? []
    }
    
    var stories: [Heroe.Cases.Items] {
        guard let stories = model.stories else { return [] }
        return stories.items ?? []
    }
    
    var series: [Heroe.Cases.Items] {
        guard let series = model.series else { return [] }
        return series.items ?? []
    }
    
    private var sections: [CollectionViewSection] = []
    
    init(with model: Heroe) {
        self.model = model
    }
    
    //MARK: Bindings
    var updateSections: ((_ sections: [CollectionViewSection]) -> Void)? {
        didSet {
            configSections()
        }
    }
    
    //MARK: Config
    private func configSections() {
        let header = HeroeDetailViewViewModel((name: name, image: thumb))
        sections.append(CollectionViewSection(items: [header]))
        
        let comicsSection = HeroeCasesFactory.getCasesFactory(title: "Comics", items: comics)
        sections.append(contentsOf: comicsSection)
        
        let eventsSection = HeroeCasesFactory.getCasesFactory(title: "Events", items: events)
        sections.append(contentsOf: eventsSection)
        
        let storiesSection = HeroeCasesFactory.getCasesFactory(title: "Stories", items: stories)
        sections.append(contentsOf: storiesSection)
        
        let seriesSection = HeroeCasesFactory.getCasesFactory(title: "Series", items: series)
        sections.append(contentsOf: seriesSection)
        
        updateSections?(sections)
    }
}
