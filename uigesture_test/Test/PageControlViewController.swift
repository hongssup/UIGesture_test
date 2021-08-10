//
//  PageControlViewController.swift
//  uigesture_test
//
//  Created by SeoYeon Hong on 2021/07/14.
//

import UIKit

class PageControlViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var scrollView: UIScrollView! {
        didSet {
            scrollView.delegate = self
        }
    }
    @IBOutlet weak var pageControl: UIPageControl!
    
    var slides: [UIView] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        slides = createSlides()
        setupSlideScrollView(slides: slides)
        
        pageControl.numberOfPages = slides.count
        pageControl.currentPage = 0
        view.bringSubviewToFront(pageControl)
        print(view.frame.width)
        print(bgView.frame.width)
    }

    func createSlides() -> [UIView] {
        let slide1 = UIView()
        slide1.backgroundColor = .blue
        
        let slide2 = UIView()
        slide2.backgroundColor = .yellow
        
        let slide3 = UIView()
        slide3.backgroundColor = .orange
        
        let slide4 = UIView()
        slide4.backgroundColor = .green
        
        return [slide1, slide2, slide3, slide4]
    }
    
    func setupSlideScrollView(slides : [UIView]) {
        scrollView.frame = CGRect(x: 0, y: 0, width: bgView.frame.width, height: bgView.frame.height)
        scrollView.contentSize = CGSize(width: bgView.frame.width * CGFloat(slides.count), height: bgView.frame.height)
        print(scrollView.contentSize.width)
        scrollView.isPagingEnabled = true
        
        for i in 0 ..< slides.count {
            slides[i].frame = CGRect(x: bgView.frame.width * CGFloat(i), y: 0, width: bgView.frame.width, height: bgView.frame.height)
            //slides[i].frame.size.width = view.bounds.size.width
            //slides[i].frame.origin.x = CGFloat(i) * view.bounds.size.width
            scrollView.addSubview(slides[i])
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
        let pageIndex = scrollView.contentOffset.x / scrollView.frame.size.width
        pageControl.currentPage = Int(pageIndex)
    }
}

