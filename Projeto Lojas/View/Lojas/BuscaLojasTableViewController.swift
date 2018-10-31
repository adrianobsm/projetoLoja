//
//  BuscaLojasTableViewController.swift
//  Projeto Lojas
//
//  Created by Renê Xavier on 13/09/18.
//  Copyright © 2018 com.iesb. All rights reserved.
//

import UIKit


class BuscaLojasTableViewController: UITableViewController, UISearchBarDelegate, MinhasLojasDelegate {
    
    func celSelecionada(nome: String?) {
        guard let nome = nome else {
            return
        }
        self.nomeCelula = nome
        print("meu segundo teste \(self.nomeCelula!)")
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let detalheFavoritoVC = storyboard.instantiateViewController(withIdentifier: "detalheLojasStoryboardID") as? DetalheLojaTableViewController{
            detalheFavoritoVC.nmLoja = nomeCelula!
            controller.filtro = "nome CONTAINS[cd] '" + self.nomeCelula! + "'"
            detalheFavoritoVC.logo = controller.nomeLogoLojaGrande(0)
            let nomeImagemFavorita = controller.isLojaFavorita(0) ? "liked" : "like"
            detalheFavoritoVC.likeB = nomeImagemFavorita
            self.navigationController?.pushViewController(detalheFavoritoVC, animated: true)
        }
    }
    
    var nomeCelula: String!
    var nomeLogoCel: String!
    
    @IBOutlet weak var searchBar: UISearchBar!
    let controller = BuscaLojasController()
    
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.reloadData()
        searchBar.delegate = self
    }
    
    // MARK: - SearchBar Delegate
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        controller.buscarLojas(comNome: searchText)
        tableView.reloadData()
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return controller.quantidadeDeLojas()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "lojasCellIdentifier", for: indexPath)
        if let cellLoja = cell as? LojaTableViewCell {
            cellLoja.delegate = self
            cellLoja.nomeLoja.text = controller.nomeDaLoja(indexPath.row)
            cellLoja.logoLoja.image = UIImage(named: controller.nomeLogoLoja(indexPath.row))
            let nomeImagemFavorita = controller.isLojaFavorita(indexPath.row) ? "liked" : "like"
            let imagemLike = UIImage(named: nomeImagemFavorita)
            //print(nomeImagemFavorita)
            cellLoja.likeButton.setImage(imagemLike, for: .normal)
            
            cellLoja.vendeJogos.image = controller.vendeJogos(indexPath.row) ? UIImage(named: "video-game") : nil
            cellLoja.vendeComputador.image = controller.vendeComputadores(indexPath.row) ? UIImage(named: "pc") : nil
            
            return cellLoja
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
}
