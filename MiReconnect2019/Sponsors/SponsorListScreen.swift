//
//  SponsorListScreen.swift
//  ReconnectSponsors
//
//  Created by Oussama Ajerd on 7/30/19.
//  Copyright © 2019 Oussama Ajerd. All rights reserved.
//

import UIKit

class SponsorListScreen: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var backButton: UIButton!
    
    var sponsors : [Sponsor] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //sponsors = createArray()
        parseSponsorsCSV()
        tableview.dataSource = self
        tableview.delegate = self
        
        //tableview.separatorStyle = UITableViewCell.SeparatorStyle.none
     
    }
    
    func parseSponsorsCSV(){
        do {
            let csv = try CSV(
                name: "sponsors",
                extension: "csv",
                bundle: .main,
                delimiter: ",",
                encoding: .utf8)
            let rows = csv!.namedRows
            
            for row in rows{
                let sponsorName = row["sponsorName"]!
                let sponsorDescription = row["sponsorDescription"]!
                let sponsorImage = row["sponsorImage"]!
            
                
                let sponsor = Sponsor(image: UIImage(named: sponsorImage)!, name: sponsorName, description: sponsorDescription)
                
                sponsors.append(sponsor)
            }
            
            
        } catch {
            // Catch errors from trying to load files
        }
    }
    
//    func createArray() -> [Sponsor]{
//        var tempArray: [Sponsor] = []
//
//        let UMR = Sponsor(image: UIImage(named: "VenderLogoImage")!, name: "UMR", description: "Non-Profit Organization specializing in whatever")
//        let ICNA = Sponsor(image: UIImage(named: "ICNA")!, name: "ICNA", description: "Non-Profit")
//        let ICNA1 = Sponsor(image: UIImage(named: "ICNA")!, name: "ICNA", description: "Non-Profit")
//        let ICNA2 = Sponsor(image: UIImage(named: "geLogo")!, name: "General Motors", description: "Non-Profit")
//        let ICNA3 = Sponsor(image: UIImage(named: "doveLogo")!, name: "Dove", description: "Non-Profit")
//        let ICNA4 = Sponsor(image: UIImage(named: "appleLogo")!, name: "Apple", description: "Non-Profit")
//        let ICNA5 = Sponsor(image: UIImage(named: "adidasLogo")!, name: "Adidas", description: "Non-Profit")
//
//        tempArray.append(UMR)
//        tempArray.append(ICNA)
//        tempArray.append(ICNA1)
//        tempArray.append(ICNA2)
//        tempArray.append(ICNA3)
//        tempArray.append(ICNA4)
//        tempArray.append(ICNA5)
//
//        return tempArray
//    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
}


extension SponsorListScreen: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sponsors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentSponsor = sponsors[indexPath.row]
        let cell = tableview.dequeueReusableCell(withIdentifier: "SponsorCell") as! SponsorCell
        cell.setSponsor(sponsor: currentSponsor)
        
        //To remove the selection/highlight from the cell Swift 4
        cell.selectionStyle = UITableViewCell.SelectionStyle.none

        
//        let seperatorImageView = UIImageView.init(image: UIImage.init(named: "seperator"))
//        seperatorImageView.frame = CGRect(x: 0, y: cell.contentView.frame.size.height - 1.0, width: cell.contentView.frame.size.width, height: 1)
//        cell.contentView.addSubview(seperatorImageView)
        
        return cell
    }
}

