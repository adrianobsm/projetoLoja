//
//  PerfilController.swift
//  Projeto Lojas
//
//  Created by admin on 30/10/2018.
//  Copyright © 2018 com.iesb. All rights reserved.
//

import RealmSwift
import Realm

class PerfilController {
    var filtro: String = ""
    
    func retornarNome(_ email: String) -> String {
        filtro = "email CONTAINS[cd] '" + email + "'"
        do {
            let usuarioEspecifico = try Realm().objects(Usuario.self).filter(filtro)
            return usuarioEspecifico[0].nome
        } catch {
            return ""
        }
    }
    func retornarFoto(_ email: String) -> String {
        filtro = "email CONTAINS[cd] '" + email + "'"
        do {
            let usuarioEspecifico = try Realm().objects(Usuario.self).filter(filtro)
            return usuarioEspecifico[0].foto
        } catch {
            return "exit"
        }
    }
    func retornarTelefone(_ email: String) -> String {
        filtro = "email CONTAINS[cd] '" + email + "'"
        do {
            let usuarioEspecifico = try Realm().objects(Usuario.self).filter(filtro)
            return usuarioEspecifico[0].telefone
        } catch {
            return ""
        }
    }
    func retornarNrLista(_ email: String) -> String {
        filtro = "email CONTAINS[cd] '" + email + "'"
        do {
            let usuarioEspecifico = try Realm().objects(Usuario.self).filter(filtro)
            return  "\(usuarioEspecifico[0].listasFavoritos.count) Lista(s)"
        } catch {
            return "0 Lista(s)"
        }
    }
}
