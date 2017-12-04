//
//  PokeCell.swift
//  pokedex
//
//  Created by Alex Gain on 10/27/17.
//  Copyright © 2017 Alex Gain. All rights reserved.
//

import UIKit

class PokeCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbImg: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    
    var pokemon: Pokemon!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layer.cornerRadius = 5.0
    }
    
    func configCell(pokemon: Pokemon) {
        
        self.pokemon = pokemon
        nameLbl.text = self.pokemon.name.capitalized
        thumbImg.image = UIImage(named: "\(pokemon.pokeId)")
        
    }
    
}
