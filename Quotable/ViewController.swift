//
//  ViewController.swift
//  Quotable
//
//  Created by Nana Kumi on 9/3/16.
//  Copyright © 2016 Nana Kumi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var quote = Quote()
        
        quote.fetchAQuote()
        
     print(quote.quoteAuthor)
        
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

