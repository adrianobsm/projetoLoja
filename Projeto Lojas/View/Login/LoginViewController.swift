//
//  LoginViewController.swift
//  Projeto Lojas
//
//  Created by Renê Xavier on 27/09/18.
//  Copyright © 2018 com.iesb. All rights reserved.
//

import UIKit

class LoginViewController: UITableViewController {
    
    let controller = LoginController()

    @IBOutlet weak var senhaTexto: UITextField!
    @IBOutlet weak var emailTexto: UITextField!
    @IBAction func EntrarAction(_ sender: Any) {
        var auxSenha = senhaTexto.text!
        var auxEmail = emailTexto.text!
        if controller.login(auxEmail, auxSenha){
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if let detalheFavoritoVC = storyboard.instantiateViewController(withIdentifier: "perfilView") as? PerfilViewController{
                detalheFavoritoVC.email = auxEmail
                self.navigationController?.pushViewController(detalheFavoritoVC, animated: true)
            }
        } else {
            let alert = UIAlertController(title: "Erro de Login", message: "Favor informar novamente", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
    }
    
    @IBOutlet weak var viewLogo: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        senhaTexto.text = ""
        emailTexto.text = ""
    }

}
