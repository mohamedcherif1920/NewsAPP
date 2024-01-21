//
//  NewsTableViewCell.swift
//  NewsAPP
//
//  Created by mohammed on 21/01/2024.
//

import UIKit
import Kingfisher

class NewsTableViewCell: UITableViewCell {
    
    //*********************************************************************
    // MARK: - Iboutlet
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var newsDate: UILabel!
    @IBOutlet weak var newsTitle: UILabel!
    
    //*********************************************************************
    // MARK: - LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        self.newsImageView.layer.cornerRadius = 6
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    //*********************************************************************
    // MARK: - Fonctions
    func configureCell(item: Post) {
        let url = URL(string: item.urlToImage ?? "")
        let placeholderImage = UIImage(named: Assettes.placeholder)
        self.newsImageView.kf.setImage(with: url, placeholder: placeholderImage)
        self.newsTitle.text = item.title
        let dateString = item.publishedAt
        if let formattedDate = Date.convertDateString(dateString, fromFormat: DateFormat.longDate, toFormat: DateFormat.shortDate) {
            self.newsDate.text = formattedDate
        } else {
            print("La conversion de la chaîne de date a échoué.")
        }
    }
}
