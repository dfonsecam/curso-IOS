import UIKit

//R1
var word : String = "Prueba"

//R2
let number : Int = 3

//R3
var wordOptional : String?

//R4
//En este caso se ejecuta la instrucción let para
//hacer el unwrap de forma segura sin el uso de !
//Si el unwrap se ejecuta de forma exitosa, la ejecución
//continúa en el print, caso contrario ignora ese bloque
if let wordOptional = wordOptional {
    print(wordOptional)
}


