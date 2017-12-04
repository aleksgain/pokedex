//
//  Pokemon.swift
//  pokedex
//
//  Created by Alex Gain on 10/26/17.
//  Copyright © 2017 Alex Gain. All rights reserved.
//

import Foundation
import Alamofire

class Pokemon {
    
    private var _name: String!
    private var _pokeId: Int!
    private var _description: String!
    private var _type: String!
    private var _defense: String!
    private var _height: String!
    private var _weight: String!
    private var _attack: String!
    private var _nextEvo: String!
    private var _pokemonURL: String!
    
    var name: String {
        return _name
    }
    
    var pokeId: Int {
        return _pokeId
    }
    
    var nextEvo: String {
        if _nextEvo == nil {
            _nextEvo = ""
        }
        return _nextEvo
    }
    
    var attack: String {
        if _attack == nil {
            _attack = ""
            }
        return _attack
    }
    
    var weight: String {
        if _weight == nil {
            _weight = ""
        }
        return _weight
    }
    
    var height: String {
        if _height == nil {
            _height = ""
        }
        return _height
    }
    
    var defense: String {
        if _defense == nil {
            _defense = ""
        }
        return _defense
    }
    
    var type: String {
        if _type == nil {
            _type = ""
        }
        return _type
    }
    
    var description: String {
        if _description == nil {
            _description = ""
        }
        return _description
    }
    
    init(name:String, pokeId: Int) {
        
        self._name = name
        self._pokeId = pokeId
        
        self._pokemonURL = "\(URL_BASE)\(self.pokeId)/"
    
    }

    func downloadPokeDetails(completed: @escaping DownloadComplete) {
        Alamofire.request(_pokemonURL).responseJSON { (response) in
            print(self._pokemonURL)
            
            
            if let dict = response.result.value as? Dictionary<String, AnyObject> {
                if let weight = dict["weight"] as? Int {
                    self._weight = "\(weight)"
                }
                if let height = dict["height"] as? Int {
                    self._height = "\(height)"
                }
                if let stats = dict["stats"] as? [Dictionary<String, AnyObject>], stats.count > 0 {
                        if let stat = stats[4]["stat"] as? Dictionary<String, AnyObject> {
                            if let name = stat["name"] as? String, let score = stats[4]["base_stat"] as? Int, name == "attack" {
                                self._attack = "\(score)"
                            }
                    }
                    if let stat = stats[3]["stat"] as? Dictionary<String, AnyObject>, stat.count > 0  {
                                if let name = stat["name"] as? String, let score = stats[3]["base_stat"] as? Int, name == "defense" {
                                    self._defense = "\(score)"
                                }
                    }
                           
                            
                }
               
                
                print(self._weight)
                print(self._height)
                print(self._attack)
                
                if let types = dict["types"] as? [Dictionary<String,AnyObject>], types.count > 0 {
                    for x in 0..<types.count {
                        if let type = types[x]["type"] as? Dictionary<String,AnyObject> {
                            if let name = type["name"] {
                                if self._type == nil {
                                self._type = name.capitalized
                            } else {
                                self._type.append("/\(name.capitalized!)")
                                }
                            }
                        }
                    }
                

                } else  { self._type = "-"}
            
            }
            
            completed()
        }
        
    }
    
}
