//
//  MountainCollectionViewCell.swift
//  TravelDestinationsApp
//
//  Created by GEU on 30/01/26.
//

import UIKit

class MountainCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var MountainImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configureCell(destination: Destination){
        self.MountainImageView.image = UIImage(named: destination.imagePath)
    }

}
