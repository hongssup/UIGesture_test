//
//  PageControl2ViewController.swift
//  uigesture_test
//
//  Created by SeoYeon Hong on 2021/08/10.
//

import UIKit

class PageControl2ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView! {
        didSet {
            scrollView.delegate = self
        }
    }
    var slides: [Slide] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        slides = createSlides()
        setupSlideScrollView(slides: slides)
    }

    func createSlides() -> [Slide] {
        let slide1 = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide1.slide.backgroundColor = .blue
        
        let slide2 = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide2.slide.backgroundColor = .yellow
        
        let slide3 = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide3.slide.backgroundColor = .orange
        
        let slide4 = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide4.slide.backgroundColor = .green
        
        return [slide1, slide2, slide3, slide4]
    }
    
    func setupSlideScrollView(slides : [Slide]) {
        //scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 300)
        scrollView.contentSize = CGSize(width: view.frame.width * 4, height: 300)
        //scrollView.contentSize = CGSize(width: scrollView.frame.width, height: scrollView.frame.height * 4)
        scrollView.isPagingEnabled = true
        
        for i in 0 ..< slides.count {
            slides[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: 300)
            scrollView.addSubview(slides[i])
        }
    }
    

}
