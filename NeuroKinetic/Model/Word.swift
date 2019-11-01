//
//  Word.swift
//  NeuroKinetic
//
//  Created by Rico Chao on 2019-10-28.
//  Copyright © 2019 teamRANDY. All rights reserved.
//

import Foundation

class Word {    //might not need it
    
    var word: String
    var charCount: Int
    
    init(word: String) {
        self.word = word
        charCount = 0
    }
    
    init() {
        word = ""
        charCount = 0
    }
    
    func getWord() -> String {
        return word
    }
    
    func setWord(typedWord: String) {
        word = typedWord
    }
    
    func getCharCount() -> Int {
        charCount = word.count
        return charCount
    }
    
    func setCharCount(charNum: Int) {
        charCount = charNum
    }
    
}
