//
//  ViewController.swift
//  FitTrack
//
//  Created by Matthew Dlugosz on 3/15/23.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    let webView = WKWebView()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(webView)

        
        guard let url = URL(string: "https://www.muscleandstrength.com/workout-routines") else {
            return
        }
        webView.load(URLRequest(url: url))
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        webView.frame = view.bounds
    }


}

