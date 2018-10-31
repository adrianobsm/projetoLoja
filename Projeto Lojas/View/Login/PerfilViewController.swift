//
//  PerfilViewController.swift
//  Projeto Lojas
//
//  Created by Renê Xavier on 27/09/18.
//  Copyright © 2018 com.iesb. All rights reserved.
//

import UIKit

class PerfilViewController: UITableViewController {

    @IBOutlet weak var numeroListaPerfil: UILabel!
    @IBOutlet weak var emailPerfil: UILabel!
    @IBOutlet weak var telefonePerfil: UILabel!
    @IBOutlet weak var fotoPerfil: UIImageView!
    @IBOutlet weak var NomePerfil: UILabel!
    
    let controller = LoginController()
    
    var email: String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailPerfil.text = email
        numeroListaPerfil.text = controller.retornarNrLista(email)
        
        telefonePerfil.text = controller.retornarTelefone(email)
        fotoPerfil.image = UIImage(named: controller.retornarFoto(email))
        NomePerfil.text = controller.retornarNome(email)
        
    }

}
