//
//  Pregunta1ViewController.swift
//  Aprendiendo-Ecuaciones
//
//  Created by Edgardo Acosta on 29/10/16.
//  Copyright © 2016 Edgardo Acosta. All rights reserved.
//

import UIKit
import KVNProgress

class Pregunta1ViewController: UIViewController {
    
    
    
    @IBOutlet weak var imageRespuesta1: UIImageView!
    
    @IBOutlet weak var imageRespuesta2: UIImageView!
    
    @IBOutlet weak var imageRespuesta3: UIImageView!
    
    @IBOutlet weak var imageRespuesta4: UIImageView!
    
    
    @IBOutlet weak var viewRespuesta1: UIView!
    @IBOutlet weak var viewRespuesta2: UIView!
    @IBOutlet weak var viewRespuesta3: UIView!
    @IBOutlet weak var viewRespuesta4: UIView!
    
    @IBOutlet var vista: UIView!
    
    var arregloRespuestas : [UIImage] = []
    var arregloImagenes : [UIImageView] = []
    var respuesta :  Int!
    var imagenRespuesta : UIImageView!
    
    @IBOutlet weak var tfPregunta: UILabel!
    
    
    var Pregunta : String = ""
    var m : Int = 0
    var b : Int = 0
    var imageClick : Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        arregloRespuestas.append(UIImage(named: "r1")!)//m > 0 && b == 0
        arregloRespuestas.append(UIImage(named: "r2")!)//m > 0 && b < 0
        arregloRespuestas.append(UIImage(named: "r3")!)// m < 0 && b == 0
        arregloRespuestas.append(UIImage(named: "r4")!)//m < 0 && b < 0
        arregloRespuestas.append(UIImage(named: "r5")!)//m == 0 && b > 0
        arregloRespuestas.append(UIImage(named: "r6")!)// m == 0 && b < 0
        arregloRespuestas.append(UIImage(named: "r7")!)//m > 0 && b > 0
        arregloRespuestas.append(UIImage(named: "r8")!)//m < 0 && b > 0

        //arregloRespuestas.append(UIImage(named: "linealR5")!)
        
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
            pos = 6
        }
        else if m > 0 && b < 0{
            pos = 1
        }
        else if m < 0 && b == 0{
            pos = 2
        }
        else if m == 0 && b > 0 {
            pos = 4
        }
        else if m == 0 && b < 0 {
            pos = 5
        }
        else if m < 0 && b < 0{
            pos = 3
        }
        else if m < 0 && b > 0 {
            pos = 7
            
        }
        
        
        return pos
    
    }
    func asignarImages() {
        var a = 0
        var arreglo = [0,1,2,3,4]
        var aux = 0
        var random : Int
        
        //Elige imagenes aleatoriamente
        while a < 4 {
            //Elejimos un numero de imagen
            random = Int (arc4random_uniform(UInt32(4 - a)) )
            
            //Obtenemos valor
            aux = arreglo[random]
            
            //Set a la imagen en la posicion a (0 - 3)
            arregloImagenes[a].image = arregloRespuestas[aux]
            
            //Swap del valor de la ultima posicion a la posicion obtenida por random
            arreglo[random] = arreglo [4 - a]
            
            //Asignar valor de random a la ultima posicion
            arreglo[4 - a] = aux
            
            //Aumenta valor
            a = a + 1
        }
        
        //Varibale para detectar si la respuesta ya fue escogida
        var flag : Bool = false
        
        for i in 0...3 {
            if arregloImagenes[i].image == arregloRespuestas[respuesta] {
                imagenRespuesta = arregloImagenes[i]
                flag = true
                break
            }
        }
        
        if !flag {
            //Asignamos a ultima posicion la imagen correcta
            arregloImagenes[3].image = arregloRespuestas[respuesta]
            
            //Guradamos imagen correcta para comparar
            imagenRespuesta = arregloImagenes[3]
        }

        print(respuesta)
        
        
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
    
    @IBAction func tapImagen1(_ sender: AnyObject) {
        imageRespuesta1.alpha = 0.4
        if imagenRespuesta.image == imageRespuesta1.image{
            KVNProgress.show(withStatus: "", on: vista)
            KVNProgress.showSuccess()

            viewRespuesta1.backgroundColor = UIColor.green
            print("la 1 es la correcta")
        }
        else{
            KVNProgress.show(withStatus: "", on: vista)
            KVNProgress.showError()
    
            viewRespuesta1.backgroundColor = UIColor.red
            print("esta no es 1")
        }
        disableTap()
       
    }
    
    
    @IBAction func tapImagen2(_ sender: AnyObject) {
        imageRespuesta2.alpha = 0.4

        if imagenRespuesta.image == imageRespuesta2.image{
            viewRespuesta1.backgroundColor = UIColor.green
            KVNProgress.show(withStatus: "", on: vista)
            KVNProgress.showSuccess()


        }
        else{
            KVNProgress.show(withStatus: "", on: vista)
            KVNProgress.showError()
            

            viewRespuesta2.backgroundColor = UIColor.red
        }
        disableTap()
    }
    
    @IBAction func tapImagen3(_ sender: AnyObject) {
        imageRespuesta3.alpha = 0.4
        
        if imagenRespuesta.image == imageRespuesta3.image{
        
            viewRespuesta3.backgroundColor = UIColor.green
            KVNProgress.show(withStatus: "", on: vista)
            KVNProgress.showSuccess()


            print("la 3 es la correcta")
        }
        else{
            KVNProgress.show(withStatus: "", on: vista)
            KVNProgress.showError()
            

            viewRespuesta3.backgroundColor = UIColor.red

            print("esta no es 3")
        }
        disableTap()

    }
    
    @IBAction func tapImagen4(_ sender: AnyObject) {
        imageRespuesta4.alpha = 0.4

        if imagenRespuesta.image == imageRespuesta4.image{
            
            viewRespuesta4.backgroundColor = UIColor.green
            KVNProgress.show(withStatus: "", on: vista)
            KVNProgress.showSuccess()


            print("la 4 es la correcta")
        }
        else{
            viewRespuesta4.backgroundColor = UIColor.red
            KVNProgress.show(withStatus: "", on: vista)
            KVNProgress.showError()

            print("esta no es 4")
        }
        disableTap()

    }
    
    
    func disableTap()  {
        imageRespuesta1.isUserInteractionEnabled = false
        imageRespuesta2.isUserInteractionEnabled = false
        imageRespuesta3.isUserInteractionEnabled = false
        imageRespuesta4.isUserInteractionEnabled = false

        
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
