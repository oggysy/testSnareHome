//
//  ViewController.swift
//  testSnareHome
//
//  Created by 小木曽佑介 on 2023/04/26.
//

import UIKit

enum Sections: Int {
    case Yamaha = 0
    case Pearl = 1
    case Tama = 2
    case DW = 3
    case Ludwig = 4
}

class ViewController: UIViewController {


    let sectionTitles: [String] = ["Yamaha", "Pearl", "Tama","DW","Ludwig"]

    @IBOutlet weak var tableView: UITableView!{
        didSet{
            tableView.register(CollectionTableViewCell.self, forCellReuseIdentifier: CollectionTableViewCell.identifier)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tableView.backgroundColor = .white
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CollectionTableViewCell", for: indexPath) as? CollectionTableViewCell else {
            return UITableViewCell()
        }

        cell.delegate = self

        switch indexPath.section {
        case Sections.Yamaha.rawValue:
            APICaller.shared.getSnare(with: "Yamaha"){ result in
                switch result {
                case .success(let titles):
                    cell.configure(with: titles)
                case .failure(let error):
                    print("1")
                    print(error.localizedDescription)
                }
            }

        case Sections.Pearl.rawValue:
            APICaller.shared.getSnare(with: "Pearl") { result in
                switch result {
                case .success(let titles):
                    cell.configure(with: titles)
                case .failure(let error):
                    print("2")
                    print(error.localizedDescription)
                }
            }
        case Sections.Tama.rawValue:
            APICaller.shared.getSnare(with: "Tama") { result in
                switch result {
                case .success(let titles):
                    cell.configure(with: titles)
                case .failure(let error):
                    print("3")
                    print(error.localizedDescription)
                }
            }

        case Sections.DW.rawValue:
            APICaller.shared.getSnare(with: "DW") { result in
                switch result {
                case .success(let titles):
                    cell.configure(with: titles)
                case .failure(let error):
                    print("4")
                    print(error.localizedDescription)
                }
            }

        case Sections.Ludwig.rawValue:
            APICaller.shared.getSnare(with: "Ludwig") { result in
                switch result {
                case .success(let titles):
                    cell.configure(with: titles)
                case .failure(let error):
                    print("5")
                    print(error.localizedDescription)
                }
            }

        default:
            return UITableViewCell()

        }
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }


    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }


}


extension ViewController: CollectionViewTableViewCellDelegate {
    func collectionViewTableViewCellDidTapCell(_ cell: CollectionTableViewCell, viewModel: Item) {
        DispatchQueue.main.async { [weak self] in
            let storyboard = UIStoryboard(name: "WebViewController", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
            vc.viewModel = viewModel
            self?.present(vc, animated: true, completion: nil)
        }
    }
}


