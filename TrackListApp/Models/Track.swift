//
//  Track.swift
//  TrackListApp
//
//  Created by Alexander Shevtsov on 16.09.2024.
//

struct Track {
    // Если интерфейс не предполагает изменений, все через let
    let artist: String
    let song: String
    
    var title: String {
        "\(artist) - \(song)"
    }
    // пока нет бэкенда, но данные нужны:
    static func getTrackList() -> [Track] {
        [
            Track(artist: "Alberto Ruiz", song: "7 Elements (Original Mix)"),
            Track(artist: "Dave Wincent", song: "Red Eye (Original Mix)"),
            Track(artist: "E-Spectro", song: "End Station (Original Mix)"),
            Track(artist: "Edna Ann", song: "Phasma (Konstantin Yoodza Remix)"),
            Track(artist: "Ilija Djokovic", song: "Delusion (Original Mix)"),
            Track(artist: "John Baptiste", song: "Mycelium (Original Mix)"),
            Track(artist: "Lane 8", song: "Fingerprint (Original Mix)"),
            Track(artist: "Mac Vaughn", song: "Pink Is My Favorite Color (Alex Stein Remix)"),
            Track(artist: "Metodi Hristov, Gallya", song: "Badmash (Original Mix)"),
            Track(artist: "Veerus, Maxie Devine", song: "Nightmare (Original Mix)")
        ]
    }
}
