//
//  MinhasListasTableViewCell.swift
//  Projeto Lojas
//
//  Created by admin on 22/10/2018.
//  Copyright © 2018 com.iesb. All rights reserved.
//

import UIKit

protocol MinhasListasDelegate: AnyObject{
    func celulaSelecionada(nome: String?)
}

class MinhasListasTableViewCell: UITableViewCell {
    
    
    
    @IBOutlet weak var nomeLista: UILabel!
    @IBOutlet weak var qtdDeLojas: UILabel!
    
    var nomeLoja: String!
    var delegate: MinhasListasDelegate?
    
    @IBAction func proximaTela(_ sender: Any) {
        nomeLoja = nomeLista.text!
        print("passou primeira vez \(nomeLoja)")
        delegate?.celulaSelecionada(nome: nomeLoja)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
