//
//  MinhasListasController.swift
//  Projeto Lojas
//
//  Created by admin on 22/10/2018.
//  Copyright © 2018 com.iesb. All rights reserved.
//

import RealmSwift
import Realm

class MinhasListasController {
    var todasAsLojas: Results<Favorito>?
    
    
    
    func quantidadeDeFavoritos() -> Int {
        do {
            return try Realm().objects(Favorito.self).count
        } catch {
            return 0
        }
    }
    
    func nomeFavorito(_ index: Int) -> String {
        do {
            return try Realm().objects(Favorito.self)[index].nome
        } catch {
            return ""
        }
    }
    
    func quantidadeLojasFavoritasLista(_ index: Int) -> String {
        do {
            let totalDeLojas =  try Realm().objects(Favorito.self)[index].lojas.count
            return  "\(totalDeLojas) lojas"
        } catch {
            return "0 Lojas"
        }
    }
}
