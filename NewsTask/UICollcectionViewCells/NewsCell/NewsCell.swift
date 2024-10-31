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

}
