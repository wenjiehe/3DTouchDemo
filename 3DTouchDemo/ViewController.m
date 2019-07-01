//
//  ViewController.m
//  3DTouchDemo
//
//  Created by 贺文杰 on 2019/6/30.
//  Copyright © 2019 贺文杰. All rights reserved.
//

#import "ViewController.h"
#import "ContentViewController.h"

@interface ViewController ()<UIViewControllerPreviewingDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    /*
     Peek and Pop 在操作上是指用户在手机屏幕上按压想要预览的选项位置，弹出一个可以预览的二级页面的预览窗口可以根据设置，设置一些快捷的操作选项，以类似sheetAlertView的方式呈现出来。
     */
    [self check3DTouch];

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    //按压力度
    NSLog(@"%s\n force = %f, maximumPossibleForce = %f", __FUNCTION__, touch.force, touch.maximumPossibleForce);
}

- (IBAction)actionButton:(id)sender {
    UIStoryboard *main = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *vc = [main instantiateViewControllerWithIdentifier:@"contentVC"];
    [self presentViewController:vc animated:YES completion:^{

    }];
}

- (void)check3DTouch
{
    if (self.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable) {//支持3D Touch
        //给viewController上的view注册3D Touch功能
        [self registerForPreviewingWithDelegate:(id)self sourceView:self.view];
    }else{ //不支持3D Touch
        
    }
}

- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection
{
    [self check3DTouch];
}

#pragma mark -
#pragma mark -- UIViewControllerPreviewingDelegate
/*
    previewingContext 注册了3dtouch的视图，也就是sourceView
    location 手指在屏幕上按压的位置，通常可以根据这个位置计算出是在按压哪一个单元格。
    return 预览的控制器界面
 */
- (nullable UIViewController *)previewingContext:(id <UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location
{
    NSLog(@"%s", __FUNCTION__);
    if ([self.presentationController isKindOfClass:[ContentViewController class]]) {
        NSLog(@"相同class");
        return nil;
    }else{
        UIStoryboard *main = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        UIViewController *vc = [main instantiateViewControllerWithIdentifier:@"contentVC"];
        previewingContext.sourceRect = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 300);
        return vc;
    }
}

/*
    实现pop方法
    pop方法是3dtouch 效果的最后一步了，用力的按压想要预览的单元格，力度达到了极限会直接进入到这里。
    在这个方法里做一般的Push操作就可以了。
 */
- (void)previewingContext:(id <UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit
{
    NSLog(@"%s", __FUNCTION__);
    UIStoryboard *main = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *vc = [main instantiateViewControllerWithIdentifier:@"commandvc"];
    [self showViewController:vc sender:self];
}


@end
