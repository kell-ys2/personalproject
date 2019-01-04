//
//  SecondViewController.swift
//  jan4PPextended
//
//  Created by Kelly Shu on 4/1/2019.
//  Copyright © 2019 CDNIS. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!{
        didSet{
            scrollView.delegate = self as? UIScrollViewDelegate
        }
    }
    
    // omg i need help
    
    @IBOutlet weak var pageControl: UIPageControl!
    var slides:[Sliden2] = [];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        slides = createSlides()
        setupSlideScrollView(slides:slides)
        
        pageControl.numberOfPages = slides.count
        pageControl.currentPage = 0
        view.bringSubviewToFront(pageControl)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    }
    
    func createSlides() -> [Sliden2] {
    
    let slide1:Sliden2 = Bundle.main.loadNibNamed("Sliden2", owner:self, options: nil)?.first as! Sliden2
    slide1.labelWithAdvice.text = "judas"
    
    
    let slide2:Sliden2 = Bundle.main.loadNibNamed("Sliden2", owner: self, options: nil)?.first as! Sliden2
    slide2.labelWithAdvice.text = "hi"
    
    return [slide1, slide2]
}
    func setupSlideScrollView(slides : [Slide]) {
        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count), height: view.frame.height)
        scrollView.isPagingEnabled = true
        
        for i in 0 ..< slides.count {
            slides[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
            scrollView.addSubview(slides[i])
    
}
