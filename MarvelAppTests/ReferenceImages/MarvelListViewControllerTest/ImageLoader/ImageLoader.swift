//
//  ImageLoader.swift
//  MarvelApp
//
//  Created by Renato Matos de Paula on 31/07/19.
//  Copyright © 2019 Renato Matos de Paula. All rights reserved.
//

import UIKit

typealias ImageDownloaderHandler = (_ image: UIImage?, _ url: URL, _ indexPath: IndexPath?, _ error: Error?) -> Void

final class ImageDownloadManager {
    
    private var completionHandler: ImageDownloaderHandler?
    
    lazy var imageDownloadQueue: OperationQueue = {
        var queue = OperationQueue()
        queue.name = "StudioWO.MarvelApp.imageDownloadQueue"
        queue.qualityOfService = .userInteractive
        return queue
    }()
    
    let imageCache = NSCache<NSString, UIImage>()
    
    static let shared = ImageDownloadManager()
    
    private init() {}
    
    func downloadImage(_ imageUrl: String, indexPath: IndexPath?, handler: @escaping ImageDownloaderHandler) {
        self.completionHandler = handler
        
        guard let url = URL(string: imageUrl) else {
            return
        }
        
        if let cachedImage = imageCache.object(forKey: imageUrl as NSString) {
            self.completionHandler?(cachedImage, url, indexPath, nil)
        } else {
            if let operations = (imageDownloadQueue.operations as? [PGOperation])?.filter({$0.imageUrl.absoluteString == url.absoluteString && !$0.isFinished && $0.isExecuting}), let operation = operations.first {
                operation.queuePriority = .high
            } else {
                let operation = PGOperation(url: url, indexPath: indexPath)
                if indexPath == nil {
                    operation.queuePriority = .veryHigh
                }
                
                operation.downloadHandler = { image, url, indexPath, error in
                    if let newImage = image {
                        self.imageCache.setObject(newImage, forKey: url.absoluteString as NSString)
                    }
                    self.completionHandler?(image, url, indexPath, error)
                }
                imageDownloadQueue.addOperation(operation)
            }
        }
    }
    
    func slowDownImageDownloadTaskfor(_ imageUrl: String) {
        guard let url = URL(string: imageUrl) else {
            return
        }
        
        if let operations = (imageDownloadQueue.operations as? [PGOperation])?.filter({$0.imageUrl.absoluteString == url.absoluteString && !$0.isFinished && $0.isExecuting}), let operation = operations.first {
            operation.queuePriority = .low
        }
    }
}
