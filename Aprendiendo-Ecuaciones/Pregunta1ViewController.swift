//
//  Pregunta1ViewController.swift
//  Aprendiendo-Ecuaciones
//
//  Created by Edgardo Acosta on 29/10/16.
//  Copyright © 2016 Edgardo Acosta. All rights reserved.
//

import UIKit

class Pregunta1ViewController: UIViewController {
    
    
    
    @IBOutlet weak var imageRespuesta1: UIImageView!
    
    @IBOutlet weak var imageRespuesta2: UIImageView!
    
    @IBOutlet weak var imageRespuesta3: UIImageView!
    
    @IBOutlet weak var imageRespuesta4: UIImageView!
    
    var arregloRespuestas : [UIImage] = []
    var arregloImagenes : [UIImageView] = []
    var respuesta :  Int!
    
    @IBOutlet weak var tfPregunta: UILabel!
    
    
    var Pregunta : String = ""
    var m : Int = 0
    var b : Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        arregloRespuestas.append(UIImage(named: "linealR1")!)
        arregloRespuestas.append(UIImage(named: "linealR0")!)
        arregloRespuestas.append(UIImage(named: "linealR2")!)
        arregloRespuestas.append(UIImage(named: "linealR3")!)
        arregloRespuestas.append(UIImage(named: "linealR4")!)
        arregloRespuestas.append(UIImage(named: "linealR5")!)
        
        arregloImagenes.append(imageRespuesta1)
        arregloImagenes.append(imageRespuesta2)
        arregloImagenes.append(imageRespuesta3)
        arregloImagenes.append(imageRespuesta4)
        
        
        


        
    
        m = RandomInt(min: -5, max: 5)
        b = RandomInt(min: -5, max: 5)
        
        Pregunta = "Y = (\(m)x) + (\(b))";
        
        tfPregunta.text = Pregunta
        respuesta = verificarRespuesta()
        asignarImages()
        
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /// Generates a random `Int` inside of the closed interval.
    func RandomInt(min: Int, max: Int) -> Int {
        if max < min { return min }
        return Int(arc4random_uniform(UInt32((max - min) + 1))) + min
    }
    
    func verificarRespuesta() -> Int {
        
        var pos : Int = 0
        if m > 0 && b == 0 {
            pos = 0
        }
        else if m > 0 && b > 0{
            pos = 1
        }
        else if m > 0 && b < 0{
            pos = 2
        }
        else if m < 0 && b == 0{
            pos = 3
        }
        else if m == 0 && b > 0 {
            pos = 4
        }
        else if m > 0 && b > 0{
            pos = 5
        }
        else if m < 0 && b < 0{
            ///FALTA IMAGEN DE ESTA GRAFICA
            pos = 3
        }
        else if m < 0 && b > 0 {
            // FALTA IMAGEN DE ESTA GRAFICA
            pos = 3
            
        }
        
        
        return pos
    
    }
    func asignarImages() {
        var a = 0
        var arreglo = [0,1,2,3,4,5]
        var aux = 0
        var random : Int
        
    
        while a < 3 {

            random = Int (arc4random_uniform(UInt32(5 - a)) )
            aux = arreglo[random]
            arregloImagenes[a].image = arregloRespuestas[aux]
            arreglo[random] = arreglo [5 - a]
            arreglo[5 - a] = aux
            
            a = a + 1
            
        }
        arregloImagenes[3].image = arregloRespuestas[respuesta]
        
        a = 0
        var auxImagePosition : UIImageView
        arreglo = [0, 1, 2, 3]
        while a < 4 {
            random = Int (arc4random_uniform(UInt32(3 - a)))
            aux = arreglo[random]
            auxImagePosition = arregloImagenes[a]
            arregloImagenes[a] = arregloImagenes[aux]
            arregloImagenes[3 - a] = auxImagePosition
                
            arreglo[random] = arreglo [3 - a]
            arreglo[3 - a] = aux
            
            a = a + 1
            
        }
        
        
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
