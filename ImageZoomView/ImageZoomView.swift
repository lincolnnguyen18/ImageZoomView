//
//  ImageZoomView.swift
//  ImageZoomView
//
//  Created by Lincoln Nguyen on 2/11/21.
//

import UIKit

class ImageZoomView: UIScrollView, UIScrollViewDelegate {
    var imageView: UIImageView!
    var gestureRecognizer: UITapGestureRecognizer!
    
    func setupGestureRecognizer() {
        gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleDoubleTap))
        gestureRecognizer.numberOfTapsRequired = 2
        addGestureRecognizer(gestureRecognizer)
    }
    
    @objc func handleDoubleTap() {
        if zoomScale == 1 {
            zoom(to: zoomRectForScale(maximumZoomScale, center: gestureRecognizer.location(in: gestureRecognizer.view)), animated: true)
        } else {
            setZoomScale(1, animated: true)
        }
    }
    
    func zoomRectForScale(_ scale: CGFloat, center: CGPoint) -> CGRect {
        var zoomRect = CGRect.zero
        zoomRect.size.height = imageView.frame.size.height / scale
        zoomRect.size.width = imageView.frame.size.width / scale
        let newCenter = convert(center, to: imageView)
        zoomRect.origin.x = newCenter.x - (zoomRect.size.width / 2.0)
        zoomRect.origin.y = newCenter.y - (zoomRect.size.height / 2.0)
        return zoomRect
    }
    
    convenience init(frame: CGRect, image: UIImage) {
        self.init(frame: frame)
        imageView = UIImageView(image: image)
        imageView.frame = frame
        imageView.contentMode = .scaleAspectFill
        addSubview(imageView)
        
        setupScrollView()
        setupGestureRecognizer()
    }
    
    func setupScrollView() {
        delegate = self
        minimumZoomScale = 1.0
        maximumZoomScale = 2.0
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
