//
//  Pregunta.swift
//  Aprendiendo-Ecuaciones
//
//  Created by Edgardo Acosta on 14/11/16.
//  Copyright © 2016 Edgardo Acosta. All rights reserved.
//

import UIKit

class Pregunta: NSObject {

    var label : UILabel
    var posicionRespuesta : Int
    
    init(label: UILabel, posicion: Int) {
        self.label = label
        self.posicionRespuesta = posicion
    }
}
