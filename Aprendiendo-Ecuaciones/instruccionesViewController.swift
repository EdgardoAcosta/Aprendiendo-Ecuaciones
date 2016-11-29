//
//  instruccionesViewController.swift
//  Aprendiendo-Ecuaciones
//
//  Created by Edgardo Acosta on 28/11/16.
//  Copyright © 2016 Edgardo Acosta. All rights reserved.
//

import UIKit

class instruccionesViewController: UIViewController {
    
    
    @IBOutlet weak var pdfView: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MOSTRAR PDF
        /*
        if let pdf = Bundle.main.url(forResource: "myPDF", withExtension: "pdf", subdirectory: nil, localization: nil)  {
            let req = NSURLRequest(url: pdf)
            let webView = UIWebView(frame: CGRect(x: 10, y: 10, width: 200, height: 200))
            
            
            webView.loadRequest(req as URLRequest)
            self.view.addSubview(webView)
            
 
        }
         */
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
