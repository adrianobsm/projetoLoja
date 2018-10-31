//
//  PerfilController.swift
//  Projeto Lojas
//
//  Created by admin on 30/10/2018.
//  Copyright © 2018 com.iesb. All rights reserved.
//

import RealmSwift
import Realm

class CadastroController {
    
    func cadastrarUsuario(_ nome: String,_ foto: String,_ email: String,_ senha: String,_ telefone: String,_ idade: Int) -> Bool {
        do {
            var filtro = "email CONTAINS[cd] '" + email + "'"
            let usuarioEspecifico = try Realm().objects(Usuario.self).filter(filtro)
            if usuarioEspecifico.count == 0 {
                let realm = try! Realm()
                let usuario = Usuario(nome: nome, foto: foto, email: email, senha: senha, telefone: telefone, idade: idade)
                try! realm.write {
                    realm.add(usuario)
                }
                return true
            }else {
                return false
            }
        } catch {
            return false
        }
    }
}
