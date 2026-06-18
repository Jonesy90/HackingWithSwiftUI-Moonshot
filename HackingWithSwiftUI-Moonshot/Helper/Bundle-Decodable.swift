//
//  Bundle-Decodable.swift
//  HackingWithSwiftUI-Moonshot
//
//  Created by Michael Jones on 18/06/2026.
//

import Foundation

/// A Bundle extension to make it easier to decode a JSON file from the app bundle using Generics.
/// Because it's a generic, it can be used to decode any type that conforms to Codable.
extension Bundle {
    func decode<T: Codable>(_ file: String) -> T {
        /// Attempts to find the file in the app bundle by matching the file name.
        guard let url = url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in the bundle.")
        }
        
        /// Attempts to load the file as Data.
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle")
        }
        
        /// Creating a JSONDecoder instance to decode JSON data.
        let decoder = JSONDecoder()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)
        
        /// Decoding with error handling.
        do {
            return try decoder.decode(T.self, from: data)
        } catch DecodingError.keyNotFound(let key, let context) {
            fatalError("Failed to decode \(file) from bundle. Due to a missing \(key.stringValue) - \(context.debugDescription)")
        } catch DecodingError.typeMismatch(_, let context) {
            fatalError("Failed to decode \(file) from bundle. Due to type mismatch \(context.debugDescription)")
        } catch  DecodingError.valueNotFound(_, let context) {
            fatalError("Failed to decode \(file) from bundle. Due to value not found \(context.debugDescription)")
        } catch DecodingError.dataCorrupted(let context) {
            fatalError("Failed to decode \(file) from bundle. Due corrupt data \(context.debugDescription)")
        } catch {
            fatalError("Failed to decode \(file) from bundle. \(error.localizedDescription)")
        }
    }
}
