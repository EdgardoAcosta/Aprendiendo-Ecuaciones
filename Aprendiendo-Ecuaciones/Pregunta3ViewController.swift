//
//  Pregunta3ViewController.swift
//  Aprendiendo-Ecuaciones
//
//  Created by Edgardo Acosta on 12/11/16.
//  Copyright © 2016 Edgardo Acosta. All rights reserved.
//

import UIKit

class Pregunta3ViewController: UIViewController {
    
    
    @IBOutlet var lbPreguntas: [UILabel]!
    
    @IBOutlet var imageRespuestas: [UIImageView]!
    
    
    var Pregunta : String = ""
    var m : Int = 0
    var b : Int = 0
    
    var arrPreguntas  = [String]()
    var arrRespuesta = [Int]()
    
    var arregloImagenes : [UIImage] = [UIImage(named: "linealR1")!,UIImage(named: "linealR0")!,UIImage(named: "linealR2")!,UIImage(named: "linealR3")!,UIImage(named: "linealR4")!]


    override func viewDidLoad() {
        super.viewDidLoad()

    
        setPreguntas()

        // Do any additional setup after loading the view.
    }
    
    
    /// Generates a random `Int` inside of the closed interval.
    func RandomInt(min: Int, max: Int) -> Int {
        if max < min { return min }
        return Int(arc4random_uniform(UInt32((max - min) + 1))) + min
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setPreguntas(){
        
        for i in 0...3{
        
            m = RandomInt(min: -5, max: 5)
            b = RandomInt(min: -5, max: 5)
            
        
            arrPreguntas.append("Y = (\(m)x) + (\(b))" );
            
            lbPreguntas[i].text = arrPreguntas[i]
            
            
            arrRespuesta.append( verificarRespuesta() )
            
            imageRespuestas[i].image = arregloImagenes[arrRespuesta[i]]
            
        }
        
        
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
    
    
    func asignarImagen(){
        
        var a = 0
        var auxImagePosition : UIImageView
        
        var arreglo = [0, 1, 2, 3]
        var random : Int!
        var aux : Int!
    
        
        
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
