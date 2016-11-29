//
//  instruccionesViewController.swift
//  Aprendiendo-Ecuaciones
//
//  Created by Edgardo Acosta on 28/11/16.
//  Copyright © 2016 Edgardo Acosta. All rights reserved.
//

import UIKit

class instruccionesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let url = Bundle.main.url(forResource: "Alice_In_Wonderland", withExtension: "pdf")
        
        if let url = url {
            let webView = UIWebView(frame: self.view.frame)
            let urlRequest = NSURLRequest(url: url)
            webView.loadRequest(urlRequest as URLRequest)
            
            view.addSubview(webView)
    }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
