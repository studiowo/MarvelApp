//
//  PGOperation.swift
//  MarvelApp
//
//  Created by Renato Matos de Paula on 31/07/19.
//  Copyright © 2019 Renato Matos de Paula. All rights reserved.
//

import UIKit

class PGOperation: Operation {
    var downloadHandler: ImageDownloaderHandler?
    var imageUrl: URL
    
    private var indexPath: IndexPath?
    
    override var isAsynchronous: Bool {
        return true
    }
    
    override var isExecuting: Bool {
        return _executing
    }
    
    override var isFinished: Bool {
        return _finished
    }
    
    private var _executing = false {
        willSet {
            willChangeValue(forKey: "isExecuting")
        }
        didSet {
            didChangeValue(forKey: "isExecuting")
        }
    }
    
    private var _finished = false {
        willSet {
            willChangeValue(forKey: "isFinished")
        }
        didSet {
            didChangeValue(forKey: "isFinished")
        }
    }
    
    func executing(_ executing: Bool) {
        _executing = executing
    }
    
    func finish(_ finished: Bool) {
        _finished = finished
    }
    
    required init(url: URL, indexPath: IndexPath?) {
        self.imageUrl = url
        self.indexPath = indexPath
    }
    
    override func main() {
        guard !isCancelled else {
            finish(true)
            return
        }
        
        executing(true)
        downloadImageFromUrl()
    }
    
    func downloadImageFromUrl() {
        let newSession = URLSession.shared
        let downloadTask = newSession.downloadTask(with: imageUrl) { location, response, error in
            if let locationUrl = location, let data = try? Data(contentsOf: locationUrl) {
                let image = UIImage(data: data)
                self.downloadHandler?(image, self.imageUrl, self.indexPath, error)
            }
            
            self.finish(true)
            self.executing(false)
        }
        downloadTask.resume()
    }
}
