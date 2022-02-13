//
//  AllLaunchesCollectionViewCell.swift
//  SpaceXUikit
//
//  Created by Barış Şaraldı on 13.02.2022.
//

import UIKit
import Kingfisher
import SnapKit

class AllLaunchesCollectionViewCell: UICollectionViewCell {
    
    private lazy var rocketImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.clipsToBounds = true
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.numberOfLines = 2
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView() {
        contentView.addSubview(rocketImage)
        contentView.addSubview(titleLabel)
        contentView.backgroundColor = .yellow
        contentView.layer.cornerRadius = 12
        
        NSLayoutConstraint.activate([
            rocketImage.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor),
            rocketImage.rightAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.rightAnchor),
            rocketImage.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
            rocketImage.heightAnchor.constraint(equalToConstant: contentView.frame.height / 1.25),

            titleLabel.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor,constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor,constant: -10),
            titleLabel.topAnchor.constraint(equalTo: rocketImage.bottomAnchor, constant: 10),

        ])
    }
    
    func setUpContent(item: SpaceXResponseModel) {
        if let path = item.links?.patch?.small {
            rocketImage.kf.setImage( with: URL(string: path)!)
        }
        titleLabel.text = item.name
    }
}
