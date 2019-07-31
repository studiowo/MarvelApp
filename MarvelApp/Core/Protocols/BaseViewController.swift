//
//  BaseViewController.swift
//  MarvelApp
//
//  Created by Renato Matos de Paula on 26/07/19.
//  Copyright © 2019 Renato Matos de Paula. All rights reserved.
//

import UIKit

protocol BaseViewController {
    var activityIndicator: UIActivityIndicatorView? { get }
    
    func showLoading()
    func hideLoading()
}

extension BaseViewController where Self: UIViewController {
    
    var activityIndicator: UIActivityIndicatorView? {
        get { return self-->"activityIndicator" }
        set { self-->["activityIndicator": newValue] }
    }
    
    func showLoading() {
        self-->["activityIndicator": UIActivityIndicatorView(style: .gray)]
        
        guard let activityIndicator = self.activityIndicator else {
            return
        }
        
        activityIndicator.prepare()
        self.view.addSubview(activityIndicator)
        
        activityIndicator
            .centerXAnchor(equalTo: self.view.centerXAnchor)
            .centerYAnchor(equalTo: self.view.centerYAnchor)
        
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
    }
    
    func hideLoading() {
        activityIndicator?.isHidden = true
        activityIndicator?.stopAnimating()
        activityIndicator?.removeFromSuperview()
    }
}
