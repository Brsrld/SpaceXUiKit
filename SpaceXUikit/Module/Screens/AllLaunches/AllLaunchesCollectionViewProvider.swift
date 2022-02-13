//
//  AllLaunchesCollectionViewProvider.swift
//  SpaceXUikit
//
//  Created by Barış Şaraldı on 13.02.2022.
//

import Foundation
import UIKit

class AllLaunchesCollectionViewProvider: NSObject {
    private var searchResult: [SpaceXResponseModel] = []
    var cellID: String = ""
    weak var delegate: AllLaunchesCollectionViewDelegate?
    var parentCollectionView: UICollectionView?
}

protocol AllLaunchesCollectionViewDelegate: AnyObject {
    func selectItem(item: SpaceXResponseModel)
    func getViewHeight() -> CGFloat
}

extension AllLaunchesCollectionViewProvider {

    // MARK: - public func
    
    func appendItem(item: [SpaceXResponseModel]) {
        self.searchResult.append(contentsOf: item)
    }

    func clearData() {
        self.searchResult.removeAll()
    }
}

// MARK: - UICollectionViewDelegate, UIScrollViewDelegate
extension AllLaunchesCollectionViewProvider: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UIScrollViewDelegate {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        searchResult.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: cellID,
            for: indexPath
        ) as? AllLaunchesCollectionViewCell else { return UICollectionViewCell() }
        cell.setUpContent(item: (searchResult[indexPath.row]))
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let colums: CGFloat = 2
        let collectioViewWith = collectionView.bounds.width
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let spaceBetweenCells = flowLayout.minimumInteritemSpacing * (colums - 1)
        let adjustedWith = collectioViewWith - spaceBetweenCells
        let width: CGFloat = floor(adjustedWith / colums)
        let height: CGFloat = (delegate?.getViewHeight() ?? 1200) / 3
        return CGSize(width: width, height: height)
    }


    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.selectItem(item: searchResult[indexPath.row])
    }
}
