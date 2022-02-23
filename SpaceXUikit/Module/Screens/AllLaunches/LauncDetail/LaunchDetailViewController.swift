//
//  LaunchDetailViewController.swift
//  SpaceXUikit
//
//  Created by Barış Şaraldı on 13.02.2022.
//

import UIKit
import SnapKit

class LaunchDetailViewController: UIViewController, Coordinating, UIScrollViewDelegate {
    
    
    private let scrollView: UIScrollView = {
            let scroll = UIScrollView()
            scroll.translatesAutoresizingMaskIntoConstraints = false
            scroll.backgroundColor = .blue
            return scroll
        }()
    
    private lazy var rocketImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private lazy var flickrImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.backgroundColor = .yellow
        image.image = UIImage(named: "reddit")
        return image
    }()
    
    private lazy var redditImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.backgroundColor = .yellow
        image.image = UIImage(named: "reddit")
        return image
    }()
    
    private lazy var youtubeImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.backgroundColor = .yellow
        image.image = UIImage(named: "reddit")
        return image
    }()
    
    private lazy var wikiImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.backgroundColor = .yellow
        image.image = UIImage(named: "reddit")
        return image
    }()
    
    private lazy var articleImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.backgroundColor = .yellow
        image.image = UIImage(named: "reddit")
        return image
    }()
    
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.clipsToBounds = true
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = .black
        label.numberOfLines = 2
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.textAlignment = .center
        return label
    }()
    
    private lazy var overviewLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.clipsToBounds = true
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .black
        label.numberOfLines = 24
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.textAlignment = .justified
        return label
    }()
    
    var coordinator: Coordinator?
    private var resultDetail: SpaceXResponseModel
    
    init(resultDetail: SpaceXResponseModel?) {
        self.resultDetail = resultDetail!
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpContent(item: resultDetail)
        setUpContraint()
    }
    
    
    private func setUpContraint() {
        view.backgroundColor = .white
        view.addSubview(rocketImage)
        view.addSubview(titleLabel)
        view.addSubview(overviewLabel)
                        
        NSLayoutConstraint.activate([
            rocketImage.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 10),
            rocketImage.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -10),
            rocketImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            rocketImage.heightAnchor.constraint(equalToConstant: view.frame.height / 3),
        
            titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 10),
            titleLabel.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -10),
            titleLabel.topAnchor.constraint(equalTo: rocketImage.bottomAnchor, constant: 25),
            titleLabel.heightAnchor.constraint(equalToConstant: view.frame.height / 40),
            
            overviewLabel.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 10),
            overviewLabel.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -10),
            overviewLabel.topAnchor.constraint(equalTo: titleLabel.topAnchor,constant: 25),
        
        ])
    }
    
    func setUpContent(item: SpaceXResponseModel) {
        if let path = item.links?.patch?.large {
            rocketImage.kf.setImage( with: URL(string: path)!)
        }
        titleLabel.text = item.name
        overviewLabel.text = ((item.details?.isEmpty) != nil) ? item.details : "We are sorry.There is no overview."
    }
}
