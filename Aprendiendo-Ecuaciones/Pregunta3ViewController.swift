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
    
    @IBOutlet weak var btSiguiente: UIButton!
    
    var arrPreguntas  = [String]()
    var arrRespuesta = [Int]()
    
    var arregloImagenes : [UIImage] = [UIImage(named: "linealR1")!,UIImage(named: "linealR0")!,UIImage(named: "linealR2")!,UIImage(named: "linealR3")!,UIImage(named: "linealR4")!]
    

    let segues = ["quiz1", "quiz2"]
    var indexSegue : Int!
    var segueName : String!
    var numPregunta : Int!
    var respuestaCorrecta : Int!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        //btSiguiente.isEnabled = false
        
        if numPregunta != nil {
            numPregunta = numPregunta + 1
        }
        else {
            numPregunta = 1
        }
        
        print("NumP \(numPregunta)")
        
        if respuestaCorrecta == nil {
            respuestaCorrecta = 0
        }
        
        
        if numPregunta >= 6 {
            dismiss(animated: true, completion: nil)
            //self.performSegue(withIdentifier: "inicio", sender: self)
            
            print("Entro")
            
        }

        
        indexSegue = Int(arc4random_uniform(UInt32(segues.count)))
        segueName = segues[indexSegue]
    
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
    
    func setPreguntas() {
        var b, m : Int
        var arreglo = [0, 1, 2, 3]
		arreglo = revuelve(arr: arreglo)
        for i in 0...3 {
		
			m = RandomInt(min: -5, max: 5)
			b = RandomInt(min: -5, max: 5)
			
		
			arrPreguntas.append("Y = (\(m)x) + (\(b))" );
			
			lbPreguntas[arreglo[i]].text = arrPreguntas[i]
			
			arrRespuesta.append( verificarRespuesta(m: m,b: b) )
			print(arrRespuesta[i])
			imageRespuestas[i].image = arregloImagenes[arrRespuesta[i]]
			
		}
    }
    
    func verificarRespuesta(m :Int ,b :Int) -> Int {
        
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
	
	//Metodo para revolver los valores de un arreglo aleatoriamente
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
    
    
    func asignarImagen() {
        //Iterador
        var a = 0
        
        //Aux para swap de imagen
        var auxImagePosition : UIImage
        
        //Arreglo con valores de posiciones
        var arreglo = [0, 1, 2, 3]
        
        var random : Int!
        //Auxiliar para swap
        var aux : Int!
    
        while a < 4 {
            random = Int (arc4random_uniform(UInt32(3 - a)))
            aux = arreglo[random]
            
            //Swap imagenes
            auxImagePosition = arregloImagenes[a]
            arregloImagenes[a] = arregloImagenes[aux]
            arregloImagenes[3 - a] = auxImagePosition
            
            //Swap indices
            arreglo[random] = arreglo [3 - a]
            arreglo[3 - a] = aux
            
            //Aumenta contador
            a = a + 1
            
        }
        for i in 0...3{
            imageRespuestas[i].image = arregloImagenes[arreglo[i]]
        }


    }

    @IBAction func randomSegue(_ sender: Any) {
             self.performSegue(withIdentifier: segueName, sender: self)
    }
    
    
    @IBAction func taplbRespuesta1(_ sender: UITapGestureRecognizer) {
        disableLabel()
    }
    
    @IBAction func taplbRespuesta2(_ sender: UITapGestureRecognizer) {
        disableLabel()
    }
    
    @IBAction func taplbRespuesta3(_ sender: UITapGestureRecognizer) {
        disableLabel()
    }
    
    @IBAction func taplbRespuesta4(_ sender: UITapGestureRecognizer) {
        disableLabel()
    }
    
    @IBAction func tapImage1(_ sender: UITapGestureRecognizer) {
        disableImage()
    }
    
    @IBAction func tapImage2(_ sender: UITapGestureRecognizer) {
        disableImage()
    }
    
    @IBAction func tapImage3(_ sender: UITapGestureRecognizer) {
        disableImage()
    }
    
    @IBAction func tapImage4(_ sender: UITapGestureRecognizer) {
        disableImage()
    }
    
    

    func disableLabel()  {
        for i in 0...3 {
            lbPreguntas[i].isEnabled = false
        }
    }
    
    
    func disableImage() {
        
        for i in 0...3 {
        imageRespuestas[i].isUserInteractionEnabled = false
            
        }
        
    }
    

    

    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "quiz1" {
            let vista = segue.destination as! Pregunta1ViewController
            
            vista.numPregunta = numPregunta
            vista.respuestaCorrecta = respuestaCorrecta
        }
        else if segue.identifier == "quiz2" {
            let vista = segue.destination as! Pregunta2ViewController
            
            vista.numPregunta = numPregunta
            vista.respuestaCorrecta = respuestaCorrecta

        }
        else if segue.identifier == "inicio"{
        
            let vista = segue.destination as! inicioQuiz1ViewController
            vista.respuestaCorrecta = respuestaCorrecta
        }
        
        
    }

}

