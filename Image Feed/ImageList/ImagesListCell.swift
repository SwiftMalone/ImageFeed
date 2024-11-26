import UIKit
import Kingfisher


public final class ImagesListCell: UITableViewCell {
    static let reuseIdentifier = "ImagesListCell"
    weak var delegate: ImagesListCellDelegate?
    @IBOutlet var cellImage: UIImageView!
    @IBOutlet var likeButton: UIButton!
    @IBOutlet var dateLabel: UILabel!
    public override func prepareForReuse() {
        super.prepareForReuse()
        cellImage.kf.cancelDownloadTask()
    }
    
    @IBAction func likeButtonClicked() {
        delegate?.imagesListCellDidTapLike(self)
    }
    
    func setIsLiked(_ isLike: Bool) {
        let likeImage = isLike ? UIImage(named:"like_button_on") : UIImage(named:"like_button_off")
        self.likeButton.setImage(likeImage, for: .normal)
    }
}
