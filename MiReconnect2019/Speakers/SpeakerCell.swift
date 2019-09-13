//
//  SpeakerCell.swift
//  ReconnectSpeakers
//
//  Created by Oussama Ajerd on 7/18/19.
//  Copyright © 2019 Oussama Ajerd. All rights reserved.
//

import UIKit

class SpeakerCell: UITableViewCell {

   
    @IBOutlet weak var speakerImage: UIImageView!
    @IBOutlet weak var namePlaceHolder: UIImageView!
    @IBOutlet weak var speakerLabel: UILabel!
    
  
    
    
    func setSpeaker(speaker: Speaker){
        speakerImage.image = speaker.speakerImage
        speakerLabel.text = speaker.speakerName
        namePlaceHolder.image = speaker.namePlaceholder
    }
    
    
}
