//
//  VendorListScreen.swift
//  ReconnectVendors
//
//  Created by Oussama Ajerd on 7/28/19.
//  Copyright © 2019 Oussama Ajerd. All rights reserved.
//

import UIKit

class VendorListScreen: UIViewController {
    
    
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var backButton: UIButton!
    
    var vendors: [Vendor] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //vendors = createArray()
        parseVendorsCSV()
        tableview.delegate = self
        tableview.dataSource = self
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()


//        vendorsPlaceHolder.layer.cornerRadius = 23
//        vendorsPlaceHolder.clipsToBounds=true
//
//        vendorsPlaceHolder.layer.shadowColor = UIColor.gray.cgColor
//        vendorsPlaceHolder.layer.shadowRadius = 3.0
//        vendorsPlaceHolder.layer.shadowOpacity = 0.3
//        vendorsPlaceHolder.layer.shadowOffset = CGSize(width: 4, height: 4)
//        vendorsPlaceHolder.layer.masksToBounds = false

        
    }
    

    func parseVendorsCSV(){
        
        do {
            let csv = try CSV(
                name: "vendors",
                extension: "csv",
                bundle: .main,
                delimiter: ",",
                encoding: .utf8)
            let rows = csv!.namedRows
            
            for row in rows{
                let vendorName = row["vendorName"]!
                let vendorImage = row["vendorImage"]!
               
                
                let vendor = Vendor(image: UIImage(named: vendorImage)!, name: vendorName)
                vendors.append(vendor)
                
            }
        } catch {
            // Catch errors from trying to load files
        }
    }
    
    
    
    
//    func createArray()->[Vendor]{
//        var tempArray: [Vendor] = []
//
//        let zudo = Vendor(image: UIImage(named: "VenderLogoImage")!, name: "ZUDO")
//        let UMR = Vendor(image: UIImage(named: "VenderLogoImage")!, name: "UMR")
//        let ICNA = Vendor(image: UIImage(named: "VenderLogoImage")!, name: "ICNA")
//        let zudo1 = Vendor(image: UIImage(named: "VenderLogoImage")!, name: "ZUDO")
//        let UMR1 = Vendor(image: UIImage(named: "VenderLogoImage")!, name: "UMR")
//        let ICNA1 = Vendor(image: UIImage(named: "VenderLogoImage")!, name: "ICNA")
//
//
//        tempArray.append(zudo)
//        tempArray.append(UMR)
//        tempArray.append(ICNA)
//        tempArray.append(zudo1)
//        tempArray.append(UMR1)
//        tempArray.append(ICNA1)
//
//        return tempArray
//
//    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        
self.navigationController?.popViewController(animated: true)
        
    }
    
    


}


extension VendorListScreen: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vendors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentVendor = vendors[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "VendorCell") as! VendorCell
        cell.setVendor(vendor: currentVendor)
        
        //To remove the selection/highlight from the cell Swift 4
        cell.selectionStyle = UITableViewCell.SelectionStyle.none

        return cell
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//        tableView.deselectRow(at: indexPath, animated: false)
//    }
//
   
    
    
    
}
