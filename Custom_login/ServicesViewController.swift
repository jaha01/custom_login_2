//
//  ServicesViewController.swift
//  Custom_login
//
//  Created by Jahongir on 2/8/21.
//  Copyright © 2021 Jahongir. All rights reserved.
//

import UIKit

class ServicesViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var label: UILabel!
    
     var mySliderImage:[String] = ["image0","image2","image3","image4"]
      
      func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
          return mySliderImage.count
      }
      
      func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
          
          
          let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ServicesCollectionViewCell
          
          cell.image.image = UIImage(named: mySliderImage[indexPath.row])
          cell.image.layer.cornerRadius = 15.0
          
          return cell
          
          
      }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //label.text = 
    }

}
