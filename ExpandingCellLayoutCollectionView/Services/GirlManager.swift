//
//  GirlManager.swift
//  ExpandingCellLayoutCollectionView
//
//  Created by Harry Cao on 30/8/17.
//  Copyright © 2017 Harry Cao. All rights reserved.
//

import UIKit

class GirlManager {
  private init() {}
  
  static let shared = GirlManager()
  
  private func getGirls0() -> [Girl] {
    let girls = [
      Girl(with: ["name": "Sofia" , "quote": "Podrá nublarse el sol eternamente", "image": #imageLiteral(resourceName: "pic0")]),
      Girl(with: ["name": "Isabella", "quote": "Quiero un paquete de galletas", "image": #imageLiteral(resourceName: "pic1")]),
      Girl(with: ["name": "Valentina", "quote": "Lo siento mucho, pero no estoy libre", "image": #imageLiteral(resourceName: "pic2")]),
      Girl(with: ["name": "Camila", "quote": "Quiero ver el menú, por favor", "image": #imageLiteral(resourceName: "pic3")]),
      Girl(with: ["name": "Valeria", "quote": "No me gusta la historia", "image": #imageLiteral(resourceName: "pic4")]),
      Girl(with: ["name": "Luciana", "quote": "Sólo curioso, gracias", "image": #imageLiteral(resourceName: "pic5")]),
      Girl(with: ["name": "María José", "quote": "Quiero hacer una llamada a cobro revertido", "image": #imageLiteral(resourceName: "pic6")]),
      Girl(with: ["name": "Victoria", "quote": "¿Dónde estan los cubos de basura?", "image": #imageLiteral(resourceName: "pic7")]),
      Girl(with: ["name": "Martina", "quote": "Está el correos abierto mañana", "image": #imageLiteral(resourceName: "pic8")]),
      Girl(with: ["name": "Gabriela", "quote": "Hay otro hotel cerca de aquí", "image": #imageLiteral(resourceName: "pic9")]),
      Girl(with: ["name": "Samantha", "quote": "Cuánto tiempo dure", "image": #imageLiteral(resourceName: "pic10")]),
      Girl(with: ["name": "Natalia", "quote": "Mi coche se he descompuesto", "image": #imageLiteral(resourceName: "pic11")]),
      Girl(with: ["name": "Antonella", "quote": "He aquí una prescripción para algunas", "image": #imageLiteral(resourceName: "pic12")]),
      Girl(with: ["name": "Regina", "quote": "Tienes una mesa para seis personas", "image": #imageLiteral(resourceName: "pic13")]),
      Girl(with: ["name": "Fernanda", "quote": "Choqué con el camión", "image": #imageLiteral(resourceName: "pic14")]),
      Girl(with: ["name": "Georgina", "quote": "Asegurad vuestros cinturones de seguridad", "image": #imageLiteral(resourceName: "pic15")]),
      ]
    
    return girls
  }
  
  private func getGirls1() -> [Girl] {
    let girls = [
      Girl(with: ["name": "María José", "quote": "Quiero hacer una llamada a cobro revertido", "image": #imageLiteral(resourceName: "pic6")]),
      Girl(with: ["name": "Victoria", "quote": "¿Dónde estan los cubos de basura?", "image": #imageLiteral(resourceName: "pic7")]),
      Girl(with: ["name": "Martina", "quote": "Está el correos abierto mañana", "image": #imageLiteral(resourceName: "pic8")]),
      Girl(with: ["name": "Regina", "quote": "Tienes una mesa para seis personas", "image": #imageLiteral(resourceName: "pic13")]),
      Girl(with: ["name": "Fernanda", "quote": "Choqué con el camión", "image": #imageLiteral(resourceName: "pic14")]),
      Girl(with: ["name": "Georgina", "quote": "Asegurad vuestros cinturones de seguridad", "image": #imageLiteral(resourceName: "pic15")]),
      Girl(with: ["name": "Isabella", "quote": "Quiero un paquete de galletas", "image": #imageLiteral(resourceName: "pic1")]),
      Girl(with: ["name": "Valentina", "quote": "Lo siento mucho, pero no estoy libre", "image": #imageLiteral(resourceName: "pic2")]),
      Girl(with: ["name": "Gabriela", "quote": "Hay otro hotel cerca de aquí", "image": #imageLiteral(resourceName: "pic9")]),
      Girl(with: ["name": "Sofia" , "quote": "Podrá nublarse el sol eternamente", "image": #imageLiteral(resourceName: "pic0")]),
      Girl(with: ["name": "Samantha", "quote": "Cuánto tiempo dure", "image": #imageLiteral(resourceName: "pic10")]),
      Girl(with: ["name": "Natalia", "quote": "Mi coche se he descompuesto", "image": #imageLiteral(resourceName: "pic11")]),
      Girl(with: ["name": "Luciana", "quote": "Sólo curioso, gracias", "image": #imageLiteral(resourceName: "pic5")]),
      ]
    
    return girls
  }
  
  private func getGirls2() -> [Girl] {
    let girls = [
      Girl(with: ["name": "Regina", "quote": "Tienes una mesa para seis personas", "image": #imageLiteral(resourceName: "pic13")]),
      Girl(with: ["name": "Fernanda", "quote": "Choqué con el camión", "image": #imageLiteral(resourceName: "pic14")]),
      Girl(with: ["name": "Camila", "quote": "Quiero ver el menú, por favor", "image": #imageLiteral(resourceName: "pic3")]),
      Girl(with: ["name": "Valeria", "quote": "No me gusta la historia", "image": #imageLiteral(resourceName: "pic4")]),
      Girl(with: ["name": "Valentina", "quote": "Lo siento mucho, pero no estoy libre", "image": #imageLiteral(resourceName: "pic2")]),
      Girl(with: ["name": "María José", "quote": "Quiero hacer una llamada a cobro revertido", "image": #imageLiteral(resourceName: "pic6")]),
      Girl(with: ["name": "Martina", "quote": "Está el correos abierto mañana", "image": #imageLiteral(resourceName: "pic8")]),
      Girl(with: ["name": "Natalia", "quote": "Mi coche se he descompuesto", "image": #imageLiteral(resourceName: "pic11")]),
      Girl(with: ["name": "Antonella", "quote": "He aquí una prescripción para algunas", "image": #imageLiteral(resourceName: "pic12")]),
      Girl(with: ["name": "Victoria", "quote": "¿Dónde estan los cubos de basura?", "image": #imageLiteral(resourceName: "pic7")]),
      Girl(with: ["name": "Luciana", "quote": "Sólo curioso, gracias", "image": #imageLiteral(resourceName: "pic5")]),
      Girl(with: ["name": "Gabriela", "quote": "Hay otro hotel cerca de aquí", "image": #imageLiteral(resourceName: "pic9")]),
      Girl(with: ["name": "Sofia" , "quote": "Podrá nublarse el sol eternamente", "image": #imageLiteral(resourceName: "pic0")]),
      Girl(with: ["name": "Samantha", "quote": "Cuánto tiempo dure", "image": #imageLiteral(resourceName: "pic10")]),
      ]
    
    return girls
  }
  
  public func getGirls() -> [Girl] {
    let random = arc4random_uniform(3)
    
    if random == 0 {
      return getGirls0()
    } else if random == 1 {
      return getGirls1()
    } else {
      return getGirls2()
    }
  }
}
