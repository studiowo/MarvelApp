//
//  MarvelListViewModel.swift
//  MarvelApp
//
//  Created by Renato Matos de Paula on 30/07/19.
//  Copyright © 2019 Renato Matos de Paula. All rights reserved.
//

import Foundation

protocol ViewModelAccess {}

class MarvelListViewModel {
    weak var view: ViewConfiguration?
    
    private var isLoading = false
    
    var title: String {
        return "Marvel Heroes"
    }
    
    private var model: HeroeList? {
        didSet {
            configSections()
        }
    }
    
    convenience init(with model: HeroeList) {
        self.init()
        self.model = model
    }
    
    func getModel<T: ViewModelAccess>(_ : T) -> HeroeList? {
        return self.model
    }
    
    private var sections: [CollectionViewSection] = [CollectionViewSection(items: [])]
    
    //MARK: Bindings
    var updateSections: ((_ sections: [CollectionViewSection], _ offset: Int, _ limit: Int, _ totalItens: Int) -> Void)?
    
    //MARK: Config
    private func configSections() {
        guard let model = self.model,
            let total = model.total,
            let limit = model.limit,
            let offset = model.offset,
            let list = model.results?.dropFirst(offset) else {
            sections = []
            return
        }
        
        let viewModelItems = list.map {
            HeroeListViewViewModel((name: $0.name ?? "", image: "\(String(describing: $0.thumbnail?.path ?? "")).\(String(describing: $0.thumbnail?.extension ?? ""))"))
        }
        sections[0].items.append(contentsOf: viewModelItems)
        updateSections?(sections, offset, limit, total)
    }
    
    //MARK: API
    func fetchHeroes() {
        self.isLoading = true
        
        HeroeData.request(with: HeroesRouter.list, onSuccess: { [weak self] result in
            guard let self = self else { return }
            
            if case let .asSelf(model) = result, let data = model.data {
                self.model = data
                self.isLoading = false
            }
        }, onError: { (error) in
            print(error)
            self.isLoading = false
        })
    }
    
    func loadMoreHeroes() {
        guard !isLoading else { return }
        self.isLoading = true
        
        guard let model = self.model,
            let offset = model.offset,
            let limit = model.limit else { return }
        
        HeroeData.request(with: HeroesRouter.loadMore(offset: offset + limit), onSuccess: { [weak self] result in
            guard let self = self else { return }
            
            if case let .asSelf(model) = result, let data = model.data {
                self.model?.addResults(data.results ?? [])
                self.isLoading = false
            }
        }, onError: { (error) in
            print(error)
            self.isLoading = false
        })
    }
}
