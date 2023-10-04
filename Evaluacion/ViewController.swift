//
//  ViewController.swift
//  Evaluacion
//
//  Created by Owen Rosales Castro on 10/1/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}

var preguntas: [Pregunta] = [
    Pregunta(pregunta: "¿Pregunta 1?", respuestas: ["Respuesta 1", "Respuesta 2", "Respuesta 3"]),
    Pregunta(pregunta: "¿Pregunta 2?", respuestas: ["Respuesta 1", "Respuesta 2", "Respuesta 3"]),
    // Agrega más preguntas según sea necesario
]

