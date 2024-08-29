//
//  SelectionSort.swift
//
//
//  Created by Lewis on 29.08.2024.
//

import Foundation

class SelectionSort {
    
    func selectionSort<Element>(_ collection: inout [Element]) where Element: Comparable {
        //1. Если коллекция меньше 2х элементов, то ничего не делаем
        guard collection.count >= 2 else { return }
        //2. Перебираем каждый элемент коллекции
        for i in 0..<collection.count {
            //3. Храним индекс наименьшего элемента в итерации
            var minIndex = i
            //4. Перебираем каждый элемент неотсортированной части коллекции (то что справа от i)
            for j in i+1..<collection.count {
                //5. Если находим значение меньше хранимого, то обновляем значение переменной
                if collection[j] < collection[minIndex] {
                    minIndex = j
                }
            }
            //6. Меняем текущий индекс первой итерации и найденный минимальный индекс
            collection.swapAt(i, minIndex)
        }
    }
}
