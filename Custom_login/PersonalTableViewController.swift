//
//  PersonalTableViewController.swift
//  Custom_login
//
//  Created by Jahongir on 2/4/21.
//  Copyright © 2021 Jahongir. All rights reserved.
//

import UIKit
import Gallery

class PersonalTableViewController: UITableViewController {

    
    @IBOutlet weak var nick: UITextField!
    
    var gallery: GalleryController!
    var itemImages: [UIImage?] = []
    var name: String = ""
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

         tableView.tableFooterView = UIView()
        
      /*  name.addTarget(self, action: #selector(PersonalTableViewController.textFieldDidChange(_:)), for: .editingChanged)
        */
        print()
        
        }
        
        override func viewDidAppear(_ animated: Bool) {
                  super.viewDidAppear(animated)
              }
           
      // MARK: - Table view data source

        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            // #warning Incomplete implementation, return the number of rows
            return 3
        }


    @IBAction func changeProfilePhoto(_ sender: Any) {
        showImageGallery()
    }
    
    
    //MARK: Show Gallery
    
    private func showImageGallery(){
        
        self.gallery = GalleryController()
        self.gallery.delegate = self
        
        Config.tabsToShow = [.imageTab, .cameraTab]
        Config.Camera.imageLimit = 6
        
        self.present(self.gallery, animated: true, completion: nil)
    }
    
    }


    extension PersonalTableViewController: GalleryControllerDelegate{
        func galleryController(_ controller: GalleryController, didSelectImages images: [Image]) {
            
            if images.count>0 {
                
                Image.resolve(images: images) { (resolvedImages) in
                    self.itemImages = resolvedImages
                }
            }
                
             controller.dismiss(animated: true, completion: nil)
        }
        
        func galleryController(_ controller: GalleryController, didSelectVideo video: Video) {
             controller.dismiss(animated: true, completion: nil)
        }
        
        func galleryController(_ controller: GalleryController, requestLightbox images: [Image]) {
             controller.dismiss(animated: true, completion: nil)
        }
        
        func galleryControllerDidCancel(_ controller: GalleryController) {
            controller.dismiss(animated: true, completion: nil)
        }
        
        
    
}
