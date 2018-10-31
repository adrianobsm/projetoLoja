//
//  ListaProdutosController.swift
//  Projeto Lojas
//
//  Created by admin on 30/10/2018.
//  Copyright © 2018 com.iesb. All rights reserved.
//

import RealmSwift
import Realm

class ListaProdutosController {
    //var todasAsLojas: Results<Loja>?
    //var lojasFiltradas: Results<Loja>?
    var filtro: String = ""
    
    func quantidadeDeProdutos() -> Int {
        do {
            let favoritos = try Realm().objects(Loja.self).filter(filtro)
            //print(favoritos[0].produtos.count)
            return favoritos[0].produtos.count
        } catch {
            return 0
        }
    }
    
    func nomeDaProduto(_ index: Int) -> String {
        
        do {
            let favoritos = try Realm().objects(Loja.self).filter(filtro)
            return favoritos[0].produtos[index].titulo
        } catch {
            return ""
        }
    }
    
    func descricaoDaProduto(_ index: Int) -> String {
        
        do {
            let favoritos = try Realm().objects(Loja.self).filter(filtro)
            return favoritos[0].produtos[index].descricao
        } catch {
            return ""
        }
    }
    
    func nomeLogoLoja(_ index: Int) -> String {
        do {
            let favoritos = try Realm().objects(Loja.self).filter(filtro)
            return favoritos[0].produtos[index].imagem
        } catch {
            return "exit"
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

