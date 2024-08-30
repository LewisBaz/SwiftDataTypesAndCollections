//
//  InsertionSort.swift
//
//
//  Created by Lewis on 30.08.2024.
//

import Foundation

class InsertionSort {
    
    func insertionSort<Element>(_ collection: inout [Element]) where Element: Comparable {
        //1. Если коллекция меньше 2х элементов, то ничего не делаем
        guard collection.count > 2 else { return }
        //2. Перебираем все значения, начиная со второй позиции
        for i in 1..<collection.count {
            //3. Достаем значение по индексу
            let element = collection[i]
            //4. Максимальный индекс отсортированной части массива
            var j = i - 1
            //5. Сдвигаем элементы, которые больше значения на шаг вправо
            while j >= 0 && collection[j] > element {
                collection[j + 1] = collection[j]
                j -= 1
            }
            //6. Вставляем в коллекцию текущее значение
            collection[j + 1] = element
        }
    }
}
