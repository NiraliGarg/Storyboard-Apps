//
//  AddEditEmojiTableViewController.swift
//  EmojiDictionary
//
//  Created by GEU on 08/01/26.
//

import UIKit

class AddEditEmojiTableViewController: UITableViewController
{
    
    @IBOutlet weak var symbolTF: UITextField!
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var descriptionTF: UITextField!
    @IBOutlet weak var usageTF: UITextField!
    var emoji:Emoji?
    init?(coder:NSCoder,emoji: Emoji?)
    {
        self.emoji = emoji
        super.init(coder:coder)
    }
    required init?(coder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad()
    {
        super.viewDidLoad()
        tableView.allowsSelection = false
        if let emoji=emoji
        {
            symbolTF.text=emoji.symbol
            nameTF.text=emoji.name
            descriptionTF.text=emoji.description
            usageTF.text=emoji.usage
            title="Edit Emoji"
        }
        updateSaveButtonState()
    }
    @IBAction func textEditingChanged(_ sender: UITextField)
    {
            updateSaveButtonState()
        }
        
        func updateSaveButtonState()
    {
            let symbolText = symbolTF.text ?? ""
            let nameText = nameTF.text ?? ""
            let descriptionText = descriptionTF.text ?? ""
            let usageText = usageTF.text ?? ""
            
            saveButton.isEnabled = !symbolText.isEmpty && !nameText.isEmpty && !descriptionText.isEmpty && !usageText.isEmpty
        }
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            guard segue.identifier == "saveUnwind" else { return }
            
            let symbol = symbolTF.text ?? ""
            let name = nameTF.text ?? ""
            let description = descriptionTF.text ?? ""
            let usage = usageTF.text ?? ""
            
            emoji = Emoji(symbol: symbol, name: name, description: description, usage: usage)
        }

    }
