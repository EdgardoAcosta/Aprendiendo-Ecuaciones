//
//  InitialViewController.swift
//  Aprendiendo-Ecuaciones
//
//  Created by Julio Aguilar on 10/20/16.
//  Copyright © 2016 Edgardo Acosta. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController {
    
    
    @IBOutlet weak var imagePolinomial: UIImageView!
    
    @IBOutlet weak var imageLogaritmicas: UIImageView!
    
    @IBOutlet weak var imageExponecial: UIImageView!
    
    @IBOutlet weak var imageRadical: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePolinomial.image = UIImage(named: "polinomial")
        imagePolinomial.alpha = 0.7
        
        imageLogaritmicas.image = UIImage(named: "logaritmica")
        imageLogaritmicas.alpha = 0.7
        
        imageExponecial.image = UIImage(named: "exponecial")
        imageExponecial.alpha = 0.7
        
        imageRadical.image = UIImage(named: "radical")
        imageRadical.alpha = 0.7
        
        
        
        

        // Do any additional setup after loading the view.
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
