//
//  inicioQuiz1ViewController.swift
//  Aprendiendo-Ecuaciones
//
//  Created by Edgardo Acosta on 20/11/16.
//  Copyright © 2016 Edgardo Acosta. All rights reserved.
//

import UIKit


class inicioQuiz1ViewController: UIViewController {

    
    @IBOutlet weak var imageGif: UIImageView!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        imageGif.image = UIImage(named: "universo.gif")
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

   
}
