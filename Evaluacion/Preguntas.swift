//
//  Preguntas.swift
//  Evaluacion
//
//  Created by Owen Rosales Castro on 10/2/23.
//

import Foundation

class Pregunta {
    var pregunta: String
    var respuestas: [String]
    
    init(pregunta: String, respuestas: [String]) {
        self.pregunta = pregunta
        self.respuestas = respuestas
    }
}
