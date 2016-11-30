//
//  Pregunta3ViewController.swift
//  Aprendiendo-Ecuaciones
//
//  Created by Edgardo Acosta on 12/11/16.
//  Copyright © 2016 Edgardo Acosta. All rights reserved.
//

import UIKit
import KVNProgress

class Pregunta3ViewController: UIViewController {
    
    
    @IBOutlet var lbPreguntas: [UILabel]!
    
    @IBOutlet var imageRespuestas: [UIImageView]!
    
    @IBOutlet weak var btSiguiente: UIButton!
    @IBOutlet weak var btTerminar: UIButton!
    
    @IBOutlet var vista: UIView!
    
    var preguntas : [Pregunta]! = []
    
    var arregloImagenes : [UIImage] = [UIImage(named: "p1")!,UIImage(named: "p2")!,UIImage(named: "p3")!,UIImage(named: "p4")!,UIImage(named: "p5")!,UIImage(named: "p6")!,UIImage(named: "p7")!,UIImage(named: "p8")!]
    

    let segues = ["quiz1", "quiz2"]
    
    var indexSegue : Int!
    var segueName : String!
    
    var numPregunta : Int!
    var preguntasCorrectas: Int!
    
    var selectedLabel : Int!
    var imagePositions = [Int]()
    
    // MARK: - General
    override func viewDidLoad() {
        
        super.viewDidLoad()
        disableImage(boolean: false)

        //btSiguiente.isEnabled = false
        
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
        
        if numPregunta == 5 {
            btSiguiente.isHidden = true
            btTerminar.isHidden = false
        }
    
        setPreguntas()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Controller functions
    
    /// Generates a random `Int` inside of the closed interval.
    func RandomInt(min: Int, max: Int) -> Int {
        if max < min { return min }
        return Int(arc4random_uniform(UInt32((max - min) + 1))) + min
    }
    
    func setPreguntas() {
        var b, m : Int!
        var indiceRespuesta : Int!
        let posicionRespuestaImg = Int(arc4random_uniform(UInt32(3)))
        var random : Int!
        
        //Crea las ecuaciones aleatorias
        for i in 0...3 {
			m = RandomInt(min: -5, max: 5)
			b = RandomInt(min: -5, max: 5)
            
			lbPreguntas[i].text = "Y = (\(m!)x) + (\(b!))"
            indiceRespuesta = verificarRespuesta(m: m, b: b)
            
            let pregunta = Pregunta(label: lbPreguntas[i], posicion: indiceRespuesta)
            preguntas.append(pregunta)
            
            random = Int(arc4random_uniform(UInt32(7)))
            //print("Posicion random de imagenes: \(random!)")
            imageRespuestas[i].image = arregloImagenes[random]
            imagePositions.append(random)
		}
        
        random = Int(arc4random_uniform(UInt32(3)))
        //print("Posicion de la imagen respuesta: \(posicionRespuestaImg)")
        //print("Imagen de respuesta: \(preguntas[random].posicionRespuesta)")
        
        imagePositions[posicionRespuestaImg] = preguntas[random].posicionRespuesta
        imageRespuestas[posicionRespuestaImg].image = arregloImagenes[preguntas[random].posicionRespuesta]
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
        selectedLabel = 0
        //print("update")
        disableLabel()
        disableImage(boolean: true)

    }
    
    @IBAction func taplbRespuesta2(_ sender: UITapGestureRecognizer) {
        selectedLabel = 1
        //print("update")
        disableLabel()
        disableImage(boolean: true)

    }
    
    @IBAction func taplbRespuesta3(_ sender: UITapGestureRecognizer) {
        selectedLabel = 2
        //print("update")
        disableLabel()
        disableImage(boolean: true)

    }
    
    @IBAction func taplbRespuesta4(_ sender: UITapGestureRecognizer) {
        selectedLabel = 3
        //print("update")
        disableLabel()
        disableImage(boolean: true)

    }
    
    @IBAction func tapImage1(_ sender: UITapGestureRecognizer) {
        if preguntas[selectedLabel].posicionRespuesta == imagePositions[0] {
            KVNProgress.show(withStatus: "", on: vista)
            KVNProgress.showSuccess()
            preguntasCorrectas = preguntasCorrectas + 1
        }
        else {
            KVNProgress.show(withStatus: "", on: vista)
            KVNProgress.showError()
        }
        
        disableImage(boolean: false)
        disableNext(boolean: true)
    }
    
    @IBAction func tapImage2(_ sender: UITapGestureRecognizer) {
        if preguntas[selectedLabel].posicionRespuesta == imagePositions[1] {
            KVNProgress.show(withStatus: "", on: vista)
            KVNProgress.showSuccess()
            preguntasCorrectas = preguntasCorrectas + 1
        }
        else {
            KVNProgress.show(withStatus: "", on: vista)
            KVNProgress.showError()
        }
        
        disableImage(boolean: false)
        disableNext(boolean: true)
    }
    
    @IBAction func tapImage3(_ sender: UITapGestureRecognizer) {
        if preguntas[selectedLabel].posicionRespuesta == imagePositions[2] {
            KVNProgress.show(withStatus: "", on: vista)
            KVNProgress.showSuccess()
            preguntasCorrectas = preguntasCorrectas + 1
        }
        else {
            KVNProgress.show(withStatus: "", on: vista)
            KVNProgress.showError()
        }
        
        disableImage(boolean: false)
        disableNext(boolean: true)
    }
    
    @IBAction func tapImage4(_ sender: UITapGestureRecognizer) {
        if preguntas[selectedLabel].posicionRespuesta == imagePositions[3] {
            KVNProgress.show(withStatus: "", on: vista)
            KVNProgress.showSuccess()
            preguntasCorrectas = preguntasCorrectas + 1
        }
        else {
            KVNProgress.show(withStatus: "", on: vista)
            KVNProgress.showError()
        }
        
        disableImage(boolean: false)
        disableNext(boolean: true)
    }
    
    func disableLabel()  {
        for i in 0...3 {
            lbPreguntas[i].isEnabled = false
        }
    }
    
    func disableImage(boolean : Bool) {
        for i in 0...3 {
            imageRespuestas[i].isUserInteractionEnabled = boolean
        }
    }
    
    func disableNext(boolean : Bool){
        btSiguiente.isEnabled = boolean
        btTerminar.isEnabled = boolean
    }
    
    
    // MARK: - Navigation

    @IBAction func randomSegue(_ sender: Any) {
        if numPregunta != 5 {
            self.performSegue(withIdentifier: segueName, sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "quiz1" {
            let viewDestino = segue.destination as! Pregunta1ViewController
            viewDestino.preguntasCorrectas = preguntasCorrectas!
            viewDestino.numPregunta = numPregunta!
        }
        else if segue.identifier == "quiz2" {
            let viewDestino = segue.destination as! Pregunta2ViewController
            viewDestino.preguntasCorrectas = preguntasCorrectas!
            viewDestino.numPregunta = numPregunta!
        }
        else {
            let viewDestino = segue.destination as! inicioQuiz1ViewController
            viewDestino.lbCalificacion.text = "\(preguntasCorrectas * 20)%"
        }
    }

}

