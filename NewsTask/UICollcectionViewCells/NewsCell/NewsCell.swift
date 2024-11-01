//
//  NewsCell.swift
//  NewsTask
//
//  Created by KhaleD HuSsien on 01/11/2024.
//

import UIKit

class NewsCell: UICollectionViewCell {

    @IBOutlet weak var descView: UIView!
    
    @IBOutlet weak var newDesc: UILabel!
    @IBOutlet weak var newSec: UILabel!
    @IBOutlet weak var newTitle: UILabel!
    @IBOutlet weak var newImage: UIImageView!
    @IBOutlet weak var newsView: UIView!
    
    static let identifier = String(describing: NewsCell.self)
    override func awakeFromNib() {
        super.awakeFromNib()
        descView.layer.cornerRadius = 8
        newsView.layer.cornerRadius = 12.0
        newImage.layer.cornerRadius = 10.0
    }
    func config(model: Article){
        self.newTitle.text = model.title ?? ""
        self.newDesc.text = model.content ?? ""
        self.newImage.loadDataUsingCacheWithUrlString(urlString: model.urlToImage ?? "")
        self.newSec.text = model.author ?? ""
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        newImage.image = nil
    }

}
