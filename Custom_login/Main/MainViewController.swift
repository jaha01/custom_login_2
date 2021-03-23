//
//  MainViewController.swift
//  Custom_login
//
//  Created by Jahongir on 1/26/21.
//  Copyright © 2021 Jahongir. All rights reserved.
//

import UIKit
//import Quartz;/Quartz.h

class MainViewController: UIViewController,  UICollectionViewDelegate, UICollectionViewDataSource {
   
    
    @IBOutlet weak var firstUI: UIView!
    
    @IBOutlet weak var secondUI: UIView!
    
    
    // let firstVC = FirstSegment()
    //let secondVC = SecondSegment()
   
   var MySliderImage:[String] = ["image0","image2","image3","image4"]
   
   func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return MySliderImage.count
   }
   
   func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
       
       let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SliderCollectionViewCell
       
       cell.sliderImages.image = UIImage(named: MySliderImage[indexPath.row])
       cell.sliderImages.layer.cornerRadius = 15.0
       
       return cell
       
       
   }

    @IBOutlet weak var viewWithCorner: UIView!
    
    @IBOutlet weak var viewWithShadow: UIView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        let url = "https://api.sunrise-sunset.org/json?date=2021-02-18&lat=-74.0060&lng=40.7128&formatted=0"
        getData(from: url)
        
        

       // UIApplication.shared.statusBarView?.backgroundColor = UIColor.green
       // navigationController?.navigationBar.backgroundColor = UIColor.green
        
        self.firstUI.alpha = 1
        self.secondUI.alpha = 0
        
        self.viewWithCorner.layer.cornerRadius = 15
        self.viewWithCorner.layer.masksToBounds = true

        
       // self.viewWithCorner.layer.borderColor = UIColor.black.cgColor
       // self.viewWithCorner.layer.borderWidth = 2
        
       // self.viewWithCorner.layer.shadowRadius = 10.0
       // self.viewWithCorner.layer.shadowColor = UIColor.black.cgColor
       // self.viewWithCorner.layer.shadowOpacity = 0.7
       // self.viewWithCorner.layer.shadowOffset = CGSize (width: 3, height: 3)
         
         self.viewWithShadow.layer.masksToBounds = false
         self.viewWithShadow.layer.shadowRadius = 20.0
         self.viewWithShadow.layer.shadowColor = UIColor.gray.cgColor
         self.viewWithShadow.layer.shadowOpacity = 0.7
         self.viewWithShadow.layer.shadowOffset = CGSize (width: 3, height: 3)
    }


    
    @IBAction func segmentBtn(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0 {
            UIView.animate(withDuration: 0.5, animations: {
                self.firstUI.alpha = 1
                self.secondUI.alpha = 0
            })
        } else {
            UIView.animate(withDuration: 0.5, animations: {
                self.firstUI.alpha = 0
                self.secondUI.alpha = 1
            })
        }
        
    }
    
    
}

/*extension UIApplication {
    
    var statusBarView: UIView? {
        return value (forKey: "statusBar") as? UIView
    }
}
*/
/*
class GraphContainerView: UIViewController {
    func applyPlainShadow() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowRadius = 5.0
        self.layer.shadowOpacity = 0.7
    }

    override init(frame: CGRect) {
        super.init(coder: frame)
        applyPlainShadow()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        applyPlainShadow()
    }
}*/


