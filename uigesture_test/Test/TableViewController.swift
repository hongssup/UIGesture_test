//
//  TableViewController.swift
//  uigesture_test
//
//  Created by SeoYeon Hong on 2021/07/06.
//

import UIKit

class TableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    let cases = ["Swipe", "Pan", "PageControl", "PGL", "pc2", "pan+"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
    }
}

extension TableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = cases[indexPath.item]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let vc = SwipeViewController(nibName: "SwipeViewController", bundle: nil)
            self.navigationController?.pushViewController(vc, animated: true)
            break
        case 1:
            let vc = PanViewController(nibName: "PanViewController", bundle: nil)
            self.navigationController?.pushViewController(vc, animated: true)
            break
        case 2:
            let vc = PageControlViewController(nibName: "PageControlViewController", bundle: nil)
            self.navigationController?.pushViewController(vc, animated: true)
            break
        case 3:
            let vc = PageControlLandscapeViewController(nibName: "PageControlLandscapeViewController", bundle: nil)
            self.navigationController?.pushViewController(vc, animated: true)
            break
        case 4:
            let vc = PageControl2ViewController(nibName: "PageControl2ViewController", bundle: nil)
            self.navigationController?.pushViewController(vc, animated: true)
            break
        default:
            let vc = Swipe_PanViewController(nibName: "Swipe+PanViewController", bundle: nil)
            self.navigationController?.pushViewController(vc, animated: true)
            break
        }
    }
    
}
