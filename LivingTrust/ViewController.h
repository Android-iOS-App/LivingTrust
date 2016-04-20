//
//  ViewController.h
//  LivingTrust
//
//  Created by dev on 2016. 3. 10..
//  Copyright © 2016 company.KO. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NJKWebViewProgress.h"
@interface ViewController : UIViewController<UIWebViewDelegate, NJKWebViewProgressDelegate>
- (IBAction)searchButtonPushed:(id)sender;
- (IBAction)reloadButtonPushed:(id)sender;
- (IBAction)buttonForwoard:(id)sender;
- (IBAction)buttonBack:(id)sender;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *Forwoard;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *back;


@end

