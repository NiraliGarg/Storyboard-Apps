//
//  SectionHeaderView.swift
//  TravelDestinationsApp
//
//  Created by GEU on 30/01/26.
//

import UIKit

class SectionHeaderView: UICollectionReusableView {

        
        @IBOutlet var headerLabel: UILabel!

        override func awakeFromNib() {
            super.awakeFromNib()
            // Initialization code
        }
        func configureCell(withTitle title:String){
            headerLabel.text = title
        }
        
}

