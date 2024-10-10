//
//  TrackDetailsViewController.swift
//  TrackListApp
//
//  Created by Alexander Shevtsov on 10.10.2024.
//

import UIKit

final class TrackDetailsViewController: UIViewController {
    
    @IBOutlet var artCoverImageView: UIImageView!
    @IBOutlet var trackTitleLabel: UILabel!
    
    var track : Track!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        artCoverImageView.image = UIImage(named: track.title)
        trackTitleLabel.text = track.title
    }
}
