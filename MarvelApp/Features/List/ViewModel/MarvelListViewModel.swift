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
    
    private var sections: [CollectionViewSection] = [] {
        didSet {
            updateSections?(sections)
        }
    }
    
    var updateSections: ((_ sections: [CollectionViewSection]) -> Void)?
    
    func fetchHeroes() {
        let list = JSONHelper.getObjectFrom(json: "heroesList", type: HeroeList.self)
        self.model = list
//        HeroeList.request(with: HeroesRouter.list, onSuccess: { (result) in
//            if case let .asSelf(model) = result {
//                self.model = model
//            }
//        }, onError: { (error) in
//
//        })
    }
    
    private func configSections() {
        guard let model = self.model, let list = model.results else {
            sections = []
            return
        }
        
        let viewModelItems = list.map { HeroeListViewModel($0) }
        sections = [CollectionViewSection(items: viewModelItems)]
    }
}
