//
//  ViewController.swift
//  Recursion
//
//  Created by spychatter mx on 12/10/17.
//  Copyright © 2017 spychatter. All rights reserved.
//

import UIKit
// indirect le indica al compilador que el tipo es recursivo
// tipo recursivo: es aquiel tipo que se referencia a si mismo en su definición.


indirect enum List<T>{
	case empty
	case content(head:T, tail: List<T>)
}


class ViewController: UIViewController {

	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
	}

	//mala recursión, por la pila de momoria.
	func totalCost(listOf items: List<Int>) -> Int{
		switch items {
		case .empty:
			return 0
		case .content(let head, let tail):
			return head + totalCost(listOf: tail)
		}
	}
	
	//APS(Acumulator Passing Style)
	func totalCostAccumulator(listOf items: List<Int>) -> Int{
		func totalCostAccumulator(listOf items: List<Int>, accumulator: Int) -> Int{
			switch items {
			case .empty:
				return accumulator
			case .content(let head, let tail):
				return totalCostAccumulator(listOf: tail, accumulator: head + accumulator)
			}
		}
		return totalCostAccumulator(listOf: items, accumulator: 0)
	}
	
	
	


}

