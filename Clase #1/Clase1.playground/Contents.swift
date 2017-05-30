//: Playground - noun: a place where people can play

import UIKit

//Como declarar una variable sin inicializar
var nameWithoutInitialization : String?

//Como declarar una variable sin inicializar
var nameWithInitialization = "Name"

//Como declarar una constante
let nameConstant = "Name"

nameWithoutInitialization = "Varible opcional"

//forma segura de hacer un unwrap
if let nameWithoutInitialization = nameWithoutInitialization {
    print("La variable tiene \(nameWithoutInitialization.characters.count) caracteres")
}

//forma no segura de hacer un unwrap
print("La variable tiene \(nameWithoutInitialization!.characters.count) caracteres")


func explicacionDeUnGuard(value: String?) -> Bool {
    guard let _ = value else {
        return false
    }
    return true
}

enum CampoFaltante: Int {
    case primero = 1,
         segundo = 2
}

func validarCampos(campo1: String?, campo2: String?) -> CampoFaltante? {
    guard let _ = campo1 else {
        return CampoFaltante.primero
    }
    guard let _ = campo2 else {
        return CampoFaltante.segundo
    }
    return nil
}

validarCampos(campo1: nil, campo2: "LLENO")
validarCampos(campo1: "LLENO", campo2: nil)
validarCampos(campo1: "LLENO", campo2: "LLENO")
validarCampos(campo1: nil, campo2: nil)