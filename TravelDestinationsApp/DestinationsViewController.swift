//
//  ViewController.swift
//  TravelDestinationsApp
//
//  Created by GEU on 30/01/26.
//

import UIKit

class DestinationsViewController: UIViewController {
    
    @IBOutlet weak var DestinationsCollectionView: UICollectionView!
    
    var destinationsData = DestinationsData()
    var beachDestinations: [Destination] = []
    var mountainDestinations: [Destination] = []
    var urbanDestinations: [Destination] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print(destinationsData.destinations(for: .beach))
        // get beach destinatiomn
        beachDestinations = destinationsData.destinations(for: .beach)
        mountainDestinations = destinationsData.destinations(for: .mountains)
        urbanDestinations = destinationsData.destinations(for: .urban)
        //register the cell
        registerCells()
        
        DestinationsCollectionView.setCollectionViewLayout(generateLayout(), animated: true)
        DestinationsCollectionView.dataSource = self
        DestinationsCollectionView.register(UINib(nibName: "SectionHeaderView", bundle: nil), forSupplementaryViewOfKind: "header", withReuseIdentifier: "header_view")
        
        
    }
    
    // MARK:- Function to register cell
    func registerCells(){
        DestinationsCollectionView.register(UINib(nibName: "BeachCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "beach_cell")
        DestinationsCollectionView.register(UINib(nibName: "MountainCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "mountain_cell")
        DestinationsCollectionView.register(UINib(nibName: "UrbanCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "urban_cell")
        
    }
}

extension DestinationsViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0{
           return beachDestinations.count//destinationsData.destinations(for: .beach).count  :-performance issues
        }
        else if section == 1{
            return mountainDestinations.count
        }
        else if section == 2{
            return urbanDestinations.count
        }
        return 0
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "beach_cell", for: indexPath) as! BeachCollectionViewCell
            //get destination object from the array at the indexpath
            let destination = beachDestinations[indexPath.row]
            cell.configureCell(destination: destination)
            return cell
        } else if indexPath.section == 1{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mountain_cell", for: indexPath) as! MountainCollectionViewCell
            
            //get destination object from the array at the indexpath
            let destination = mountainDestinations[indexPath.row]
            cell.configureCell(destination: destination)
            return cell
        } else if indexPath.section == 2{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "urban_cell", for: indexPath) as! UrbanCollectionViewCell
            
            //get destination object from the array at the indexpath
            let destination = urbanDestinations[indexPath.row]
            cell.configureCell(destination: destination)
            return cell
        }
        return UICollectionViewCell()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        var headerView: SectionHeaderView!
        if kind == "header"
        {
            headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header_view", for: indexPath) as! SectionHeaderView
            
            if indexPath.section == 0{
                headerView.headerLabel.text = "Top Beaches"
            }
            else if indexPath.section == 1{
                headerView.headerLabel.text =  "Top Mountains"
            }
            else if indexPath.section == 2{
                headerView.headerLabel.text = "Top Urban Spots"
            }
        }
        return headerView
    }
    
    func generateLayout() -> UICollectionViewLayout{
        
        
        let layout = UICollectionViewCompositionalLayout{ (sectionIndex: Int, environment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection in
            
            let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(50))
            let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: "header", alignment: .topLeading)
            
            
            if sectionIndex == 0{
                let section = self.generateSectionForBeachDestinations()
                section.boundarySupplementaryItems = [header]
                return section
            }
            else if sectionIndex == 1{
                let section = self.generateSectionForMountainDestinations()
                section.boundarySupplementaryItems = [header]
                return section
            }
            else if sectionIndex == 2{
                let section = self.generateSectionForUrbanDestinations()
                section.boundarySupplementaryItems = [header]
                return section
            }
            return self.generateSectionForBeachDestinations()
            
        }
        return layout
    }
    
    func generateSectionForBeachDestinations() -> NSCollectionLayoutSection{
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(300))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: 1)
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        return section
        
    }
    func generateSectionForMountainDestinations() -> NSCollectionLayoutSection{
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(170))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: 1)
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        return section
    }
    func generateSectionForUrbanDestinations() -> NSCollectionLayoutSection{
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(300))
        
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, repeatingSubitem: item, count: 1)
        group.interItemSpacing = .fixed(10)
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0)
//        section.orthogonalScrollingBehavior = .groupPaging
        return section
    }
}
