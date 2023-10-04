//
//  SegundaParteViewController.swift
//  Evaluacion
//
//  Created by Owen Rosales Castro on 10/2/23.
//

import UIKit

class SegundaParteViewController: UIViewController {
        var buttons = [UIButton]()

        let emojis = ["☹️": 1, "🙁": 2, "😐": 3, "🙂": 4, "😊": 5]
        var competenciaUno = 0 // Variable global
        var lastSelectedButton: UIButton? // Variable para almacenar el último botón seleccionado
        
    @IBOutlet weak var StackPReguntas: UIStackView!
    
    // Estructura para las preguntas y sus identificadores
            struct Question {
                let id: Int
                let text: String
            }
            
            // Array de preguntas
            var questions = [
                Question(id: 1, text: "¿Cómo te sientes hoy?"),
                Question(id: 2, text: "¿Cuánto disfrutaste la actividad?"),
                Question(id: 3, text: "¿Cuánto disfrutaste la actividad?"),
                Question(id: 4, text: "¿Cuánto disfrutaste la actividad?"),
                Question(id: 5, text: "¿Cuánto disfrutaste la actividad?"),
                Question(id: 6, text: "¿Cuánto disfrutaste la actividad?"),
                Question(id: 7, text: "¿Cuánto disfrutaste la actividad?"),
                Question(id: 8, text: "¿Cuánto disfrutaste la actividad?"),
                // Agrega más preguntas según sea necesario
            ]
        
        override func viewDidLoad() {
            super.viewDidLoad()
             
            // Do any additional setup after loading the view.
            //showQuestion(questions[0]) // Mostrar la primera pregunta
            showQuestions()
            
        }
    
        func showQuestions() {
                //let mainStackView = UIStackView()
            StackPReguntas.axis = .vertical
            StackPReguntas.spacing = 20
            StackPReguntas.translatesAutoresizingMaskIntoConstraints = false
                view.addSubview(StackPReguntas)
                
                NSLayoutConstraint.activate([
                    StackPReguntas.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
                    StackPReguntas.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50)
                ])
                
                for question in questions {
                    let questionStackView = UIStackView()
                    questionStackView.axis = .vertical
                    questionStackView.alignment = .leading
                    questionStackView.spacing = 10
                    StackPReguntas.addArrangedSubview(questionStackView)
                    
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

        
        
        /*
        // MARK: - Navigation

        // In a storyboard-based application, you will often want to do a little preparation before navigation
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            // Get the new view controller using segue.destination.
            // Pass the selected object to the new view controller.
        }
        */

    }
