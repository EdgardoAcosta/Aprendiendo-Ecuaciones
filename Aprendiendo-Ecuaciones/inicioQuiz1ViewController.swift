//
//  inicioQuiz1ViewController.swift
//  Aprendiendo-Ecuaciones
//
//  Created by Edgardo Acosta on 20/11/16.
//  Copyright © 2016 Edgardo Acosta. All rights reserved.
//

import UIKit
import Gifu

class inicioQuiz1ViewController: UIViewController {

    
    @IBOutlet weak var imageGif: UIImageView!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
       
        let imageView = GIFImageView(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
        imageView.animate(withGIFNamed: "mugen")
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

   
}
