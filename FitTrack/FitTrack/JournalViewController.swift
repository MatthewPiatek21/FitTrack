//
//  JournalViewController.swift
//  FitTrack
//
//  Created by Matthew Dlugosz on 3/16/23.
//

import UIKit

class JournalViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var noteTable: UITableView!
    @IBOutlet weak var label: UILabel!
    
    var journalStorage: [(title: String, note: String)] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        noteTable.delegate = self
        noteTable.dataSource = self
    }
    
    @IBAction func addNoteTapped(_ sender: Any) {
        guard let view = storyboard?.instantiateViewController(identifier: "new") as? EntryViewController else {
            return
        }
        view.completion = { noteTitle, note in
            self.navigationController?.popToRootViewController(animated: true)
            self.journalStorage.append((title: noteTitle, note: note))
            self.label.isHidden = true
            self.noteTable.isHidden = false
            self.noteTable.reloadData()
        }
        navigationController?.pushViewController(view, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return journalStorage.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = journalStorage[indexPath.row].title
        cell.detailTextLabel?.text = journalStorage[indexPath.row].note
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let model = journalStorage[indexPath.row]
        guard let view = storyboard?.instantiateViewController(identifier: "note") as? NoteViewController else {
            return
        }
        view.noteTitle = model.title
        view.note = model.note
        navigationController?.pushViewController(view, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {

            journalStorage.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            if journalStorage.isEmpty {
                label.isHidden = false
                noteTable.isHidden = true
            }
        }
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
