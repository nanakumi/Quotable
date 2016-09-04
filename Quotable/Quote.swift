//
//  Quote.swift
//  Quotable
//
//  Created by Nana Kumi on 9/3/16.
//  Copyright © 2016 Nana Kumi. All rights reserved.
//

import Foundation
import Firebase

struct Quote {

    
    var quoteContent = String()
    var quoteAuthor = String()
    var key: String!
    var ref: FIRDatabaseReference?

    
    init(content: String = "", author: String = "", key: String = "")
    {
        self.quoteContent = content
        self.quoteAuthor = author
        self.key = key
        self.ref = nil
    }
    
    init(snapshot: FIRDataSnapshot)
    {
        key = snapshot.key
        ref = snapshot.ref
        quoteContent = snapshot.value!["quoteContent"] as! String
        quoteAuthor = snapshot.value!["quoteAuthor"] as! String
    }
    

    var quotes = [Quote]()

    
    
    
      mutating func fetchAQuote() {
        
        
        
        let conditionRef = FIRDatabase.database().reference().child("quotes")
        
        conditionRef.observeEventType(.Value, withBlock: { snapshot in
            var tempQuotes = [Quote]()
            
            for quote in snapshot.children {
                let quote = Quote(snapshot: quote as! FIRDataSnapshot)
                tempQuotes.append(quote)
            }
            
            // update your item with the new ones retrieved
            self.quotes = tempQuotes
            
            
            
            print("\(self.quotes.count)")
            
            
            
            
        })

        
        
        
    }
    

    func getQuote() -> String {
        
        
        
        return quotes[1].quoteContent
    }
    
}