//
//  MinhasListasTableViewCell.swift
//  Projeto Lojas
//
//  Created by admin on 22/10/2018.
//  Copyright © 2018 com.iesb. All rights reserved.
//

import UIKit

class MinhasListasTableViewCell: UITableViewCell {

    @IBOutlet weak var nomeLista: UILabel!
    @IBOutlet weak var qtdDeLojas: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
