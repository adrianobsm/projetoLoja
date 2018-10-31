//
//  MinhasListasTableViewController.swift
//  Projeto Lojas
//
//  Created by admin on 22/10/2018.
//  Copyright © 2018 com.iesb. All rights reserved.
//

import UIKit

class MinhasListasTableViewController: UITableViewController, UITabBarDelegate, MinhasListasDelegate {
    
    func celulaSelecionada(nome: String?) {
        guard let nome = nome else {
            return
        }
        self.nomeCelula = nome
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let detalheFavoritoVC = storyboard.instantiateViewController(withIdentifier: "ListaLojasIDVC") as? FavoritoDetalheViewController{
            detalheFavoritoVC.texto = nome
            self.navigationController?.pushViewController(detalheFavoritoVC, animated: true)
        }
    }
    
    
    
    
    let controller = MinhasListasController()
    var nomeCelula: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.reloadData()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if controller.quantidadeDeFavoritos()==0{
            return 1
        } else {
            return controller.quantidadeDeFavoritos()
        }
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if controller.quantidadeDeFavoritos()==0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cadastrarNovasListasCellIdentifier", for: indexPath)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "minhasListasCellIdentifier", for: indexPath)
            if let cellLoja = cell as? MinhasListasTableViewCell {
                cellLoja.delegate = self
                cellLoja.nomeLista.text = controller.nomeFavorito(indexPath.row)
                cellLoja.qtdDeLojas.text = controller.quantidadeLojasFavoritasLista(indexPath.row)
                
                return cellLoja
            }
            return cell
        }
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if controller.quantidadeDeFavoritos()==0 {
            return 400
        }else{
            return 120
        }
    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        //print(indexPath.row)
//        print("meu terceiro teste \(self.nomeCelula)")
//        if segue.identifier == "ListaViewControllerSegue", let viewControllerB = segue.destination as? FavoritoDetalheViewController{
//            print(nomeCelula ?? "teste")
//            viewControllerB.texto = nomeCelula
//        }
//    }
    
}
