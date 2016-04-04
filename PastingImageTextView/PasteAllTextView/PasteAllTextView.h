//
//  PasteAllTextView.h
//  PastingImageTextView
//
//  Created by Anirudh Vyas on 04/04/16.
//  Copyright © 2016 Anirudh Vyas. All rights reserved.
//
//  Class description: Class inherited from UITextView in order to paste images in TextViews.

#import <UIKit/UIKit.h>

@interface PasteAllTextView : UITextView

/*!
 * @brief BOOL to make image fit to the text view bounds. 
 */
@property (nonatomic, assign) IBInspectable BOOL shouldResizeImageToFit;

@end
