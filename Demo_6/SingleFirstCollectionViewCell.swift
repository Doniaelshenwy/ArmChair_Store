//
//  SingleFirstCollectionViewCell.swift
//  Demo_6
//
//  Created by Donia Elshenawy on 04/09/2022.
//

import UIKit

class SingleFirstCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!

    @IBOutlet weak var plusBtn: UIButton!
    
    func setDataChair(chair : Chair){
        priceLabel.text = chair.price
        typeLabel.text = chair.type
        nameLabel.text = chair.name
        detailLabel.text = chair.details
        img.image = UIImage(named: chair.img)
        
        plusBtn.layer.cornerRadius = 7
        plusBtn.layer.masksToBounds = true
        img.layer.cornerRadius = 10
    }
    
   
        
    
}
