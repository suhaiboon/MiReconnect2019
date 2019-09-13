//
//  ViewController.swift
//  ReconnectSpeakers
//
//  Created by Oussama Ajerd on 7/18/19.
//  Copyright © 2019 Oussama Ajerd. All rights reserved.
//

import UIKit

class SpeakersViewController: UIViewController {
    
    @IBOutlet weak var speakerName: UILabel!
    @IBOutlet weak var circleImage: UIImageView!
   // @IBOutlet weak var SpeakerPlaceholder: UIImageView!
    @IBOutlet weak var speakerBio: UITextView!
    @IBOutlet weak var speakerTitle: UILabel!
    @IBOutlet weak var labelPlaceHolder: UIView!
    @IBOutlet weak var BGImage: UIImageView!
    @IBOutlet weak var backButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        speakerName.text = speakers[myIndex].speakerName
        circleImage.image = speakers[myIndex].circleImage
        speakerTitle.text = speakers[myIndex].speakerTitle
        speakerBio.text = speakers[myIndex].speakerBio
        BGImage.image = speakers[myIndex].BGImage
        
        //adding shadow
        AddingShadow()

    }
    
    func AddingShadow () {
        //SpeakerPlaceholder.image = speakers[myIndex].namePlaceholder
        // lablePlaceHolder.backgroundColor = UIColor .red
        //fixing the radius in the iphone5s SIze
        labelPlaceHolder.layer.cornerRadius = 23
        labelPlaceHolder.clipsToBounds=true
        
        labelPlaceHolder.layer.shadowColor = UIColor.gray.cgColor
        labelPlaceHolder.layer.shadowRadius = 3.0
        labelPlaceHolder.layer.shadowOpacity = 0.3
        labelPlaceHolder.layer.shadowOffset = CGSize(width: 4, height: 4)
        labelPlaceHolder.layer.masksToBounds = false
        
        BGImage.layer.cornerRadius = 8
        BGImage.layer.shadowColor = UIColor.gray.cgColor
        BGImage.layer.shadowRadius = 3.0
        BGImage.layer.shadowOpacity = 0.5
        BGImage.layer.shadowOffset = CGSize(width: 4, height: 4)
        BGImage.layer.masksToBounds = false
        

    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
}


