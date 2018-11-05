//
//  CadastroTableViewController.swift
//  Projeto Lojas
//
//  Created by Renê Xavier on 06/09/18.
//  Copyright © 2018 com.iesb. All rights reserved.
//

import UIKit

class CadastroTableViewController: UITableViewController {

    @IBOutlet weak var botaoCadastro: UIButton!
    
    
    
    var controller = CadastroController()
    
    @IBOutlet weak var txtIdade: UITextField!
    @IBOutlet weak var txtTelefone: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtNome: UITextField!
    @IBOutlet weak var txtSenha: UITextField!
    @IBAction func cadastrarUsuario(_ sender: Any) {
        var idadeFinal: Int!
        var emailFinal: String = txtEmail.text!
        if txtIdade.text == "" {
            idadeFinal = 0
        }else{
            idadeFinal = Int(txtIdade.text!)
        }
        if controller.cadastrarUsuario(txtNome.text!, "user-logo", txtEmail.text!, txtSenha.text!, txtTelefone.text!, idadeFinal){
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let detalhePerfilVC = storyboard.instantiateViewController(withIdentifier: "perfilView") as! PerfilViewController
            detalhePerfilVC.email = emailFinal
            txtNome.text = ""
            txtEmail.text = ""
            txtSenha.text = ""
            txtTelefone.text=""
            txtIdade.text = ""
            self.navigationController?.popToViewController(detalhePerfilVC, animated: true)
        }else{
            let alert = UIAlertController(title: "Erro de Cadastro", message: "Favor informar novamente", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        botaoCadastro.layer.cornerRadius = 16.5
        txtNome.text = ""
        txtEmail.text = ""
        txtSenha.text = ""
        txtTelefone.text=""
        txtIdade.text = ""
    }

    @IBAction func fecharCadastro() {
        self.dismiss(animated: true, completion: nil)
    }
}
