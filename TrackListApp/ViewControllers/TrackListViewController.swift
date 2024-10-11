//
//  TrackListViewController.swift
//  TrackListApp
//
//  Created by Alexander Shevtsov on 16.09.2024.
//

import UIKit

final class TrackListViewController: UITableViewController {
    
    private var trackList = Track.getTrackList()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 80 // макс высота всех иконок
        navigationItem.leftBarButtonItem = editButtonItem // + кнопка Edit в NavigationBur
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        let trackDetailsVC = segue.destination as? TrackDetailsViewController
        trackDetailsVC?.track = trackList[indexPath.row]
    }
}

// MARK: - UITableViewDatasource
extension TrackListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        trackList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "trackCell", for: indexPath)
        let track = trackList[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = track.song
        content.secondaryText = track.artist
        content.image = UIImage(named: track.title) // отображает иконку
        content.imageProperties.cornerRadius = tableView.rowHeight / 2 // скругление
        
        cell.contentConfiguration = content
        return cell
    }
    
    // + кнопки перемещения по нажатию Edit
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let currentTrack = trackList.remove(at: sourceIndexPath.row) // удалили из array и сохранили в let
        trackList.insert(currentTrack, at: destinationIndexPath.row) // add new элемент
    }
}

// MARK: - UITableViewDelegate
extension TrackListViewController {
    // убирает Delete по нажатию Edit
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        .none
    }
    // убирает свободное пространство по нажатию Edit
    override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        false
    }
}
