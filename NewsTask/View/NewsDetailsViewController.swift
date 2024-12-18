//
//  NewsDetailsViewController.swift
//  NewsTask
//
//  Created by KhaleD HuSsien on 01/11/2024.
//

import UIKit

class NewsDetailsViewController: UIViewController {
    // MARK: - OUTLETS & VARS
    @IBOutlet weak var addFavView: UIView!
    @IBOutlet weak var newDescLabel: UILabel!
    @IBOutlet weak var newSecLabel: UILabel!
    @IBOutlet weak var newSecView: UIView!
    @IBOutlet weak var newTitle: UILabel!
    @IBOutlet weak var newImage: UIImageView!
    @IBOutlet weak var newDetailView: UIView!
    
    var articel: Article!
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setDesign()
        setData()
    }
    // MARK: - Func
    func setData(){
        if let articel = articel {
            newTitle.text = articel.title
            newDescLabel.text = articel.description
            newSecLabel.text = articel.author
            newImage.loadDataUsingCacheWithUrlString(urlString: articel.urlToImage ?? "")
        }
    }
    func setDesign(){
        self.navigationController?.navigationItem.largeTitleDisplayMode = .always
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "Details"
        newDetailView.layer.cornerRadius = 24
        newImage.layer.cornerRadius = 18
        newSecView.layer.cornerRadius = 15
        addFavView.layer.cornerRadius = 24
    }
    
    // MARK: - Actions
    @IBAction func addFavTapped(_ sender: UIButton) {
        AlertRepresenter.showAlert(with: articel.title ?? "",mess: "Added to favourite successfully", vc: self, action: { _ in
            CoreDataManager.shared.createArticle(
                title: self.articel.title ?? "",
                description: self.articel.description ?? "",
                image: self.articel.urlToImage ?? "",
                sec: self.articel.author ?? "")
            self.navigationController?.popViewController(animated: true)
        })
    }
}
