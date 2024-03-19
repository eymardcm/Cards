//
//  PlaySounds.swift
//  Cards
//
//  Created by Chad Eymard on 3/18/24.
//

import SwiftUI
import AVFoundation

var audioPlayer: AVAudioPlayer?

func playSound(sound: String, type: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        } catch {
            print("Failed to find and play sound file \(sound).\(type)")
        }
    }
}
