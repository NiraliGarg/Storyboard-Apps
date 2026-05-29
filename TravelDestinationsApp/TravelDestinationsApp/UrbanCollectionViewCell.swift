//
//  UrbanCollectionViewCell.swift
//  TravelDestinationsApp
//
//  Created by GEU on 30/01/26.
//

import UIKit

class UrbanCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var UrbanImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configureCell(destination: Destination){
        self.UrbanImageView.image = UIImage(named: destination.imagePath)
    }

}
