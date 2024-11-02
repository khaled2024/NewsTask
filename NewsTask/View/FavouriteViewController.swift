//
//  FavouriteViewController.swift
//  NewsTask
//
//  Created by KhaleD HuSsien on 01/11/2024.
//

import UIKit

class FavouriteViewController: UIViewController {
    // MARK: - VARS
    @IBOutlet weak var noDataImage: UIImageView!
    @IBOutlet weak var newsCV: UICollectionView!
    let vm: FavModel = FavModel()
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpDesign()
        setDelegates()
        vm.getArticels()
    }
    // MARK: - Functions
    func setDelegates(){
        newsCV.delegate = self
        newsCV.dataSource = self
        newsCV.register(UINib(nibName: "NewsCell", bundle: nil), forCellWithReuseIdentifier: "NewsCell")
        newsCV.showsHorizontalScrollIndicator = false
        newsCV.showsVerticalScrollIndicator = false
        // vm delegate
        vm.delegate = self
    }
    func setUpDesign(){
        self.title = "Favourite"
        self.navigationController?.navigationItem.largeTitleDisplayMode = .always
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
}
// MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension FavouriteViewController: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return vm.articles.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewsCell.identifier, for: indexPath)as! NewsCell
        let articel = vm.articles[indexPath.row]
        cell.config(model: articel)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: collectionView.frame.width/2.1, height: 240)
        return size
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
}
extension FavouriteViewController: FavDelegate{
    func emptyCV() {
        DispatchQueue.main.async {
            self.newsCV.isHidden = true
            self.noDataImage.isHidden = false
            self.newsCV.reloadData()
        }
    }
    func reloadCV() {
        self.newsCV.reloadData()
    }
}
