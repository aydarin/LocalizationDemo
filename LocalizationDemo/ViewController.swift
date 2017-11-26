import UIKit

struct StringsModel {
    
    struct Section {
        let rows: [Row]
    }
    
    struct Row {
        let string: String
    }
    
    let sections: [Section]
    
    init(withKeys keys: [String], count: Int = 5) {
        var sections: [Section] = []
        
        for key in keys {
            var rows: [Row] = []
            
            for i in 1...count {
                let format = NSLocalizedString(key, comment: "")
                let string = String.localizedStringWithFormat(format, i, i)
                rows.append(Row(string: string))
            }
            
            sections.append(Section(rows: rows))
        }
        
        self.sections = sections
    }
    
}

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    fileprivate let model = StringsModel(withKeys: ["message_months", "days", "long_message"])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
    }
}

extension ViewController: UITableViewDelegate {
}

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return model.sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.sections[section].rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = model.sections[indexPath.section].rows[indexPath.row].string
        return cell
    }
    
}

