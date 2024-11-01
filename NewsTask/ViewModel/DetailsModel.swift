//
//  DetailsModel.swift
//  NewsTask
//
//  Created by KhaleD HuSsien on 01/11/2024.
//

import UIKit
class DetailsModel: Codable {
    func showAlert(with newTitlee : String,vc: UIViewController){
        let alert = UIAlertController(title: newTitlee, message: "Added to favourite successfully", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: nil))
        vc.present(alert, animated: true)
    }
}
