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
    
    //Arreglo de pool de imagenes a elegir para la pregunta
     var arregloImagenes : [UIImage] = [UIImage(named: "r1")!,UIImage(named: "r2")!,UIImage(named: "r3")!,UIImage(named: "r4")!,UIImage(named: "r5")!,UIImage(named: "r6")!,UIImage(named: "r7")!,UIImage(named: "r8")!]
    
    //Posicion de la imagen de la pregunta en el arreglo de iamegenes
    var index : Int!
    
    //Posicion de la respuesta de la label
    var posRespuesta : Int!
    
    //Valores que toma la ecuacion que es la respuesta a la imagen
    var m1 : Int!
    var b1 : Int!
    
    //Arreglo para guardar datos que las labels
    //Guarda la posicion de cada imagen que tienen como respuesta las preguntas
    //Se puede tener varias respuestas a la misma imagen al ser generadas de forma aleatoria
    //Se inicia vacio el arreglo para poder hacer append
    var pregunta : [Pregunta] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Se generan valores para determinar la imagen a preguntas
        m1 = RandomInt(min: -5, max: 5)
        b1 = RandomInt(min: -5, max: 5)

        //Posicion de la imagen dentro del arreglo de imagenes
        index = verificarRespuesta(m: m1,b: b1)
        
        //Set de la imagen
        imagePregunta.image = arregloImagenes[index]
        
        //Se generan el resto de ecuaciones aleatorias
        setPreguntas()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Funcion para generar ecuaciones aleatorias
    //Set de las ecuaciones al arreglo de labels
    //Se elige una posicion aleatoria para garantizar que exista la respuesta
    func setPreguntas() {
        //Variables para ecuacion
        var b, m : Int
        
        //Elige un indicie del arreglo de labels para la respuesta
        posRespuesta = Int (arc4random_uniform(UInt32(3)))
        var aux : Int!
        
        //Se itera de 0 a 3 pues se tienen solo 4 opciones de respuesta
        for i in 0...3 {
            
            //Si la i esta en la posicion eligida para la respuesta
            //La ecuacion toma valores a la imagen
            if i == posRespuesta {
                //Usa variables globales del viewDidLoad
                lbPreguntas[i].text = "Y = (\(m1!)x) + (\(b1!))"
                aux = index
            }

            //Si no, genera otra ecuacion aleatoria
            else {
                m = RandomInt(min: -5, max: 5)
                b = RandomInt(min: -5, max: 5)
                
                //Arreglo de preguntas en posicion aleatoria es igual a pregunta recien obtenida
                lbPreguntas[i].text = "Y = (\(m)x) + (\(b))"
                aux = verificarRespuesta(m: m, b: b)
            }
           
            //Crea pregunta
            let preguntaAux = Pregunta(label: lbPreguntas[i], posicion: aux)
            
            //Guarda en arreglo global
            pregunta.append(preguntaAux)
        }
    }
    /// Genera un random `Int` dentro del intervalo.
    func RandomInt(min: Int, max: Int) -> Int {
        if max < min { return min }
        return Int(arc4random_uniform(UInt32((max - min) + 1))) + min
    }
    
    //Funcion que recibe valores m y b de la ecuacion a generar
    //Retorna un entero que es el indice de la posicion correspontdiente a su imagen respuesta
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
        else {
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
        else {
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
        else {
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
