//
//  SponsorCell.swift
//  ReconnectSponsors
//
//  Created by Oussama Ajerd on 7/30/19.
//  Copyright © 2019 Oussama Ajerd. All rights reserved.
//

import UIKit

class SponsorCell: UITableViewCell {

    @IBOutlet weak var sponsorImage: UIImageView!
    @IBOutlet weak var sponsorName: UILabel!
    @IBOutlet weak var sponsorDescription: UILabel!
    
    func setSponsor(sponsor: Sponsor){
        sponsorImage.image = sponsor.image
        sponsorName.text = sponsor.name
        sponsorDescription.text = sponsor.description
    }
    
}
