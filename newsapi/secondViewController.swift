//
//  secondViewController.swift
//  newsapi
//
//  Created by Admin on 04/10/23.
//

import UIKit
import WebKit

class secondViewController: UIViewController {
    
    @IBOutlet weak var webkit: WKWebView!
    var urlString: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let urlString = urlString, let url = URL(string: urlString) {
            let request = URLRequest(url: url)
                        webkit.load(request)
            
        }
        
        
        /*
         // MARK: - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
         }
         */
        
    }
}
