//
//  TestViewController.swift
//  Custom_login
//
//  Created by Jahongir on 2/23/21.
//  Copyright © 2021 Jahongir. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {

   private let modelData: [String] = {
            var data: [String] = []
            for i in 0 ..< 6 {
                data.append("Button \(i)")
            }
            return data
        }()
        
        
        private lazy var buttons: [UIButton] = {
            var buttons: [UIButton] = []
            for i in 0 ..< self.modelData.count {
                buttons.append(UIButton(type: .custom))
            }
            for i in 0 ..< self.modelData.count {
                buttons[i].tag = i
                buttons[i].setTitle(self.modelData[i], for: .normal)
                buttons[i].setTitleColor(.red, for: .normal)
                buttons[i].titleLabel?.font = .systemFont(ofSize: 25.0, weight: .medium)
                buttons[i].titleLabel?.textAlignment = .center
                buttons[i].titleLabel?.baselineAdjustment = .alignCenters
                buttons[i].titleEdgeInsets = UIEdgeInsets(top: 4.0, left: 12.0, bottom: 4.0, right: 12.0)
                buttons[i].titleLabel?.adjustsFontSizeToFitWidth = true
                buttons[i].backgroundColor = .white
                buttons[i].layer.borderWidth = 1.0
                buttons[i].layer.borderColor = UIColor.black.cgColor
                buttons[i].addTarget(self, action: #selector(self.buttonTouchDown(sender:)), for: .touchDown)
                buttons[i].isUserInteractionEnabled = true
                buttons[i].clipsToBounds = true
                buttons[i].translatesAutoresizingMaskIntoConstraints = false
                buttons[i].layer.cornerRadius = 50.0
                
                
            }
            return buttons
        }()
        
        private let stackView: UIStackView = {
            let stackView = UIStackView()
            stackView.backgroundColor = .systemPink
            stackView.axis = .horizontal
            stackView.alignment = .leading
            stackView.distribution = .equalSpacing
            stackView.spacing = 30.0
            stackView.isUserInteractionEnabled = true
            stackView.clipsToBounds = false
            stackView.translatesAutoresizingMaskIntoConstraints = false
            return stackView
        }()
        
        private let scrollView: UIScrollView = {
            let scrollView = UIScrollView()
            scrollView.backgroundColor = .white
            scrollView.isPagingEnabled = false
            scrollView.isScrollEnabled = true
            scrollView.isUserInteractionEnabled = true
            scrollView.clipsToBounds = true
            scrollView.translatesAutoresizingMaskIntoConstraints = false
            return scrollView
        }()
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            self.setupViews()
            
            self.makeLayout()
            
        }
        
        
        override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
            
            #if !targetEnvironment(simulator)
            for button in self.buttons {
                button.layer.cornerRadius = (button.bounds.height / 2.0)
            }
            #endif
            
        }
        
        
        override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
            
            
            #if targetEnvironment(simulator)
            for button in self.buttons {
                button.layer.cornerRadius = (button.bounds.height / 2.0)
            }
            #endif
            
        }
        
        
        
        private func setupViews() {
            
            self.view.backgroundColor = .systemBackground
            
            self.view.addSubview(self.scrollView)
            
            self.scrollView.addSubview(self.stackView)
            
            for button in self.buttons {
                self.stackView.addArrangedSubview(button)
            }
            
        }
        
        
        private func makeLayout() {
            
            NSLayoutConstraint.activate([
                self.scrollView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                self.scrollView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
                self.scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20.0),
                self.scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20.0),
                self.scrollView.heightAnchor.constraint(equalToConstant: 50.0)
            ])
            
            NSLayoutConstraint.activate([
                self.stackView.topAnchor.constraint(equalTo: self.scrollView.topAnchor, constant: 4.0),
                self.stackView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor, constant: 10.0),
                self.stackView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor, constant: -10.0),
                self.stackView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor, constant: -4.0)
            ])
            
        }
        
        
        
        
        
        
        @objc
    private func buttonTouchDown(sender: UIButton) {
            
            for button in self.buttons {
                button.backgroundColor = .white
                
            }
            
            self.buttons[sender.tag].backgroundColor = .systemGreen
           /* self.buttons = {[unowned self] in
                let selectedIndexPath = indexPath.row
            }*/
            
            print("Tapped button №\(sender.tag)")
            
        }
        
        
    }




    // MARK: - UIKit Live Preview

    // Enabling live preview in the editor
    #if canImport(SwiftUI) && DEBUG

    // Importing the SwiftUI framework
    import SwiftUI

    // Structure displaying preview
    struct Template_LivePreview: PreviewProvider {
        
        // Displayed UIViewController
        static var previews: some View {
            
            Group {
                
                //            LivePreview()
                //                .previewDevice("iPod touch (7th generation)")
                //                .previewDisplayName("iPod touch (7th generation)")
                
                LivePreview()
                    .previewDevice("iPhone 12 Pro Max")
                    .previewDisplayName("iPhone 12 Pro Max")
                
            }
            .preferredColorScheme(.dark)
            .edgesIgnoringSafeArea(.all)
            
        }
        
        // UIViewController wrapper for the live preview
        struct LivePreview: UIViewControllerRepresentable {
            
            // Transforming the UIViewController
            func makeUIViewController(context: Context) -> some UIViewController {
                return TestViewController()
            }
            
            // Updating the UIViewController in real time
            func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            }
            
        }
        
    }

    #endif
