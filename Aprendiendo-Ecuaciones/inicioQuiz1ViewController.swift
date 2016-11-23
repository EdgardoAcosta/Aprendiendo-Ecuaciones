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

    @IBOutlet weak var lbnumRespuestas: UILabel!
    
    var respuestaCorrecta : Int!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if respuestaCorrecta != nil {
            lbnumRespuestas.text = "\(respuestaCorrecta!)"
        }
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func randomSegue(_ sender: UIButton) {
        
        
        let segues = ["quiz1", "quiz2", "quiz3"]
        let index = Int(arc4random_uniform(UInt32(segues.count)))
        let segueName = segues[index]
        self.performSegue(withIdentifier: segueName, sender: self)

        
        
    }

   
}
