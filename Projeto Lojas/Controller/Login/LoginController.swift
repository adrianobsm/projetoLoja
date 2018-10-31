//
//  LoginController.swift
//  Projeto Lojas
//
//  Created by admin on 30/10/2018.
//  Copyright © 2018 com.iesb. All rights reserved.
//

import RealmSwift
import Realm

class LoginController {
    var filtro: String = ""
    
    func login(_ email: String,_ senha: String) -> Bool {
        if email != ""{
            filtro = "email CONTAINS[cd] '" + email + "'"
            do {
                let usuarioEspecifico = try Realm().objects(Usuario.self).filter(filtro)
                if usuarioEspecifico.count == 0 {
                    return false
                } else {
                    if usuarioEspecifico[0].senha == senha{
                        return true
                    } else {
                        return false
                    }
                }
            } catch {
                return false
            }
        } else {
            return false
        }    
    }
    
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

