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

    @IBOutlet weak var lbCalificacion: UILabel!
    var calificacion : Int!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        if calificacion != nil {
            calificacion = calificacion * 20
            lbCalificacion.text = "\(calificacion!)%"
        }
        else {
            lbCalificacion.text = "pendiente"
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
    
    @IBAction func unwindStart(sender : UIStoryboardSegue) {
    
    }
  
    
   
}
