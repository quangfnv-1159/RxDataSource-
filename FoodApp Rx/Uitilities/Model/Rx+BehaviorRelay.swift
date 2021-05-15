//
//  Rx+BehaviorRelay.swift
//  FoodApp Rx
//
//  Created by Quang Nguyen on 5/14/21.
//

import Foundation
import RxSwift
import RxCocoa

extension BehaviorRelay where Element: RangeReplaceableCollection, Element.Element: Equatable {
    func acceptAppending(contentsOf elements: [Element.Element]) {
        let filteredElements = elements.filter { element in
            !value.contains(where: { $0 == element })
        }
        
        accept(value + filteredElements)
    }
}

extension BehaviorRelay where Element: RangeReplaceableCollection {
    func acceptAppending(_ element: Element.Element) {
        accept(value + [element])
    }

    func acceptAppending(contentsOf elements: [Element.Element]) {
        accept(value + elements)
    }

    func insert(_ subElement: Element.Element, at index: Element.Index) {
        var newValue = value
        newValue.insert(subElement, at: index)
        accept(newValue)
    }

    func replaceElement(at index: Element.Index, insertTo insertIndex: Element.Index, with element: Element.Element) {
        var newValue = value
        newValue.remove(at: index)
        newValue.insert(element, at: insertIndex)
        accept(newValue)
    }

    func insert(contentsOf newSubelements: Element, at index: Element.Index) {
        var newValue = value
        newValue.insert(contentsOf: newSubelements, at: index)
        accept(newValue)
    }

    func remove(at index: Element.Index) {
        var newValue = value
        newValue.remove(at: index)
        accept(newValue)
    }
}
