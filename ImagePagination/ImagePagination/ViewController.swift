////
////  ViewController.swift
////  ImagePagination
////
////  Created by mac on 12/31/23.
////
//
//import UIKit
//import Foundation
//
//
//
//class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
//
//    @IBOutlet weak var collectionView: UICollectionView!
//
//    var images: [UIImage] = []
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        collectionView.dataSource = self
//        collectionView.delegate = self
//
//        fetchImages()
//    }
//
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return images.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCell
//
//        cell.myImg.image = images[indexPath.item]
//
//
//        return cell
//    }
//
//
//    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//        // Check if the last cell is about to be displayed
//        if indexPath.item == images.count - 1 {
//            // Fetch more images for pagination
//            fetchImages()
//        }
//    }
//
//    // Fetch more images for pagination
//    func fetchImages() {
//
////        let newImages: [UIImage] = []
//        let newImages: [UIImage] = [UIImage(named: "maharaj")!, UIImage(named: "maharaj")!,UIImage(named: "maharaj")!,UIImage(named: "maharaj")!,UIImage(named: "maharaj")!,UIImage(named: "maharaj")!,UIImage(named: "maharaj")!,UIImage(named: "maharaj")!,UIImage(named: "maharaj")!,UIImage(named: "maharaj")!]
//
//
//
//        images.append(contentsOf: newImages)
//
//        // Reload the collection view to reflect the changes
//        collectionView.reloadData()
//    }
//}
//
import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var images: [UIImage] = []
    var isFetching = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        fetchImages()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCell
        
        cell.myImg.image = images[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        // Check if the last cell is about to be displayed and not already fetching
        if indexPath.item == images.count - 1 && !isFetching {
            // Fetch more images for pagination
            fetchImages()
        }
    }
    
    // Fetch more images for pagination
    func fetchImages() {
        // Check if fetching is already in progress
        guard !isFetching else {
            return
        }
        
        // Simulating a network request or fetching images from a data source
        // You would typically use URLSession or another method for this
        isFetching = true
        
        // Simulated delay for demonstration purposes
        DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
            let newImages: [UIImage] = [UIImage(named: "maharaj")!, UIImage(named: "maharaj")!, UIImage(named: "maharaj")!]
            
            // Update images array on the main thread
            DispatchQueue.main.async {
                self.images.append(contentsOf: newImages)
                self.isFetching = false
                self.collectionView.reloadData()
            }
        }
    }
}
