//
//  TagCollectionVIewCell.swift
//  News
//
//  Created by Taron on 20.07.22.
//

import UIKit

class TagCollectionVIewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "TagCell"
    
    @IBOutlet var tagLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 8
    }
}
