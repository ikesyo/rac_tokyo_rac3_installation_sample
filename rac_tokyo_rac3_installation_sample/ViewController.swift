//
//  ViewController.swift
//  rac_tokyo_rac3_installation_sample
//
//  Created by Syo Ikeda on 10/18/14.
//  Copyright (c) 2014 Syo Ikeda. All rights reserved.
//

import UIKit

import LlamaKit
import ReactiveCocoa

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func touchUpInside(sender: UIButton) {
        let result = Result.Success(Box("success!!!"))
        let producer = Producer.single(result)

        producer.produce { event in
            switch event {
            case .Next(let box):
                let alert = UIAlertView(title: box.unbox.value(), message: nil, delegate: nil, cancelButtonTitle: "OK")
                alert.show()

            default:
                break
            }
        }
    }
}

