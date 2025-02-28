import Foundation

public struct HanziPinyinConverter {
    private static var pinyinDictionary: [String: [String]] = [:]

    // Load JSON from bundle
    public static func loadPinyinData() {
        guard let url = Bundle.module.url(forResource: "hanzi_pinyin", withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let json = try? JSONDecoder().decode([String: [String]].self, from: data) else {
            print("Failed to load Hanzi-Pinyin dictionary.")
            return
        }
        pinyinDictionary = json
    }

    // Convert Hanzi to Pinyin
    public static func convert(_ text: String, toneMarks: Bool = true) -> String {
        var result = [String]()

        for char in text {
            let hanzi = String(char)
            if let pinyin = pinyinDictionary[hanzi]?.first {
                result.append(pinyin)
            } else {
                result.append(hanzi) // Keep non-Hanzi characters
            }
        }

        return result.joined(separator: " ")
    }
}
