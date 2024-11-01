//
//  FavouriteViewController.swift
//  NewsTask
//
//  Created by KhaleD HuSsien on 01/11/2024.
//

import UIKit

class FavouriteViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpDesign()
    }
    
    func setUpDesign(){
        self.title = "Favourite"
        self.navigationController?.navigationItem.largeTitleDisplayMode = .always
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    

}
