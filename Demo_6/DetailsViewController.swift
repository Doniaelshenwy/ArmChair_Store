//
//  DetailsViewController.swift
//  Demo_6
//
//  Created by Donia Elshenawy on 04/09/2022.
//

import UIKit

class DetailsViewController: UIViewController {
    

    @IBOutlet weak var badgeCount: UILabel!
    @IBOutlet weak var thirdView: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var addBtn: UIButton!
    @IBOutlet weak var favouriteBtn: UIButton!
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var quantity: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    var color = ""
    var quantityL = ""
    var price = ""
    var imgString = ""
    var badge = 0
    var ptr :CountNum!
    override func viewDidLoad() {
        super.viewDidLoad()

        colorLabel.text = color
        quantity.text = quantityL
        priceLabel.text = price
        img.image = UIImage(named: imgString)
        
        curveShape()
        
        self.navigationController?.isNavigationBarHidden = true
        
      
        
    }
    
    @IBAction func popBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
   
    func curveShape(){
        img.layer.cornerRadius = 30
        favouriteBtn.layer.cornerRadius = 25
        addBtn.layer.cornerRadius = 20
        firstView.layer.borderWidth = 1
        secondView.layer.borderWidth = 1
        thirdView.layer.borderWidth = 1
        firstView.layer.borderColor = UIColor.lightGray.cgColor
        secondView.layer.borderColor = UIColor.lightGray.cgColor
        thirdView.layer.borderColor = UIColor.lightGray.cgColor
        firstView.layer.cornerRadius = 10
        secondView.layer.cornerRadius = 10
        thirdView.layer.cornerRadius = 10
        badgeCount.layer.cornerRadius = 10
        badgeCount.layer.masksToBounds = true
        
    }

    @IBAction func addBtn(_ sender: Any) {
        
        badge += 1
        badgeCount.text = "\(badge)"
    
        ptr.countNumber(num: badge)
    }
}
