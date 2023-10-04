//
//  PrimeraParteViewController.swift
//  Evaluacion
//
//  Created by Owen Rosales Castro on 10/2/23.
//

import UIKit

class PrimeraParteViewController: UIViewController {
    var buttons = [UIButton]()

    let emojis = ["☹️": 1, "🙁": 2, "😐": 3, "🙂": 4, "😊": 5]
    var competenciaUno = 0 // Variable global
    var lastSelectedButton: UIButton? // Variable para almacenar el último botón seleccionado
    
    // Estructura para las preguntas y sus identificadores
        struct Question {
            let id: Int
            let text: String
        }
        
        // Array de preguntas
        var questions = [
            Question(id: 1, text: "¿Cómo te sientes hoy?"),
            Question(id: 2, text: "¿Cuánto disfrutaste la actividad?")
            // Agrega más preguntas según sea necesario
        ]
    
@IBOutlet weak var NadaDeAcuerdo: UIButton!
@IBOutlet weak var PocoDeAcuerdo: UIButton!
@IBOutlet weak var Neutral: UIButton!
@IBOutlet weak var DeAcuerdo: UIButton!
@IBOutlet weak var MuyDeAcuerdo: UIButton!

@IBOutlet weak var Respuesta: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
         
        // Do any additional setup after loading the view.
        //showQuestion(questions[0]) // Mostrar la primera pregunta
        showQuestions()
    }
    func showQuestions() {
            let mainStackView = UIStackView()
            mainStackView.axis = .vertical
            mainStackView.spacing = 20
            mainStackView.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(mainStackView)
            
            NSLayoutConstraint.activate([
                mainStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
                mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50)
            ])
            
            for question in questions {
                let questionStackView = UIStackView()
                questionStackView.axis = .vertical
                questionStackView.alignment = .leading
                questionStackView.spacing = 10
                mainStackView.addArrangedSubview(questionStackView)
                
                let label = UILabel()
                label.text = question.text
                label.numberOfLines = 0
                questionStackView.addArrangedSubview(label)
                
                let orderedOptions = emojis.keys.sorted { emojis[$0]! < emojis[$1]! }
                
                let optionsStackView = UIStackView()
                optionsStackView.axis = .horizontal
                optionsStackView.spacing = 10
                questionStackView.addArrangedSubview(optionsStackView)
                
                for option in orderedOptions {
                    let button = UIButton(type: .system)
                    button.setTitle(option, for: .normal)
                    button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
                    buttons.append(button)
                    optionsStackView.addArrangedSubview(button)
                    button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
                }
            }
        }
    /*func showQuestion(_ question: Question) {
            let orderedOptions = emojis.keys.sorted { emojis[$0]! < emojis[$1]! }
            let buttonWidth: CGFloat = 45
            let buttonHeight: CGFloat = 45
            let spacing: CGFloat = 15
            let totalWidth = CGFloat(emojis.count) * (buttonWidth + spacing) - spacing
        
            let label = UILabel()
            label.text = question.text
            label.frame = CGRect(x: 50, y: 120, width: view.frame.width - 100, height: 30)
            view.addSubview(label)
            
            for (index, option) in orderedOptions.enumerated() {
                let button = UIButton(type: .system)
                button.setTitle(option, for: .normal)
                button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
                buttons.append(button)
                view.addSubview(button)
                
                let xPosition = (view.frame.width - totalWidth) / 2 + CGFloat(index) * (buttonWidth + spacing)
                button.frame = CGRect(x: xPosition, y: 150, width: buttonWidth, height: buttonHeight)
                //index += 1
                //button.titleLabel?.font = UIFont.systemFont(ofSize: 35)
                button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
            }
        }*/
    
    @objc func buttonTapped(_ sender: UIButton) {
            if let lastButton = lastSelectedButton {
                if let title = lastButton.title(for: .normal), let value = emojis[title] {
                    competenciaUno -= value
                    lastButton.isSelected = false
                }
            }
            
            if let title = sender.title(for: .normal), let value = emojis[title] {
                competenciaUno += value
                sender.isSelected = true
                lastSelectedButton = sender
            }
            
            print("El valor de la variable global es ahora \(competenciaUno)")
        }

/*    @IBAction func mostrarRespuesta(_ sender: UITextField) {
        if NadaDeAcuerdo.isSelected{
            Respuesta.text = "Nada de Acuerdo"
        }
    }*/
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
