//
//  TitleCollectionViewCell.swift
//  testSnareHome
//
//  Created by 小木曽佑介 on 2023/04/26.
//

import UIKit
import SDWebImage

class TitleCollectionViewCell: UICollectionViewCell {


    static let identifier = "TitleCollectionViewCell"

    @IBOutlet weak var imageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }


    public func configure(with model: String) {

        guard let url = URL(string: model) else {
            return
        }

        imageView.sd_setImage(with: url, completed: nil)
    }

}
