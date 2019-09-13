//
//  Speaker.swift
//  ReconnectSpeakers
//
//  Created by Oussama Ajerd on 7/18/19.
//  Copyright © 2019 Oussama Ajerd. All rights reserved.
//

import Foundation
import UIKit

class Speaker {
    var speakerName: String
    var speakerImage: UIImage
    var namePlaceholder: UIImage
    var circleImage: UIImage
    var speakerTitle: String
    var speakerBio: String
    var BGImage: UIImage
    
    init(speakerName: String,speakerImage: UIImage, namePlaceholder: UIImage, circleImage: UIImage, speakerTitle: String, speakerBio: String, BGImage: UIImage){
        
        self.speakerName = speakerName
        self.speakerImage = speakerImage
        self.namePlaceholder = namePlaceholder
        self.circleImage = circleImage
        self.speakerTitle = speakerTitle
        self.speakerBio = speakerBio
        self.BGImage = BGImage
    }
}
