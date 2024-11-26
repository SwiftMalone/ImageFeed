import UIKit
import Kingfisher

final class SingleImageViewController: UIViewController {
    var photo: Photo?
    @IBOutlet private var imageView: UIImageView!
    @IBOutlet private var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.minimumZoomScale = 0.1
        scrollView.maximumZoomScale = 1.25
        
        loadImage()
    }
    
    private func rescaleAndCenterImageInScrollView(image: UIImage) {
        view.layoutIfNeeded()
        let visibleRectSize = scrollView.bounds.size
        let imageSize = image.size
        let hScale = visibleRectSize.width / imageSize.width
        let vScale = visibleRectSize.height / imageSize.height
        let scale = min(hScale, vScale)
        scrollView.minimumZoomScale = scale
        scrollView.maximumZoomScale = 3
        let initialZoomScale = scrollView.maximumZoomScale
        scrollView.setZoomScale(initialZoomScale, animated: false)
        let newContentSize = scrollView.contentSize
        let xOffset = max((newContentSize.width - visibleRectSize.width) / 2, 0)
        let yOffset = max((newContentSize.height - visibleRectSize.height) / 2, 0)
        scrollView.contentOffset = CGPoint(x: xOffset, y: yOffset)
    }
    
    @IBAction func didTapShareButton(_ sender: UIButton) {
        guard let fullImageURL = photo?.largeImageURL else { return }
        let share = UIActivityViewController(
            activityItems: [fullImageURL],
            applicationActivities: nil
        )
        present(share, animated: true, completion: nil)
    }
    private func loadImage() {
        guard  let fullImageURL = URL(string: photo?.largeImageURL ?? "") else {
            assertionFailure("Invalid image URL")
            return
        }
        
        UIBlockingProgressHUD.show()
        
        imageView.kf.setImage(with: fullImageURL) { [weak self] result in
            UIBlockingProgressHUD.dismiss()
            guard let self else { return }
            
            switch result {
            case .success(let imageResult):
                self.imageView.image = imageResult.image
                self.rescaleAndCenterImageInScrollView(image: imageResult.image)
            case .failure(let error):
                print("Error loading image: \(error.localizedDescription)")
            }
        }
    }
    
    @IBAction private func didTapBackButton() {
        dismiss(animated: true, completion: nil)
    }
}

extension SingleImageViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
        
    }
}
