//
//  ViewController.swift
//  HarryPotterWiki
//
//  Created by Pei-Tzu Huang on 2024/9/18.
//

import UIKit

class MainScreen: UIViewController {

    let nextScreenButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButton()
        view.backgroundColor = .systemBackground
        title = "Main Screen"
        navigationController?.navigationBar.prefersLargeTitles = true
        
    }
    
    /// Create a function we can call in viewDidLoad function to load button
    
    func setupButton() {
        view.addSubview(nextScreenButton)
        
        //MARK: UI of the Button
        nextScreenButton.configuration = .filled() // a type of button style in IOS
        nextScreenButton.configuration?.baseBackgroundColor = .systemBlue
        nextScreenButton.configuration?.title = "Next"
        
        // MARK: Action of the Button
        nextScreenButton.addTarget(self, action: #selector(goToDetailScreen), for: .touchUpInside)
        
        // MARK: Layout and Constraints
        nextScreenButton.translatesAutoresizingMaskIntoConstraints = false // don't use auto layout
        
        // Constraints array
        NSLayoutConstraint.activate([
            nextScreenButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextScreenButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            nextScreenButton.widthAnchor.constraint(equalToConstant: 200),
            nextScreenButton.heightAnchor.constraint(equalToConstant: 55)
        ])
      
    }
    
    @objc func goToDetailScreen() {
        let detailScreen = DetailScreen()
        detailScreen.title = "Detail Screen"
        navigationController?.pushViewController(detailScreen, animated: true)
    }

}

