//
//  MainViewController.swift
//  NewsTask
//
//  Created by KhaleD HuSsien on 31/10/2024.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - VARS & OUTLETS
    @IBOutlet weak var emptyImage: UIImageView!
    @IBOutlet weak var loadingSpinner: UIActivityIndicatorView!
    @IBOutlet weak var searchBarr: UISearchBar!
    @IBOutlet weak var newsCV: UICollectionView!
    @IBOutlet weak var sortDatePicker: UIDatePicker!
    let vm: MainViewModel = MainViewModel()
    var sortingDateString: String? = ""
    var searchText: String? = ""
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegates()
        setUpDesign()
        setDate()
        getArticles(text: "", sortingFrom: "")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.emptyImage.isHidden = true
        
    }
    // MARK: - Functions
    func startAnimate(){
        self.loadingSpinner.isHidden = false
        self.loadingSpinner.startAnimating()
        self.newsCV.isHidden = true
    }
    func stopAnimate(){
        DispatchQueue.main.async {
            self.loadingSpinner.isHidden = true
            self.loadingSpinner.stopAnimating()
            self.newsCV.isHidden = false
        }
    }
    func setUpDesign(){
        self.navigationController?.navigationItem.largeTitleDisplayMode = .always
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    func setDelegates(){
        newsCV.delegate = self
        newsCV.dataSource = self
        searchBarr.delegate = self
        newsCV.register(UINib(nibName: "NewsCell", bundle: nil), forCellWithReuseIdentifier: "NewsCell")
        newsCV.showsHorizontalScrollIndicator = false
        newsCV.showsVerticalScrollIndicator = false
    }
    func setDate(){
        sortDatePicker.datePickerMode = .date
    }
    private func getArticles(text: String,sortingFrom: String){
        self.newsCV.backgroundColor = .systemGroupedBackground
        startAnimate()
        vm.getArticels(sortingFrom: sortingFrom, searchText: text) { [weak self] in
            guard let self = self else { return }
            print(vm.articles.count)
            DispatchQueue.main.async {
                if self.vm.articles.isEmpty{
                    AlertRepresenter.showAlert(with: "ERROR", mess: "There is no data", vc: self, action: { _ in
                        
                    })
                }
                self.newsCV.reloadData()
            }
            stopAnimate()
        }
    }
    // MARK: - Actions
    @IBAction func favTapped(_ sender: UIBarButtonItem) {
        let favVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FavouriteViewController")as! FavouriteViewController
        self.navigationController?.pushViewController(favVC, animated: true)
    }
    @IBAction func dateChanged(_ sender: UIDatePicker) {
        let selectedDate = sender.date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        let sortingFrom: String = dateFormatter.string(from: selectedDate)
        self.sortingDateString = sortingFrom
        
        self.getArticles(text: self.searchText ?? "", sortingFrom: self.sortingDateString == "" ? self.vm.getCurrentDate() : self.sortingDateString ?? "")
    }
}
// MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
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
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let newsDetailsVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "NewsDetailsViewController")as! NewsDetailsViewController
       
        self.navigationController?.pushViewController(newsDetailsVC, animated: true)
        newsDetailsVC.articel = vm.articles[indexPath.row]
    }
}

// MARK: - UISearchBarDelegate
extension MainViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        guard let text = searchBar.text else { return }
        self.searchText = text
        self.getArticles(text: text, sortingFrom: (self.sortingDateString == "" ? vm.getCurrentDate() : self.sortingDateString) ?? "")
    }
}
