//
//  PasteAllTextView.m
//  PastingImageTextView
//
//  Created by Anirudh Vyas on 04/04/16.
//  Copyright © 2016 Anirudh Vyas. All rights reserved.
//

#import "PasteAllTextView.h"

@implementation PasteAllTextView

/**
 * Overriding the paste method to paste an image in the text view. Achieved using the NSTextAttachment of attributed string. Attaching an image to the attributed string.
 */
-(void)paste:(id)sender
{
    UIPasteboard* pasteBoard = [UIPasteboard generalPasteboard];
    NSMutableAttributedString *attributedString;
    
    if ([self.attributedText length] > 0)
    {
        attributedString = [[NSMutableAttributedString alloc] initWithAttributedString:self.attributedText];
    }
    else
    {
        attributedString = [[NSMutableAttributedString alloc] initWithString:self.text];
    }
    
    NSTextAttachment* textAttachment = [[NSTextAttachment alloc]init];
    
    if ([pasteBoard image]) {
        
        textAttachment.image = _shouldResizeImageToFit ? [self scaleDownTheImageToFit:[pasteBoard image]] : [pasteBoard image];
        
        NSAttributedString* stringWithAttachment = [NSAttributedString attributedStringWithAttachment:textAttachment];
        
        [attributedString appendAttributedString:stringWithAttachment];
        
        stringWithAttachment = nil;
    }
    
    self.attributedText = attributedString;
    
    textAttachment = nil;
    attributedString = nil;
    pasteBoard = nil;
    
    [super paste:sender];

}

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
    if (action == @selector(paste:) && [UIPasteboard generalPasteboard].image)
        return YES;
    else
        return [super canPerformAction:action withSender:sender];
}

- (UIImage*)scaleDownTheImageToFit:(UIImage*)image
{
    CGFloat oldWidth = image.size.width;
    
    CGFloat scaleFactor = oldWidth / (self.frame.size.width - 10);
    image = [UIImage imageWithCGImage:image.CGImage scale:scaleFactor orientation:UIImageOrientationUp];
    
    return image;
}

@end

