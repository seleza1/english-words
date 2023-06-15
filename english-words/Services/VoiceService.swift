//
//  VoiceService.swift
//  english-words
//
//  Created by user on 15.06.2023.
//

import Foundation
import AVFoundation

final class VoiceService: NSObject {

    static let shared = VoiceService()

    let synthesizer = AVSpeechSynthesizer()

    var isSpeaking: Bool = false

    private override init() {
        super.init()
        synthesizer.delegate = self
    }

    func speakWord(word: String) {
        let utterance = AVSpeechUtterance(string: word)
        utterance.voice = AVSpeechSynthesisVoice(language: "com.apple.eloquence.en-US.Eddy")

        if !isSpeaking {
            synthesizer.speak(utterance)
        }
    }
}

extension VoiceService: AVSpeechSynthesizerDelegate {
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didStart utterance: AVSpeechUtterance) {
        isSpeaking = true
    }

    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
        isSpeaking = false
    }
}

