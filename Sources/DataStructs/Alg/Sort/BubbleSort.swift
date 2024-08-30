//
//  BubbleSort.swift
//
//
//  Created by Lewis on 28.08.2024.
//

import Foundation

class BubbleSort {
    
    func bubbleSort<Element>(_ collection: inout [Element]) where Element: Comparable {
        //1. Если коллекция меньше 2х элементов, то ничего не делаем
        guard collection.count >= 2 else { return }
        //2. Проходим по каждому индексу с конца коллеции
        for end in (1..<collection.count).reversed() {
            //3. Переменная для проверки не отсортирован ли уже массив
            var swapped = false
            //4. Проходим по каждому индексу с начала до end (после end элементы коллекции уже отсортированы)
            for current in 0..<end {
                //5. Проверяем что левый элемент больше правого
                if collection[current] > collection[current + 1] {
                    //6. Если так, то меняем их местами, меняем значение переменной
                    collection.swapAt(current, current + 1)
                    swapped = true
                }
            }
            //7. Если swapped останется false, значит массив уже отсортирован (элементы стоят по порядку и больше нечего менять)
            if !swapped {
                return
            }
        }
    }
    
    func bubbleSortExtra<Element>(_ collection: inout [Element]) where Element: Comparable {
        guard collection.count > 2 else { return }
        for i in 1..<collection.count {
            for j in 0...i {
                if collection[j] >= collection[i] {
                    collection.swapAt(i, j)
                }
            }
        }
    }
}
