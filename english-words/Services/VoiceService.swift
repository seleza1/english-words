//
//  VoiceService.swift
//  english-words
//
//  Created by user on 15.06.2023.
//

import Foundation
import AVFoundation

final class VoiceService {

    static let shared = VoiceService()

    func speakWord(word: String) {
        let synthesizer = AVSpeechSynthesizer()
        let utterance = AVSpeechUtterance(string: word)
        utterance.voice = AVSpeechSynthesisVoice(language: "com.apple.eloquence.en-US.Eddy")

        synthesizer.speak(utterance)
    }
}

