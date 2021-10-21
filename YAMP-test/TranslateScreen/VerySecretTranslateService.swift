import Foundation

enum VerySecretTranslateServiceError: Error {
    case iDontKnowWhatHappend
}

class VerySecretTranslateService {

    typealias TranslateCompletion = (String?, VerySecretTranslateServiceError?) -> Void
    let translateQueue: DispatchQueue = DispatchQueue(label: "TranslateQueue")

    func translate(_ text: String, completion: @escaping TranslateCompletion) {
        translateQueue.async {
            guard text.count > 0 else {
                completion(nil, .iDontKnowWhatHappend)
                return
            }

            let words = text.components(separatedBy: " ")

            var convertedWords: [String] = []

            DispatchQueue.concurrentPerform(iterations: words.count) { index in
                convertedWords.append(magic(words[index]))
            }

            var result: String = ""

            for convertedWord in convertedWords {
                if convertedWord == convertedWords[0] {
                    result += convertedWord
                } else {
                    result += " "
                    result += convertedWord
                }
            }

            DispatchQueue.main.async {
                completion(result, nil)
            }
        }
    }
}
