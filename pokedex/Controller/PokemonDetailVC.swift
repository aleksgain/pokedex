//
//  PokemonDetailVC.swift
//  pokedex
//
//  Created by Alex Gain on 11/1/17.
//  Copyright © 2017 Alex Gain. All rights reserved.
//

import UIKit
import AVFoundation

class PokemonDetailVC: UIViewController {

    var pokemon: Pokemon!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var defenseLabel: UILabel!
    @IBOutlet weak var indexLabel: UILabel!
    @IBOutlet weak var attackLabel: UILabel!
    @IBOutlet weak var evoLabel: UILabel!
    @IBOutlet weak var beforeImg: UIImageView!
    @IBOutlet weak var afterImg: UIImageView!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = pokemon.name
        
        let img = UIImage(named: "\(pokemon.pokeId)")
        mainImg.image = img
        beforeImg.image = img
        
        pokemon.downloadPokeDetails() {
            //put download code here
            self.updateUI()
        }

    }
    
    func updateUI() {
        typeLabel.text = pokemon.type
        attackLabel.text = pokemon.attack
        defenseLabel.text = pokemon.defense
        heightLabel.text = pokemon.height
        weightLabel.text = pokemon.weight
        indexLabel.text = "\(pokemon.pokeId)"
        
    }

    @IBAction func backBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func musicBtn(_ sender: UIButton) {
        if  musicPlayer.isPlaying {
            musicPlayer.pause()
            sender.alpha = 0.2
        }
        else {
            musicPlayer.play()
            sender.alpha = 1.0
        }
    }

}
