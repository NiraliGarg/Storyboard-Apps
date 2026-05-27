//
//  BeachCollectionViewCell.swift
//  TravelDestinationsApp
//
//  Created by GEU on 30/01/26.
//

import UIKit

class BeachCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var ImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configureCell(destination:Destination) {
        //Display the destination image on the image view
        ImageView.image = UIImage(named: destination.imagePath)
    }

}
