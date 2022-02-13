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
    
    private lazy var parentStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fill
        stack.alignment = .fill
        stack.spacing = 8
        stack.axis = .vertical
        return stack
    }()
    
    private lazy var rocketImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var titleLabel: UILabel = {
       let label = UILabel()
       label.translatesAutoresizingMaskIntoConstraints = false
       label.clipsToBounds = true
       label.textColor = .black
       label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
       return label
   }()
    
    private lazy var dateLabel: UILabel = {
       let label = UILabel()
       label.translatesAutoresizingMaskIntoConstraints = false
       label.clipsToBounds = true
       label.textColor = .black
       label.numberOfLines = 0
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
        contentView.addSubview(parentStack)

        parentStack.snp.makeConstraints { make in
            make.top.bottom.equalTo(contentView).inset(8)
            make.leading.trailing.equalTo(contentView).inset(8)
        }

        rocketImage.snp.makeConstraints { make in
            make.height.equalTo(rocketImage.snp.width).multipliedBy(1/1)
        }
        parentStack.addArrangedSubview(rocketImage)
        parentStack.addArrangedSubview(dateLabel)
        parentStack.addArrangedSubview(titleLabel)
    }
    
    func setUpContent(item: SpaceXResponseModel) {
        if let path = item.links?.patch?.small {
            rocketImage.kf.setImage( with: URL(string: path)!)
        }
        dateLabel.text = item.dateUTC
        titleLabel.text = item.rocket
    }
}
