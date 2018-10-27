//
//  ListaFavoritosController.swift
//  Projeto Lojas
//
//  Created by admin on 26/10/2018.
//  Copyright © 2018 com.iesb. All rights reserved.
//

import RealmSwift
import Realm

class ListaFavoritosController {
    //var todasAsLojas: Results<Loja>?
    //var lojasFiltradas: Results<Loja>?
    var filtro: String = ""
    
    func quantidadeDeLojas() -> Int {
        do {
            let favoritos = try Realm().objects(Favorito.self).filter(filtro)
            return favoritos[0].lojas.count
        } catch {
            return 0
        }
    }
    
    func nomeDaLoja(_ index: Int) -> String {
        
        do {
            let favoritos = try Realm().objects(Favorito.self).filter(filtro)
            return favoritos[0].lojas[index].nome
        } catch {
            return ""
        }
    }
    
    func nomeLogoLoja(_ index: Int) -> String {
        do {
            let favoritos = try Realm().objects(Favorito.self).filter(filtro)
            return favoritos[0].lojas[index].iconePequeno
        } catch {
            return "exit"
        }
    }
    
    func isLojaFavorita(_ index: Int) -> Bool {
        do {
            let favoritos = try Realm().objects(Favorito.self).filter(filtro)
            return favoritos[0].lojas[index].favorita
        } catch {
            return false
        }
    }
    
    func vendeJogos(_ index: Int) -> Bool {
        do {
            let favoritos = try Realm().objects(Favorito.self).filter(filtro)
            return favoritos[0].lojas[index].vendeJogos
        } catch {
            return false
        }
    }
    
    func vendeComputadores(_ index: Int) -> Bool {
        do {
            let favoritos = try Realm().objects(Favorito.self).filter(filtro)
            return favoritos[0].lojas[index].vendeComputador
        } catch {
            return false
        }
    }
    
    func buscarLojas(comNome searchText: String) {
        if searchText == "" {
            filtro = ""
            return
        }
        filtro = "nome CONTAINS[cd] '" + searchText + "'"
    }
}
