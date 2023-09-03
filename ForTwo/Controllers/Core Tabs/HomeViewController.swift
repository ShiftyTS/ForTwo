//
//  HomeViewController.swift
//  ForTwo
//
//  Created by Tao Shen on 2023-08-30.
//

import Foundation
import UIKit
import FirebaseAuth

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("test")
        super.viewDidAppear(animated)
        handleWhenNotAuthenticated()
    }
    
    private func handleWhenNotAuthenticated() {
        // Check authentication status
        if Auth.auth().currentUser == nil {
            // Show login page
            let loginVC = LoginViewController()
            loginVC.modalPresentationStyle = .fullScreen
            present(loginVC, animated: false)
        }
    }
}
