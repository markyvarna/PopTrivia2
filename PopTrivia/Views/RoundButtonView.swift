//
//  RoundButtonView.swift
//  PopTrivia
//
//  Created by Markus Varner on 10/4/18.
//  Copyright © 2018 CreakyDoor. All rights reserved.
//

import UIKit

class RoundButtonView: UIButton {

    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setUpView()
    }
    
    func setUpView() {
        
            self.layer.cornerRadius = 5
            self.clipsToBounds = true
            self.layer.borderWidth = 2.5
            self.layer.borderColor = MVColors.sealBlueDark().cgColor
        
    }
    
    
}
