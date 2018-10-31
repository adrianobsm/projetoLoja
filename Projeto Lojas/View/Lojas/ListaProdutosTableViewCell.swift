//
//  ListaProdutosTableViewCell.swift
//  Projeto Lojas
//
//  Created by admin on 30/10/2018.
//  Copyright © 2018 com.iesb. All rights reserved.
//

import UIKit

class ListaProdutosTableViewCell: UITableViewCell {

    @IBOutlet weak var imagemProduto: UIImageView!
    @IBOutlet weak var nomeProduto: UILabel!
    @IBOutlet weak var descricaoProduto: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
