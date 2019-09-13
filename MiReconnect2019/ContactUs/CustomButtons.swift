//
//  CustomButtons.swift
//  imageSlider
//
//  Created by Suhaib AlMutawakel on 8/30/19.
//  Copyright © 2019 Suhaib AlMutawakel. All rights reserved.
//

import UIKit

class CustomButtons: UIButton {

    //Code needed when prepearing for buttons
    override init(frame: CGRect) {
        super.init (frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initButton()
    }
    
    func initButton() {
        layer.borderWidth = 2.0
        layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        layer.cornerRadius = frame.size.height/2
        
    }

}
