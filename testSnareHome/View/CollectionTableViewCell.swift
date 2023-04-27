//
//  CollectionTableViewCell.swift
//  testSnareHome
//
//  Created by 小木曽佑介 on 2023/04/26.
//

import UIKit

protocol CollectionViewTableViewCellDelegate: AnyObject {
    func collectionViewTableViewCellDidTapCell(_ cell: CollectionTableViewCell, viewModel: Item)
}

class CollectionTableViewCell: UITableViewCell {



    private var titles: [ItemElement] = [ItemElement]()
    weak var delegate: CollectionViewTableViewCellDelegate?


    static let identifier = "CollectionTableViewCell"
    @IBOutlet weak var collectionView: UICollectionView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        let view = UINib(nibName: "CollectionTableViewCell", bundle: nil).instantiate(withOwner: self, options: nil).first as! UITableViewCell
        contentView.addSubview(view)
        collectionView.register(UINib(nibName: TitleCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: TitleCollectionViewCell.identifier)
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
    }


    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = contentView.bounds
    }

    public func configure(with titles: [ItemElement]) {
        self.titles = titles
        DispatchQueue.main.async { [weak self] in
            self?.collectionView.reloadData()
        }
    }

    required init?(coder: NSCoder) {
        fatalError()
    }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension CollectionTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        titles.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TitleCollectionViewCell", for: indexPath) as? TitleCollectionViewCell else {
            return UICollectionViewCell()
        }

        guard let model = titles[indexPath.row].Item.mediumImageUrls.first?.imageUrl else {
            return UICollectionViewCell()
        }
        cell.configure(with: model)
        return cell
    }


    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)

        let title = titles[indexPath.row].Item

        self.delegate?.collectionViewTableViewCellDidTapCell(self, viewModel: title)

    }


}
