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
    
    //Arreglo de views que contienen las imagenes
    //Detectan los taps a cada imagen
    @IBOutlet var arregloViews: [UIView]!
    
    //Vista principal
    @IBOutlet var vista: UIView!
    
    //Arreglo que contiene el pool de imagenes
    //Todas las psoibles respuestas que se relacionan a ecuaciones
    var arregloRespuestas : [UIImage] = [UIImage(named: "p1")!,UIImage(named: "p2")!,UIImage(named: "p3")!,UIImage(named: "p4")!,UIImage(named: "p5")!,UIImage(named: "p6")!,UIImage(named: "p7")!,UIImage(named: "p8")!]
    
    //Arreglo de imagenes escogidas para la vista principal
    @IBOutlet var arregloImagenes: [UIImageView]!
    
    
    //Posicion de indice de la imagen respuesta
    //Indice dentro del pool de arreglo respuestas
    var respuesta :  Int!
    
    @IBOutlet weak var btSiguiente: UIButton!
    

    //Pregunta de la view
    @IBOutlet weak var lbPregunta: UILabel!
    @IBOutlet weak var btTerminar: UIButton!
    
    //Valores de la ecuacion
    var m : Int = 0
    var b : Int = 0
    
    //Bool para detectar cuando se hace tap a una imagen
    var imageClick : Bool = false
    
    let segues = ["quiz2", "quiz3"]
    var indexSegue : Int!
    var segueName : String!
    var numPregunta : Int!
    var preguntasCorrectas : Int!


    //Arreglo de tipo pregunta para guardar posiciones de las imagenes seleccionadas
    var respuestas : [Pregunta]! = []
    
    // MARK: - General
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if numPregunta != nil {
            numPregunta = numPregunta + 1
        }
        else {
            numPregunta = 1
        }
        
        if preguntasCorrectas == nil {
            preguntasCorrectas = 0
        }
        
        indexSegue = Int(arc4random_uniform(UInt32(segues.count)))
        segueName = segues[indexSegue]
        
        disableNext(boolean: false)

        
        //Genera para la ecuacion de pregunta
        m = RandomInt(min: -5, max: 5)
        b = RandomInt(min: -5, max: 5)
        
        //Set de la ecuacion
        lbPregunta.text = "Y = (\(m)x) + (\(b))"
        
        //Posicion del indice de la imagen respuesta
        respuesta = verificarRespuesta()
        
        if numPregunta == 5 {
            btSiguiente.isHidden = true
            btTerminar.isHidden = false
        }
        
        //Asigna imagenes a la view de forma aleatoria
        asignarImages()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Controller functions
    
    /// Genera un random `Int` dentro del intervalo especificado.
    func RandomInt(min: Int, max: Int) -> Int {
        if max < min { return min }
        return Int(arc4random_uniform(UInt32((max - min) + 1))) + min
    }
    
    //Devuelve el indice de la imagen que corresponde a la respuesta de una ecuacion dados sus valores m y b
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
        //Selecciona posicion aleatoria en la view para la imagen que sera la respuesta
        let posicionRespuesta = Int (arc4random_uniform(UInt32(3)))
        
        //Auxiliar para guardar indices de las imagenes aleatorias
        //El indice corresponde al arregloRespuestas
        var aux : Int!
        //Label auxiliar
        var pregunta : Pregunta!
        
        for i in 0...3 {
            if i == posicionRespuesta {
                arregloImagenes[i].image = arregloRespuestas[respuesta]
                pregunta = Pregunta(label: lbPregunta, posicion: respuesta)
            }
            else {
                aux = Int (arc4random_uniform(UInt32(7)))
                arregloImagenes[i].image = arregloRespuestas[aux]
                pregunta = Pregunta(label: lbPregunta, posicion: aux)
            }
            respuestas.append(pregunta)
        }
    }
    
    // MARK: - Gestures
    @IBAction func tapImagen1(_ sender: AnyObject) {
        arregloImagenes[0].alpha = 0.4
        
        if respuestas[0].posicionRespuesta == respuesta {
            KVNProgress.show(withStatus: "", on: vista)
            KVNProgress.showSuccess()

            arregloViews[0].backgroundColor = UIColor.green
            preguntasCorrectas = preguntasCorrectas + 1
        }
        else{
            KVNProgress.show(withStatus: "", on: vista)
            KVNProgress.showError()
    
            arregloViews[0].backgroundColor = UIColor.red
        }
        
        disableTap()
        disableNext(boolean: true)
    }
    
    @IBAction func tapImagen2(_ sender: AnyObject) {
        arregloImagenes[1].alpha = 0.4
        
        if respuestas[1].posicionRespuesta == respuesta {
            KVNProgress.show(withStatus: "", on: vista)
            KVNProgress.showSuccess()
            arregloViews[1].backgroundColor = UIColor.green
            preguntasCorrectas = preguntasCorrectas + 1
        }
        else{
            KVNProgress.show(withStatus: "", on: vista)
            KVNProgress.showError()

            arregloViews[1].backgroundColor = UIColor.red
        }
        
        disableTap()
        disableNext(boolean: true)

    }
    
    @IBAction func tapImagen3(_ sender: AnyObject) {
        arregloImagenes[2].alpha = 0.4
        
        if respuestas[2].posicionRespuesta == respuesta {
            KVNProgress.show(withStatus: "", on: vista)
            KVNProgress.showSuccess()
            
            arregloViews[2].backgroundColor = UIColor.green
            preguntasCorrectas = preguntasCorrectas + 1
        }
        else{
            KVNProgress.show(withStatus: "", on: vista)
            KVNProgress.showError()
            
            arregloViews[2].backgroundColor = UIColor.red
        }
        
        disableTap()
        disableNext(boolean: true)
    }
    
    @IBAction func tapImagen4(_ sender: AnyObject) {
        arregloImagenes[3].alpha = 0.4

        if respuestas[3].posicionRespuesta == respuesta {
            KVNProgress.show(withStatus: "", on: vista)
            KVNProgress.showSuccess()
            
            arregloViews[3].backgroundColor = UIColor.green
            preguntasCorrectas = preguntasCorrectas + 1
        }
        else{
            KVNProgress.show(withStatus: "", on: vista)
            KVNProgress.showError()
            
            arregloViews[3].backgroundColor = UIColor.red
        }
        disableTap()
        disableNext(boolean: true)
    }
    
    //Disables tap in every image
    func disableTap()  {
        for i in 0...3 {
            arregloImagenes[i].isUserInteractionEnabled = false
        }
    }
    
    func disableNext(boolean : Bool) {
        btSiguiente.isEnabled = boolean
        btTerminar.isEnabled = boolean
    }
    
    // MARK: - Navigation
    @IBAction func randomSegue(_ sender: UIButton) {
        if numPregunta != 5 {
            self.performSegue(withIdentifier: segueName, sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "quiz2" {
            let viewDestino = segue.destination as! Pregunta2ViewController
            viewDestino.preguntasCorrectas = preguntasCorrectas!
            viewDestino.numPregunta = numPregunta!
        }
        else if segue.identifier == "quiz3" {
            let viewDestino = segue.destination as! Pregunta3ViewController
            viewDestino.preguntasCorrectas = preguntasCorrectas!
            viewDestino.numPregunta = numPregunta!
        }
        else {
            let viewDestino = segue.destination as! inicioQuiz1ViewController
            viewDestino.lbCalificacion.text = "\(preguntasCorrectas * 20)%"
        }
    }

}
