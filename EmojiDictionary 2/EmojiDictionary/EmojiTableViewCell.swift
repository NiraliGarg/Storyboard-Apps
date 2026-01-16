//
//  EmojiTableViewCell.swift
//  EmojiDictionary
//
//  Created by GEU on 07/01/26.
//

import UIKit
class EmojiTableViewCell: UITableViewCell
{
    @IBOutlet weak var emojiLabel: UILabel!
    @IBOutlet weak var emojiNameLabel: UILabel!
    @IBOutlet weak var emojiDescriptionLabel: UILabel!
    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    func update(with emoji: Emoji)
    {
        emojiLabel.text = emoji.symbol
        emojiNameLabel.text = emoji.name
        emojiDescriptionLabel.text = emoji.description
    }
}
