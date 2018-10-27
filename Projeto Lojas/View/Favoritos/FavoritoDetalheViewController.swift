//
//  FavoritoDetalheViewController.swift
//  Projeto Lojas
//
//  Created by Renê Xavier on 27/09/18.
//  Copyright © 2018 com.iesb. All rights reserved.
//

import UIKit

class FavoritoDetalheViewController: UITableViewController {
    
    @IBOutlet weak var labelNome: UILabel!
    
    var texto: String!
    let controller = ListaFavoritosController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("meu quarto teste \(texto!)")
        labelNome.text = texto! //Fones"//
        controller.buscarLojas(comNome: texto!)
        self.tableView.reloadData()
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return controller.quantidadeDeLojas()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "lojasCellIdentifier", for: indexPath)
        if let cellLoja = cell as? LojaTableViewCell {
            cellLoja.nomeLoja.text = controller.nomeDaLoja(indexPath.row)
            cellLoja.logoLoja.image = UIImage(named: controller.nomeLogoLoja(indexPath.row))
            let nomeImagemFavorita = controller.isLojaFavorita(indexPath.row) ? "liked" : "like"
            let imagemLike = UIImage(named: nomeImagemFavorita)
            //let imagemBotao = UIImageView(image: imagemLike)
            cellLoja.likeButton.imageView?.image = imagemLike

            cellLoja.vendeJogos.image = controller.vendeJogos(indexPath.row) ? UIImage(named: "video-game") : nil
            cellLoja.vendeComputador.image = controller.vendeComputadores(indexPath.row) ? UIImage(named: "pc") : nil
//
            return cellLoja
       }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
}
