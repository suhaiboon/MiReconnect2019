//
//  ViewController.swift
//  BurgerCollectionView
//
//  Created by Suhaib AlMutawakel on 7/19/19.
//  Copyright © 2019 Suhaib AlMutawakel. All rights reserved.
//

import UIKit
import StoreKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    @IBOutlet var collectionView: UICollectionView!
    
    
    private let heightCell: CGFloat = 300
    private let cellId = "apps-view-controller-cell"
    private let headerId = "apps-view-controller-header"

    private var shadowLayer: CAShapeLayer!
    private var cornerRadius: CGFloat = 25.0
    private var fillColor: UIColor = .black

    private var arrayOfIDs = [String] ()

    let buttonImage: [UIImage] = [
            UIImage(named: "agendaIcon")!,
            UIImage(named: "speakersIcon")!,
            UIImage(named: "vendorsIcon")!,
            UIImage(named: "sponsorsIcon")!,
            UIImage(named: "teamIcon")!,
            UIImage(named: "infoIcon")!
    ]
    
    let labelText: [String] =
        ["Agenda","Speakers","Bazaar/Food","Sponsors","Meet The Team","More Info"]
    
   
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        
        arrayOfIDs = ["A", "B", "C", "D", "E", "F", "T"]


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
        
        cell.contentView.layer.cornerRadius = 8.0
        //cell.contentView.layer.borderWidth = 1.0
        cell.contentView.layer.borderColor = UIColor.clear.cgColor
        cell.contentView.layer.masksToBounds = true
        
        //used this website to get the exact shadow color https://www.uicolor.xyz/#/hex-to-ui
        cell.layer.shadowColor = UIColor.init(red: 0.20, green: 0.52, blue: 0.90, alpha: 1.0).cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        
        cell.layer.shadowRadius = 10.0
        cell.layer.shadowOpacity = 0.2
        cell.layer.masksToBounds = false
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.contentView.layer.cornerRadius).cgPath

        
        
        return cell
        
    }
    
    var counter = 0
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        let name = arrayOfIDs[indexPath.row]
        let viewController = storyboard?.instantiateViewController(withIdentifier: name)
        self.navigationController?.pushViewController(viewController!, animated: true)
        
        if (name == "F")
        {
            counter += 1
            
            if (counter == 4)
            {
                SKStoreReviewController.requestReview()
                
                //We need to add and check if they didn't review we promopt them with it After maybe 5 times

            }
        }
        

    }
    
 
    
    
}


//extension ViewController: UICollectionViewDelegateFlowLayout {
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
