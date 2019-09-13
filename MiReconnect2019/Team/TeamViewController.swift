//
//  TeamViewController.swift
//  TeamPage
//
//  Created by Suhaib AlMutawakel on 08/22/19.
//  Copyright © 2019 Suhaib AlMutawakel. All rights reserved.
//

import UIKit

class TeamViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet weak var backBButton: UIButton!
    
    private let heightCell: CGFloat = 300
    private let cellId = "apps-view-controller-cell"
    private let headerId = "apps-view-controller-header"

    private var shadowLayer: CAShapeLayer!
    private var cornerRadius: CGFloat = 25.0
    private var fillColor: UIColor = .black

    private var arrayOfIDs = [String] ()

    let buttonImage: [UIImage] = [
            UIImage(named: "osama1")!,
            UIImage(named: "suhaib1")!,
            UIImage(named: "Osama2")!,
            UIImage(named: "suhaib2")!,
            UIImage(named: "osama1")!,
            UIImage(named: "suhaib1")!,
            UIImage(named: "Osama2")!,
            UIImage(named: "suhaib2")!,
    ]
//
    let labelText: [String] =
        ["Dr.Oussama Ajerd","Dr.Suhaib Mutawakel","Dr.Oussama Ajerd","Dr.Suhaib Mutawakel","Dr.Oussama Ajerd","Dr.Suhaib Mutawakel","Dr.Oussama Ajerd","Dr.Suhaib Mutawakel"]
    
   
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        
        
        
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return buttonImage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 0,left: 10,bottom: 0,right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
       return CGSize(width: (self.collectionView.frame.size.width - 50 )/2, height: self.collectionView.frame.size.height/4)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
            let cell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! CollectionViewCell
            return cell
        }
    
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return .init(width: collectionView.frame.width, height: heightCell)
//    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
//        return .init(width: collectionView.frame.width, height: heightCell)
//    }
//
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        
        //cell.ImageIcon = cell.viewWithTag(1) as? UIImageView
        
        cell.ImageIcon.image = buttonImage[indexPath.item]
        cell.ButtonNameLabel.text = labelText[indexPath.item]
        
//        cell.contentView.layer.cornerRadius = 8.0
//        //cell.contentView.layer.borderWidth = 1.0
//        cell.contentView.layer.borderColor = UIColor.clear.cgColor
//        cell.contentView.layer.masksToBounds = true
//        
//        //used this website to get the exact shadow color https://www.uicolor.xyz/#/hex-to-ui
//        cell.layer.shadowColor = UIColor.init(red: 0.20, green: 0.52, blue: 0.90, alpha: 1.0).cgColor
//        cell.layer.shadowOffset = CGSize(width: 0, height: 2.0)
//        
//        cell.layer.shadowRadius = 10.0
//        cell.layer.shadowOpacity = 0.2
//        cell.layer.masksToBounds = false
//        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.contentView.layer.cornerRadius).cgPath

        
        
        return cell
        
    }
  
    
}


//extension TeamViewController: UICollectionViewDelegateFlowLayout {
////
////     func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
////        let cell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! AppsPageHeaderCell
////        return cell
////    }
//
////    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
////        return groups.count
////    }
//
//    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! AppsGroupCell
//        cell.item = groups[indexPath.item].appGroup?.feed
//        return cell
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return .init(width: collectionView.frame.width, height: heightCell)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
//        return .init(width: collectionView.frame.width, height: 0)
//    }
//
//}
