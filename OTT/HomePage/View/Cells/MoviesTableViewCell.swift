//
//  MoviesTableViewCell.swift
//  OTT
//
//  Created by user on 28/08/23.
//

import UIKit

class MoviesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var moviePosterCell: UICollectionView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

}
