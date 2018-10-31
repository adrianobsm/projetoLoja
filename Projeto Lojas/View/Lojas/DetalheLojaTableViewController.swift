//
//  DetalheLojaTableViewController.swift
//  Projeto Lojas
//
//  Created by admin on 30/10/2018.
//  Copyright © 2018 com.iesb. All rights reserved.
//

import UIKit

class DetalheLojaTableViewController: UITableViewController {

    @IBOutlet weak var likeButton: UIImageView!
    @IBOutlet weak var nomeLojaInput: UILabel!
    @IBOutlet weak var logoLoja: UIImageView!
    var likeB: String!
    var nmLoja: String!
    var logo: String!
    
    let controller = ListaProdutosController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nomeLojaInput.text = nmLoja!
        logoLoja.image = UIImage(named: logo)
        likeButton.image = UIImage(named: likeB)
        controller.buscarLojas(comNome: nmLoja!)
        self.tableView.reloadData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return controller.quantidadeDeProdutos()
    }

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listaProdutosCell", for: indexPath)
        if let cellLoja = cell as? ListaProdutosTableViewCell {
            cellLoja.nomeProduto.text = controller.nomeDaProduto(indexPath.row)
            cellLoja.imagemProduto.image = UIImage(named: controller.nomeLogoLoja(indexPath.row))
            cellLoja.descricaoProduto.text = controller.descricaoDaProduto(indexPath.row)
            return cellLoja
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
    

}
