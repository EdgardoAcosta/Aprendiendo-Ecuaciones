//
//  Pregunta3LogaritmicaViewController.swift
//  Aprendiendo-Ecuaciones
//
//  Created by Edgardo Acosta on 23/11/16.
//  Copyright © 2016 Edgardo Acosta. All rights reserved.
//

import UIKit
import KVNProgress

class Pregunta3LogaritmicaViewController: UIViewController {

    
    @IBOutlet var lbPreguntas: [UILabel]!
    
    @IBOutlet var imageRespuestas: [UIImageView]!
    
    @IBOutlet weak var btSiguiente: UIButton!
    
    @IBOutlet weak var btTerminar: UIButton!
    
    

    
    @IBOutlet var vista: UIView!
    
    var preguntas : [Pregunta]! = []
    
    var arregloImagenes : [UIImage] = [UIImage(named: "L1")!,UIImage(named: "L2")!,UIImage(named: "L3")!,UIImage(named: "L4")!,UIImage(named: "L5")!,UIImage(named: "L6")!,UIImage(named: "L7")!,UIImage(named: "L8")!,UIImage(named: "L9")!,UIImage(named: "L10")!,UIImage(named: "L11")!,UIImage(named: "L12")!]
    
    let segues = ["quiz1", "quiz2"]
    
    var indexSegue : Int!
    var segueName : String!
    
    var numPregunta : Int!
    var preguntasCorrectas: Int!
    
    var selectedLabel : Int!
    var imagePositions = [Int]()
    var log : Bool = false

    
    // MARK: - General
    override func viewDidLoad() {
        super.viewDidLoad()
        //KVNProgress.configuration().minimumDisplayTime = 0.2

        //btSiguiente.isEnabled = false
        disableImage(boolean: false)
        
        
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
        
        
        if numPregunta == 5 {
            btSiguiente.isHidden = true
            btTerminar.isHidden = false
        }

        disableNext(boolean: false)
        
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
        var x, a : Int!
        var indiceRespuesta : Int!
        let posicionRespuestaImg = Int(arc4random_uniform(UInt32(3)))
        var random : Int!
        
        //Crea las ecuaciones aleatorias
        for i in 0...3 {
            if Int(arc4random_uniform(UInt32(1))) == 1{
                x = RandomInt(min: 1, max: 5)
            }
            else{
                x = RandomInt(min: -5, max: -1)
                
            }
            
            a = RandomInt(min: -5, max: 5)
            
            if Int(arc4random_uniform(UInt32(1))) == 1{
                 lbPreguntas[i].text = "Y = (-log\(x!)) + (\(a!))"
                log = true
            }
            else{
                 lbPreguntas[i].text = "Y = (log\(x!)) + (\(a!))"
            }
            
            indiceRespuesta = verificarRespuesta(x: x, a: a)
            
            let pregunta = Pregunta(label: lbPreguntas[i], posicion: indiceRespuesta)
            preguntas.append(pregunta)
            
            random = Int(arc4random_uniform(UInt32(11)))
            imageRespuestas[i].image = arregloImagenes[random]
            imagePositions.append(random)
        }
        
        random = Int(arc4random_uniform(UInt32(3)))
                imagePositions[posicionRespuestaImg] = preguntas[random].posicionRespuesta
        imageRespuestas[posicionRespuestaImg].image = arregloImagenes[preguntas[random].posicionRespuesta]
    }
    
    func verificarRespuesta(x: Int, a: Int) -> Int {
        
        var pos : Int = 0
        if !log && x > 0 && a == 0 { //L1
            pos = 0
        }
        else if log && x > 0 && a == 0{ //L2
            pos = 1
        }
        else if !log && x < 0 && a == 0{ //L3
            pos = 2
        }
        else if log && x < 0 && a > 0{ //L4
            pos = 3
        }
            
        else if log && x > 0 && a < 0{ //L5
            pos = 4
        }
        else if log && x < 0 && a < 0 { //L6
            pos = 5
        }
        else if !log && x > 0 && a < 0 { //L7
            pos = 6
        }
        else if !log && x > 0 && a > 0 { //L8
            pos = 7
        }
        else if log && x > 0 && a > 0 { //L9
            pos = 8
        }
        else if log && x < 0 && a == 0 { //L10
            pos = 9
        }
        else  if !log && x < 0 && a > 0{ //L11
            pos = 10
        }
        else if !log && x < 0 && a < 0 { //L12
            pos = 11
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
            lbPreguntas[i].isUserInteractionEnabled = false

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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "quiz2" {
            let viewDestino = segue.destination as! Pregunta2LogaritmicaViewController
            viewDestino.preguntasCorrectas = preguntasCorrectas!
            viewDestino.numPregunta = numPregunta!
        }
            
        else if( segue.identifier == "quiz1") {
            let viewDestino = segue.destination as! Pregunta1LogaritmicaViewController
            viewDestino.preguntasCorrectas = preguntasCorrectas!
            viewDestino.numPregunta = numPregunta!
        }
        else {
            let viewDestino = segue.destination as! iniciarQuiz2ViewController
            viewDestino.lbCalificacion.text = "\(preguntasCorrectas * 20)%"

        }
    }
    
}
