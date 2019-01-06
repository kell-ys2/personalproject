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
        view.bringSubviewToFront(pageControl)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

       func createSlides() -> [Slide2] {
        
        let slide1:Slide2 = Bundle.main.loadNibNamed("Slide2", owner: self, options: nil)?.first as! Slide2
        slide1.labelAdvice.text = "You need to be prepared for every single question."
        slide1.labelCasual.text = "Try the affirmation page for general topic questions, so you can test yourself!"
        slide1.labelAttribution.text = "- by blah blah blah"
        slide1.imageViewBorder.image = UIImage(named: "squareeee")
        
        let slide2:Slide2 = Bundle.main.loadNibNamed("Slide2", owner: self, options: nil)?.first as! Slide2
        slide2.labelAdvice.text = "Know your audience. Every aspect of your presentation depends on how your audience responds!"
        slide2.labelCasual.text = "Make sure you're aware of who you're presenting to!"
        slide2.labelAttribution.text = "- by blah blah blah"
        slide2.imageViewBorder.image = UIImage(named: "squareeee")
        
        let slide3:Slide2 = Bundle.main.loadNibNamed("Slide2", owner: self, options: nil)?.first as! Slide2
        slide3.labelAdvice.text = "info goes here"
        slide3.labelCasual.text = "further stuff goes here"
        slide3.labelAttribution.text = "- by blah blah blah"
        slide3.imageViewBorder.image = UIImage(named: "squareeee")
        
        let slide4:Slide2 = Bundle.main.loadNibNamed("Slide2", owner: self, options: nil)?.first as! Slide2
        slide4.labelAdvice.text = "+ info goes here"
        slide4.labelCasual.text = "even more info goes here"
        slide4.labelAttribution.text = "- by blah blah blah"
        slide4.imageViewBorder.image = UIImage(named: "squareeee")
        
        let slide5:Slide2 = Bundle.main.loadNibNamed("Slide2", owner: self, options: nil)?.first as! Slide2
        slide5.labelAdvice.text = "Know your audience. Every aspect of your presentation depends on how your audience responds!"
        slide5.labelCasual.text = "Make sure you're aware of who you're presenting to!"
        slide5.labelAttribution.text = "- by blah blah blah"
        slide5.imageViewBorder.image = UIImage(named: "squareeee")
        
        return [slide1, slide2, slide3, slide4, slide5]
        
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
        
        let percentageHorizontalOffset: CGFloat = currentHorizontalOffset / maximumHorizontalOffset
        let percentageVerticalOffset: CGFloat = currentVerticalOffset / maximumVerticalOffset
        
        
        /*
         * below code changes the background color of view on paging the scrollview
         */
        //        self.scrollView(scrollView, didScrollToPercentageOffset: percentageHorizontalOffset)
        
        
        /*
         * below code scales the imageview on paging the scrollview
         */
        let percentOffset: CGPoint = CGPoint(x: percentageHorizontalOffset, y: percentageVerticalOffset)
        
        if(percentOffset.x > 0 && percentOffset.x <= 0.25) {
            
            slides[0].imageViewBorder.transform = CGAffineTransform(scaleX: (0.25-percentOffset.x)/0.25, y: (0.25-percentOffset.x)/0.25)
            slides[1].imageViewBorder.transform = CGAffineTransform(scaleX: percentOffset.x/0.25, y: percentOffset.x/0.25)
            
        } else if(percentOffset.x > 0.25 && percentOffset.x <= 0.50) {
            slides[1].imageViewBorder.transform = CGAffineTransform(scaleX: (0.50-percentOffset.x)/0.25, y: (0.50-percentOffset.x)/0.25)
            slides[2].imageViewBorder.transform = CGAffineTransform(scaleX: percentOffset.x/0.50, y: percentOffset.x/0.50)
            
        } else if(percentOffset.x > 0.50 && percentOffset.x <= 0.75) {
            slides[2].imageViewBorder.transform = CGAffineTransform(scaleX: (0.75-percentOffset.x)/0.25, y: (0.75-percentOffset.x)/0.25)
            slides[3].imageViewBorder.transform = CGAffineTransform(scaleX: percentOffset.x/0.75, y: percentOffset.x/0.75)
            
        } else if(percentOffset.x > 0.75 && percentOffset.x <= 1) {
            slides[3].imageViewBorder.transform = CGAffineTransform(scaleX: (1-percentOffset.x)/0.25, y: (1-percentOffset.x)/0.25)
            slides[4].imageViewBorder.transform = CGAffineTransform(scaleX: percentOffset.x, y: percentOffset.x)
        }
    }
    
    
    
    
    func scrollView(_ scrollView: UIScrollView, didScrollToPercentageOffset percentageHorizontalOffset: CGFloat) {
        if(pageControl.currentPage == 0) {
            //Change background color to toRed: 103/255, fromGreen: 58/255, fromBlue: 183/255, fromAlpha: 1
            //Change pageControl selected color to toRed: 103/255, toGreen: 58/255, toBlue: 183/255, fromAlpha: 0.2
            //Change pageControl unselected color to toRed: 255/255, toGreen: 255/255, toBlue: 255/255, fromAlpha: 1
            
            let pageUnselectedColor: UIColor = fade(fromRed: 255/255, fromGreen: 255/255, fromBlue: 255/255, fromAlpha: 1, toRed: 103/255, toGreen: 58/255, toBlue: 183/255, toAlpha: 1, withPercentage: percentageHorizontalOffset * 3)
            pageControl.pageIndicatorTintColor = pageUnselectedColor
            
            
            let bgColor: UIColor = fade(fromRed: 103/255, fromGreen: 58/255, fromBlue: 183/255, fromAlpha: 1, toRed: 255/255, toGreen: 255/255, toBlue: 255/255, toAlpha: 1, withPercentage: percentageHorizontalOffset * 3)
            slides[pageControl.currentPage].backgroundColor = bgColor
            
            let pageSelectedColor: UIColor = fade(fromRed: 81/255, fromGreen: 36/255, fromBlue: 152/255, fromAlpha: 1, toRed: 103/255, toGreen: 58/255, toBlue: 183/255, toAlpha: 1, withPercentage: percentageHorizontalOffset * 3)
            pageControl.currentPageIndicatorTintColor = pageSelectedColor
        }
    }
    
    
    func fade(fromRed: CGFloat,
              fromGreen: CGFloat,
              fromBlue: CGFloat,
              fromAlpha: CGFloat,
              toRed: CGFloat,
              toGreen: CGFloat,
              toBlue: CGFloat,
              toAlpha: CGFloat,
              withPercentage percentage: CGFloat) -> UIColor {
        
        let red: CGFloat = (toRed - fromRed) * percentage + fromRed
        let green: CGFloat = (toGreen - fromGreen) * percentage + fromGreen
        let blue: CGFloat = (toBlue - fromBlue) * percentage + fromBlue
        let alpha: CGFloat = (toAlpha - fromAlpha) * percentage + fromAlpha
        
        // return the fade colour
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
    
}
