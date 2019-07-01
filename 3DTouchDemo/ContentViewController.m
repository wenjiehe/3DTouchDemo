//
//  ContentViewController.m
//  3DTouchDemo
//
//  Created by 贺文杰 on 2019/6/30.
//  Copyright © 2019 贺文杰. All rights reserved.
//

#import "ContentViewController.h"

@interface ContentViewController ()

@end

@implementation ContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self check3DTouch];
}

- (IBAction)tap:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (void)check3DTouch
{
    if (self.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable) {//支持3D Touch
        //给viewController上的view注册3D Touch功能
    }else{ //不支持3D Touch
        
    }
}

/*
    生成快捷功能菜单
 */
- (NSArray <id<UIPreviewActionItem>> *)previewActionItems
{
    UIPreviewAction *action1 = [UIPreviewAction actionWithTitle:@"number1" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"number1");
    }];
    
    UIPreviewAction *action2 = [UIPreviewAction actionWithTitle:@"number2" style:UIPreviewActionStyleSelected handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"number2");
    }];
    
    
//    UIPreviewActionGroup *group = [UIPreviewActionGroup actionGroupWithTitle:@"action group" style:UIPreviewActionStyleDefault actions:@[action1, action2]];
    
//    return @[group];
    return @[action1, action2];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
