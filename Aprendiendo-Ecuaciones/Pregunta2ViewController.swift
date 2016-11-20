//
//  Pregunta2ViewController.swift
//  Aprendiendo-Ecuaciones
//
//  Created by Edgardo Acosta on 17/11/16.
//  Copyright © 2016 Edgardo Acosta. All rights reserved.
//

import UIKit
import KVNProgress


class Pregunta2ViewController: UIViewController {
    //Variable para la imagen que sera la pregunta
    @IBOutlet weak var imagePregunta: UIImageView!
    
    //Arreglo para guardar las labels que seran las respuestas
    @IBOutlet var lbPreguntas: [UILabel]!
    
    //View para feedback de respuesta
    @IBOutlet var vista: UIView!
    
    
    var arrRespuesta = [Int]()
     var arregloImagenes : [UIImage] = [UIImage(named: "r1")!,UIImage(named: "r2")!,UIImage(named: "r3")!,UIImage(named: "r4")!,UIImage(named: "r5")!,UIImage(named: "r6")!,UIImage(named: "r7")!,UIImage(named: "r8")!]

    var index : Int!
    var posRespuesta : Int!
    var m1 : Int!
    var b1 : Int!
    
    var pregunta : [Pregunta] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        m1 = RandomInt(min: -5, max: 5)
        b1 = RandomInt(min: -5, max: 5)

        
        index = verificarRespuesta(m: m1,b: b1)
        print("Index: \(index)")
        imagePregunta.image = arregloImagenes[index]
        
        setPreguntas()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func setPreguntas() {
        //Variables para ecuacion
        var b, m : Int
        
        //Elige un indicie del arreglo revuelto para la respuesta
        posRespuesta = Int (arc4random_uniform(UInt32(3)))
        var aux : Int!
        
        for i in 0...3 {
            
            //Si la i esta en la posicion aleatoria elige la ecuacion acorde a la imagen
            if i == posRespuesta {
               lbPreguntas[i].text = "Y = (\(m1!)x) + (\(b1!))"
                aux = index
            }

            //Si no genera otra ecuacion aleatoria
            else{
                m = RandomInt(min: -5, max: 5)
                b = RandomInt(min: -5, max: 5)
                
                //Arreglo de preguntas en posicion aleatoria es igual a pregunta recien obtenida
                lbPreguntas[i].text = "Y = (\(m)x) + (\(b))"
                 aux = verificarRespuesta(m: m, b: b)
            }
           
            
            let preguntaAux = Pregunta(label: lbPreguntas[i], posicion: aux)
            
            pregunta.append(preguntaAux)
            print("pregunta: \(i)" )
            print("respuesta: \(pregunta[i].posicionRespuesta)")
        }
    }
    /// Generates a random `Int` inside of the closed interval.
    func RandomInt(min: Int, max: Int) -> Int {
        if max < min { return min }
        return Int(arc4random_uniform(UInt32((max - min) + 1))) + min
    }
    
    func revuelve(arr: [Int]) -> [Int] {
        var a = 0
        var random, aux : Int
        var arreglo = arr
        while a < 4 {
            random = Int (arc4random_uniform(UInt32(3 - a)))
            aux = arreglo[random]
            //Swap indices
            arreglo[random] = arreglo[3 - a]
            arreglo[3 - a] = aux
            //Aumenta contador
            a = a + 1
        }
        
        return arreglo
    }
    
    func verificarRespuesta(m : Int, b : Int) -> Int {
        
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
    
    
    @IBAction func taplbRespuesta1(_ sender: UITapGestureRecognizer) {
        
        if pregunta[0].posicionRespuesta ==  index  {
            
            KVNProgress.show(withStatus: "", on: vista)
            KVNProgress.showSuccess()
            
            
            print("la 1 es la correcta")
        }
        else{
            KVNProgress.show(withStatus: "", on: vista)
            KVNProgress.showError()
            
            print("esta no es 1")
        }
        disableTap()

    }
    
    @IBAction func taplbRespuesta2(_ sender: UITapGestureRecognizer) {
        if pregunta[1].posicionRespuesta ==  index  {
            
            KVNProgress.show(withStatus: "", on: vista)
            KVNProgress.showSuccess()
            
            
            print("la 2 es la correcta")
        }
        else{
            KVNProgress.show(withStatus: "", on: vista)
            KVNProgress.showError()
            
            print("esta no es 2")
        }
        disableTap()
        

    }
    
    @IBAction func taplbRespuesta3(_ sender: UITapGestureRecognizer) {
        if pregunta[2].posicionRespuesta ==  index  {
            
            KVNProgress.show(withStatus: "", on: vista)
            KVNProgress.showSuccess()
            
            
            print("la 3 es la correcta")
        }
        else{
            KVNProgress.show(withStatus: "", on: vista)
            KVNProgress.showError()
            
            print("esta no es 3")
        }
        disableTap()
    }
    
    @IBAction func taplbRespuesta4(_ sender: UITapGestureRecognizer) {
        if pregunta[3].posicionRespuesta ==  index  {
            
            KVNProgress.show(withStatus: "", on: vista)
            KVNProgress.showSuccess()
            
            
            print("la 4 es la correcta")
        }
        else{
            KVNProgress.show(withStatus: "", on: vista)
            KVNProgress.showError()
            
            print("esta no es 4")
        }
        disableTap()

        
    }
    
    
    
    

    
    
    
    func disableTap()  {
        //taplbRespuesta1.view.userInteractionEnabled = false
        
    }

    


    

}
