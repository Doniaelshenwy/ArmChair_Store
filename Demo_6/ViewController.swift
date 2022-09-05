//
//  ViewController.swift
//  Demo_6
//
//  Created by Donia Elshenawy on 04/09/2022.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {
    
    var chairArray : [Chair] = []

    
    @IBOutlet weak var underPlus: UILabel!
    
    
    @IBOutlet weak var badgeCountLabel: UILabel!
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchTextField: UIView!
 
    override func viewDidLoad() {
        super.viewDidLoad()
       curveViewTextField()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        chairArray = [
            Chair(name: "Circular armchair", details: "Details of chair", type: "type of chair", price: "$  78", img: "c5", colorL: "Purple", quantity: "01"),
            Chair(name: "Circular armchair", details: "Details of chair", type: "type of chair", price: "$  66", img: "s4", colorL: "Red", quantity: "02"),
            Chair(name: "Circular armchair", details: "Details of chair", type: "type of chair", price: "$  39", img: "s2", colorL: "Green", quantity: "03"),
            Chair(name: "Circular armchair", details: "Details of chair", type: "type of chair", price: "$  100", img: "s1", colorL: "Yellow", quantity: "04"),
            Chair(name: "Circular armchair", details: "Details of chair", type: "type of chair", price: "$  63", img: "s3", colorL: "Blue", quantity: "05"),
            Chair(name: "Circular armchair", details: "Details of chair", type: "type of chair", price: "$  88", img: "c5", colorL: "Purple", quantity: "06")
        ]
        
        setUPHorizontal()
        
        underPlus.layer.masksToBounds = true
        underPlus.layer.cornerRadius = 20
        
        badgeCountLabel.layer.masksToBounds = true
        badgeCountLabel.layer.cornerRadius = 10
        
        self.navigationController?.isNavigationBarHidden = true
       
    }


    
    
    func curveViewTextField(){
        searchTextField.layer.cornerRadius = 20
    }
    
}




extension ViewController : UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return chairArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SingleFirstCollectionViewCell
        cell.setDataChair(chair: chairArray[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController{
            vc.imgString = chairArray[indexPath.row].img
            vc.price = chairArray[indexPath.row].price
            vc.quantityL = chairArray[indexPath.row].quantity
            vc.color = chairArray[indexPath.row].colorL
            vc.ptr = self
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 250, height: 350)
    }
    
    func setUPHorizontal(){
        
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
        
        item.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 10, bottom: 30, trailing: 10)
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.6), heightDimension: .fractionalHeight(1)), subitem: item, count: 1)
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        collectionView.collectionViewLayout = layout
        
    }
}

extension ViewController : CountNum{
    func countNumber(num: Int) {
     
        badgeCountLabel.text = "\(num)"
     
    }
    

}
