//
//  Sponsor.swift
//  ReconnectSponsors
//
//  Created by Oussama Ajerd on 7/30/19.
//  Copyright © 2019 Oussama Ajerd. All rights reserved.
//

import Foundation
import UIKit


class Sponsor{
    var image: UIImage
    var name: String
    var description : String
    
    init(image: UIImage, name: String, description: String){
        self.image = image
        self.name = name
        self.description = description
    }
}
