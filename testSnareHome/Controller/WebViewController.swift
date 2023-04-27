//
//  WebViewController.swift
//  testSnareHome
//
//  Created by 小木曽佑介 on 2023/04/27.
//

import UIKit
import WebKit

class WebViewController: UIViewController {


    @IBOutlet weak var webView: WKWebView!

    var viewModel: Item?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let viewModel = viewModel else { return }
        let url = URL(string: viewModel.itemUrl)
        let request = URLRequest(url: url!)

        webView.load(request)
        // Do any additional setup after loading the view.
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
