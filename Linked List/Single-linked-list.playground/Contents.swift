//: Playground - noun: a place where people can play

import Foundation

class LinkedListNode<T> {
    let value: T
    
    var next: LinkedListNode<T>?
    
    init(value: T) {
        self.value = value
    }
}

class LinkedList<T: Comparable> {
    typealias Node = LinkedListNode<T>
    
    var head: Node?
    
    var first: Node? {
        return head
    }
    
    var last: Node? {
        guard var node = head else { return nil }
        while let next = node.next {
            node = next
        }
        return node
    }
    
    var isEmpty: Bool {
        return head == nil
    }
    
    var count: Int {
        guard var node = head else { return 0 }
        var count = 1
        while let next = node.next {
            node = next
            count += 1
        }
        return count
    }
    
    // MARK: - Methods
    func append(_ value: T) {
        let newNode = Node(value: value)
        if let lastNode = last {
            lastNode.next = newNode
        } else {
            head = newNode
        }
    }
    
    func node(atIndex index: Int) -> Node? {
        if index == 0 {
            return head
        } else {
            var node = head?.next
            for _ in 1..<index {
                node = node?.next
                if node == nil { break }
            }
            return node
        }
    }
    
    subscript(index: Int) -> T? {
        let node = self.node(atIndex: index)
        return node?.value
    }
    
    func index(_ node: Node) -> Int? {
        let value = node.value
        guard var node = head else { return nil }
        var index = 0
        while let next = node.next {
            if value == next.value {
                return index
            }
            node = next
            index += 1
        }
        return nil
    }
    
    func insert(_ node: Node, atIndex index: Int) {
        let newNode = node
        if index == 0 {
            newNode.next = head
            head = newNode
        } else {
            let preNode = self.node(atIndex: index - 1)
            let afterNode = self.node(atIndex: index)
            preNode?.next = newNode
            newNode.next = afterNode
        }
    }
    
    func removeAll() {
        head = nil
    }
    
    func remove(node: Node) {
        let tempIndex = self.index(node)
        guard let index = tempIndex else { return }
        
        if index == 0 {
            head = head?.next
        } else {
            let pre = self.node(atIndex: index - 1)
            let after = self.node(atIndex: index + 1)
            pre?.next = after
        }
    }
}

/// test
var list = LinkedList<String>()
list.append("hello")
list.append("world")
list.append("nimei")

list.remove(node: LinkedListNode(value: "world"))

list.count

list.last?.value
