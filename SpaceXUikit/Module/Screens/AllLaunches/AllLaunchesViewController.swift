//
//  AllLaunchesViewController.swift
//  SpaceXUikit
//
//  Created by Barış Şaraldı on 7.02.2022.
//

import UIKit

class AllLaunchesViewController: UIViewController {
    
    private lazy var allLaunchesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.register(
            AllLaunchesCollectionViewCell.self,
            forCellWithReuseIdentifier: cellID
        )
        return collectionView
    }()
    
    // MARK: - Properties
    
    private var cellID = String(describing: AllLaunchesCollectionViewCell.self)
    private var allLaunchesCollectionViewViewDelegate: AllLaunchesCollectionViewProvider
    private var viewModel: AllLaunchesViewModelProtocol
    private var service: IService
    
    init(service: IService,viewModel: AllLaunchesViewModelProtocol,
         allLaunchesCollectionViewViewDelegate: AllLaunchesCollectionViewProvider) {
        self.allLaunchesCollectionViewViewDelegate = allLaunchesCollectionViewViewDelegate
        self.viewModel = viewModel
        self.service = service
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(allLaunchesCollectionView)
        setUpContraint()
        initDelegate()
        viewModel.fetchData()
        
        title = "Launches"
    }
    
    private func initDelegate() {
        viewModel.setUpOutPutDelegate(self)
        allLaunchesCollectionView.delegate = allLaunchesCollectionViewViewDelegate
        allLaunchesCollectionView.dataSource = allLaunchesCollectionViewViewDelegate
        allLaunchesCollectionViewViewDelegate.delegate = self
    }
    
    private func setUpContraint() {
        NSLayoutConstraint.activate([
            allLaunchesCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            allLaunchesCollectionView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -10),
            allLaunchesCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            allLaunchesCollectionView.heightAnchor.constraint(equalToConstant: view.frame.height / 1.1)
        ])
    }
}

// MARK: - AllLaunchesCollectionViewDelegate

extension AllLaunchesViewController: AllLaunchesCollectionViewDelegate {
    func selectItem(item: SpaceXResponseModel) {
        viewModel.goToDetailPage(itemDetail: item)
    }
    
    func getViewHeight() -> CGFloat {
        return view.bounds.height
    }
}

// MARK: - AllLaunchesViewModelOutput

extension AllLaunchesViewController: AllLaunchesViewModelOutput {
    func showData(launchs: [SpaceXResponseModel]) {
        allLaunchesCollectionViewViewDelegate.appendItem(item: launchs)
        allLaunchesCollectionViewViewDelegate.cellID = cellID
        allLaunchesCollectionViewViewDelegate.parentCollectionView = allLaunchesCollectionView
        DispatchQueue.main.async { [weak self] in
            self?.allLaunchesCollectionView.reloadData()
        }
    }
    
    func showError(error: String) {
        showAlert(message: error)
    }
}
