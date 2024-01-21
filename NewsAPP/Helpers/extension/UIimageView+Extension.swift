//
//  uiimageView+Extension.swift
//  NewsAPP
//
//  Created by mohammed on 19/01/2024.
//

import Foundation
import UIKit
import Kingfisher

extension UIImageView {
     func loadImage(from urlString: String?) {
        guard let urlImage = urlString, let url = URL(string: urlImage) else {
            self.image = UIImage(named: Assettes.placeholder) ?? UIImage()
            return
        }
        
        KF.url(url)
          .placeholder(UIImage(named: Assettes.placeholder) ?? UIImage())
          .loadDiskFileSynchronously()
          .cacheMemoryOnly()
          .fade(duration: 0.25)
          .onProgress { receivedSize, totalSize in  }
          .onSuccess { result in  }
          .onFailure { error in }
          .set(to: self)
      }
}

