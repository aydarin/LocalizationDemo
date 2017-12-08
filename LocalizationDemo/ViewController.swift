import UIKit

struct StringsModel {
    
    struct Section {
        let rows: [Row]
    }
    
    struct Row {
        let string: String
    }
    
    private(set) var sections: [Section] = []
    
    init(withPlurals pluralKeys: [String],
         count: Int = 5,
         adaptiveKeys: [String],
         widths: [Int]) {
        
        var sections = pluralsSections(withKeys: pluralKeys, count: count)
        sections.append(contentsOf: adaptiveSections(withKeys: adaptiveKeys, widths: widths))
        
        self.sections = sections
    }
    
    private func pluralsSections(withKeys keys: [String], count: Int) -> [Section] {
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
        
        return sections
    }
    
    private func adaptiveSections(withKeys keys: [String], widths: [Int]) -> [Section] {
        var sections: [Section] = []
        
        for key in keys {
            sections.append(Section(rows: [Row(string: NSLocalizedString(key, comment: ""))]))
        }
    
        return sections
    }
    
}

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    fileprivate let model = StringsModel(withPlurals: ["message_months", "days"],
                                         adaptiveKeys: ["ico"],
                                         widths: [20, 25, 50])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
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
        let string = model.sections[indexPath.section].rows[indexPath.row].string as NSString
        cell.textLabel?.text = string as String
        return cell
    }
    
}

