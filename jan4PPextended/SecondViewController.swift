//
//  SecondViewController.swift
//  jan4PPextended
//
//  Created by Kelly Shu on 4/1/2019.
//  Copyright © 2019 CDNIS. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!{
        didSet{
            scrollView.delegate = self as UIScrollViewDelegate
        }
    }
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    
    var slides:[Slide2] = [];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        slides = createSlides()
        setupSlideScrollView(slides: slides)
        
        pageControl.numberOfPages = slides.count
        pageControl.currentPage = 0
        view.bringSubview(toFront: pageControl)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

       func createSlides() -> [Slide2] {
        
        let slide1:Slide2 = Bundle.main.loadNibNamed("Slide2", owner: self, options: nil)?.first as! Slide2
        slide1.labelAdvice.text = "You need to be prepared for every single question."
        slide1.labelCasual.text = "Try the affirmation page for general topic questions, so you can test yourself!"
        slide1.labelAttribution.text = "- by blah blah blah"
        
        let slide2:Slide2 = Bundle.main.loadNibNamed("Slide2", owner: self, options: nil)?.first as! Slide2
        slide2.labelAdvice.text = "Know your audience. Every aspect of your presentation depends on how your audience responds!"
        slide2.labelCasual.text = "Make sure you're aware of who you're presenting to!"
        slide2.labelAttribution.text = "- by blah blah blah"
        
        
        return [slide1, slide2]
        
    }
 
    func setupSlideScrollView(slides : [Slide2]) {
        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count), height: view.frame.height)
        scrollView.isPagingEnabled = true
        
        for i in 0 ..< slides.count {
            slides[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
            scrollView.addSubview(slides[i])
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
        pageControl.currentPage = Int(pageIndex)
        
        let maximumHorizontalOffset: CGFloat = scrollView.contentSize.width - scrollView.frame.width
        let currentHorizontalOffset: CGFloat = scrollView.contentOffset.x
        
        // vertical
        let maximumVerticalOffset: CGFloat = scrollView.contentSize.height - scrollView.frame.height
        let currentVerticalOffset: CGFloat = scrollView.contentOffset.y
        
        let _: CGFloat = currentHorizontalOffset / maximumHorizontalOffset
        let _: CGFloat = currentVerticalOffset / maximumVerticalOffset
        
        let percentOffset: CGPoint = CGPoint(x: currentHorizontalOffset, y: currentVerticalOffset)
        
        if(percentOffset.x > 0 && percentOffset.x <= 0.25) {
            
            slides[0].mask?.transform = CGAffineTransform(scaleX: (0.25-percentOffset.x)/0.25, y: (0.25-percentOffset.x)/0.25)
            slides[1].mask?.transform = CGAffineTransform(scaleX: percentOffset.x/0.25, y: percentOffset.x/0.25)
            
        } else if(percentOffset.x > 0.25 && percentOffset.x <= 0.50) {
            slides[1].mask?.transform = CGAffineTransform(scaleX: (0.50-percentOffset.x)/0.25, y: (0.50-percentOffset.x)/0.25)
            slides[2].mask?.transform = CGAffineTransform(scaleX: percentOffset.x/0.50, y: percentOffset.x/0.50)
            
        } else if(percentOffset.x > 0.50 && percentOffset.x <= 0.75) {
            slides[2].mask?.transform = CGAffineTransform(scaleX: (0.75-percentOffset.x)/0.25, y: (0.75-percentOffset.x)/0.25)
            slides[3].mask?.transform = CGAffineTransform(scaleX: percentOffset.x/0.75, y: percentOffset.x/0.75)
            
        } else if(percentOffset.x > 0.75 && percentOffset.x <= 1) {
            slides[3].mask?.transform = CGAffineTransform(scaleX: (1-percentOffset.x)/0.25, y: (1-percentOffset.x)/0.25)
            slides[4].maskView.transform = CGAffineTransform(scaleX: percentOffset.x, y: percentOffset.x)
        }
    }
    
    

}

