//
//  MusicPlayer.swift
//  pokedex
//
//  Created by Alex Gain on 11/1/17.
//  Copyright © 2017 Alex Gain. All rights reserved.
//

import Foundation
import AVFoundation

var musicPlayer: AVAudioPlayer!

func initAudio() {
    let path = Bundle.main.path(forResource: "music", ofType: "mp3")
    do {
        musicPlayer = try AVAudioPlayer(contentsOf: URL(string: path!)!)
        musicPlayer.prepareToPlay()
        musicPlayer.numberOfLoops = -1
        musicPlayer.play()
    } catch let err as NSError {
        print(err.debugDescription)
    }
}
