//
//  MainViewController.swift
//  MarvelApp
//
//  Created by Renato Matos de Paula on 29/07/19.
//  Copyright © 2019 Renato Matos de Paula. All rights reserved.
//

import UIKit

final class MainViewController: UIViewController, BaseViewController, ViewConfiguration, CollectionViewContext {
    
    lazy var collectionView: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collection.prepare()
        
        collection.backgroundColor = .gray
        
        return collection
    }()
    
    var source: CollectionViewSource? {
        didSet {
            source?.register(itemsFor: collectionView)
            
            collectionView.dataSource = source
            collectionView.delegate = source
        }
    }
    
    let viewModel: MarvelListViewModel
    
    //MARK: Init
    init(viewModel: MarvelListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        
        self.title = self.viewModel.title
        self.viewModel.view = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Not implemented")
    }
    
    //MARK: Transition Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.showLoading()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.setupViews()
        self.viewModel.fetchHeroes()
    }
}
