//
//  HomePageViewController.swift
//  OTT
//
//  Created by user on 27/08/23.
//

import UIKit

class HomePageViewController: UIViewController {
    
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var homeTableView: UITableView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}

extension HomePageViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TitleHeaderCell")
        as? TitleHeaderCell else {
            return UITableViewCell()
        }
        
        return cell.contentView
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MoviesTableViewCell", for: indexPath)
            as? MoviesTableViewCell else {
            return UITableViewCell()
        }
        cell.selectionStyle = .none
        cell.moviePosterCell.delegate = self
        cell.moviePosterCell.dataSource = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
    }
    
}

extension HomePageViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView,cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MoviePosterCollectionViewCell", for: indexPath) as? MoviePosterCollectionViewCell else { return UICollectionViewCell() }
        cell.posterImage.layer.cornerRadius = 5
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: homeTableView.frame.width/3, height: 150)
    }
    
}
