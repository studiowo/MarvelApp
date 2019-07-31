//
//  UIImageView+Extensions.swift
//  MarvelApp
//
//  Created by Renato Matos de Paula on 31/07/19.
//  Copyright © 2019 Renato Matos de Paula. All rights reserved.
//

import UIKit

let imageCache = NSCache<NSString, UIImage>()

extension UIImageView {
    
    func downloadImage(from imgURL: String!) {
        guard let imgURL = URL(string: imgURL) else {
            return
        }
        
        let url = URLRequest(url: imgURL)
        image = nil
        
        if let imageToCache = imageCache.object(forKey: imgURL.absoluteString as NSString) {
            self.image = imageToCache
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error)
                return
            }
            
            DispatchQueue.main.async {
                guard let data = data else {
                    return
                }
                
                let imageToCache = UIImage(data: data)
                
                imageCache.setObject(imageToCache!, forKey: imgURL.absoluteString as NSString)
                self.image = imageToCache
            }
        }
        task.resume()
    }
}
