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

       let path = Bundle.main.path(forResource: "manual", ofType: "pdf")!
        
        let req = NSURL.fileURL(withPath: path) //NSURLRequest(url: path as URL)
        
        self.pdfView.loadRequest(NSURLRequest(url: req) as URLRequest)
        
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
