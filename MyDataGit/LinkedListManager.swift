//
//  LinkedListManager.swift
//
//
//  Created by Andrey Kulinskiy on 4/10/19.
//  Copyright © 2019 Andrey Kulinskiy. All rights reserved.
//

import Foundation

class Item {
    let value: Int
    var next: Item?
    
    init(value: Int) {
        self.value = value
    }
    
    func printItem() {
        print(self.value)
    }
    
    func reverse() -> Item {
        guard let nextItem = self.next else { return self }
        let firstItem = nextItem.reverse()
        nextItem.next = self
        return firstItem
    }
}

class ItemList {
    var first: Item?
    
    func insert(item: Item) {
        item.next = self.first
        self.first = item
    }
    
    func printItems() {
        var currentItem = self.first
        while currentItem != nil {
            currentItem?.printItem()
            currentItem = currentItem?.next
        }
        print("")
    }
    
    func reverse() {
        var firstItem = self.first
        var nextItem = firstItem?.next
        var lastItem: Item?
        
        while nextItem != nil {
            if nextItem?.next == nil {
                lastItem = nextItem
            }
            
            let nextItemTmp = nextItem?.next
            nextItem?.next = firstItem
            firstItem = nextItem
            nextItem = nextItemTmp
        }
        
        self.first?.next = nil
        self.first = lastItem
    }
    
    func reverseRecursion() {
        let oldfirst = self.first
        self.first = self.first?.reverse()
        oldfirst?.next = nil
    }
}

class LinkedListManager {
    
    class func start() {
        let list = ItemList()
        list.insert(item: Item(value: 1))
        list.insert(item: Item(value: 2))
        list.insert(item: Item(value: 3))
        list.insert(item: Item(value: 4))
        list.insert(item: Item(value: 5))
        list.insert(item: Item(value: 6))
        list.insert(item: Item(value: 7))
        
        // print items
        list.printItems()
        
        list.reverse()

        // print reverse items
        list.printItems()
        
        list.reverseRecursion()

        // print reverse items with recursion
        list.printItems()
    }
}
