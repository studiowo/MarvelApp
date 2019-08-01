//
//  DetailViewController.swift
//  MarvelApp
//
//  Created by Renato Matos de Paula on 31/07/19.
//  Copyright © 2019 Renato Matos de Paula. All rights reserved.
//

import UIKit

final class DetailViewController: UIViewController, BaseViewController, ViewConfiguration {
    
    lazy var collectionView: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collection.prepare()
        
        collection.backgroundColor = .black
        
        return collection
    }()
    
    var source: CollectionViewSource? {
        didSet {
            source?.register(itemsFor: collectionView)
            
            collectionView.dataSource = source
            collectionView.delegate = source
        }
    }
    
    let viewModel: HeroeDetailViewModel
    
    //MARK: Init
    init(with viewModel: HeroeDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        
        self.title = self.viewModel.title
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    //MARK: Transition Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViews()
    }
}
