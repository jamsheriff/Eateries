//
//  PageViewController.swift
//  Eateries
//
//  Created by Sherif Musa on 03.01.2020.
//  Copyright © 2020 Sherif Musa. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController {
  
  var headersArray = ["Записывайте", "Находите"]
  var subheadersArray = ["Создайте свой список любимых ресторанов", "Найдите и отметьте на карте ваши любимые рестораны"]
  var imagesArray = ["food", "iphoneMap"]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    dataSource = self
    
    if let firstVC = displayViewController(atIndex: 0) {
      setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
    }
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func displayViewController(atIndex index: Int) -> ContentViewController? {
    guard index >= 0 else { return nil }
    guard index < headersArray.count else { return nil }
    guard let contentVC = storyboard?.instantiateViewController(withIdentifier: "contentViewController") as? ContentViewController else { return nil }
    
    contentVC.imageFile = imagesArray[index]
    contentVC.header = headersArray[index]
    contentVC.subheader = subheadersArray[index]
    contentVC.index = index
    
    return contentVC
  }
  
  func nextVC(atIndex index: Int) {
    if let contentVC = displayViewController(atIndex: index + 1) {
      setViewControllers([contentVC], direction: .forward, animated: true, completion: nil)
    }
  }
}

extension PageViewController: UIPageViewControllerDataSource {
  func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
    var index = (viewController as! ContentViewController).index
    index -= 1
    return displayViewController(atIndex: index)
  }
  
  func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
    var index = (viewController as! ContentViewController).index
    index += 1
    return displayViewController(atIndex: index)
  }
  
//  func presentationCount(for pageViewController: UIPageViewController) -> Int {
//    return headersArray.count
//  }
//
//  func presentationIndex(for pageViewController: UIPageViewController) -> Int {
//    let contentVC = storyboard?.instantiateViewController(withIdentifier: "contentViewController") as? ContentViewController
//    return contentVC!.index
//  }
}





