//
//  tableViewVC.swift
//  Practice
//
//  Created by Berkin Sili on 15.11.2019.
//  Copyright © 2019 Berkin Sili. All rights reserved.
//

import UIKit

class CategoryCollectionViewVC: UIViewController {
    
    weak var interactor: CategoryCollectionViewBusinessLogic?
    
    //MARK: - UIElements
    var categoryCollectionView: UICollectionView?

    var categoryArray: [CategoryVM]? {
        didSet {
            //reload collectionView
        }
    }
    
    //MARK: - Constants
    struct CollectionViewConstants {
        static let identifier = "categoryCellIdentifier"
        static let nibName = "CategoryCVCell"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
extension CategoryCollectionViewVC: CategoryCollectionViewDisplayLogic {
    func routeToItemDetail(with id: String) {
        //
    }
    
    func signContract() {
        let interactor = CategoryCollectionViewInteractor()
        let presenter = CategoryCollectionViewPresenter()
        interactor.presenter = presenter
        presenter.viewController = self
        self.interactor = interactor
    }
    
    func populateCollectionView(categoryList: [CategoryVM]) {
        self.categoryArray = categoryList
        self.categoryCollectionView?.reloadData()
    }
    
    
    func removeItem(at index: Int) {
        //
    }
}

extension CategoryCollectionViewVC: UICollectionViewDelegate {
    
}

extension CategoryCollectionViewVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (categoryArray?.count ?? 0) + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewConstants.identifier, for: indexPath) as! CategoryCVCell
        
        if indexPath.row == categoryArray?.count {
            cell.configureCell(category: nil)
        }else {
            let categoryVM = categoryArray?[indexPath.row]
            cell.configureCell(category: categoryVM)
        }
        return cell
    }
    
    
}
