//
//  HelloIphoneViewController.m
//  HelloIphone
//
//  Created by roc on 2016/11/16.
//  Copyright © 2016年 saic. All rights reserved.
//

#import "HelloIphoneViewController.h"

@interface HelloIphoneViewController ()

@end

@implementation HelloIphoneViewController

@synthesize userNameText;
@synthesize passwordText;
@synthesize sliderLabel;
@synthesize swtichButton;
@synthesize button;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)textUseNameDone:(id)sender {
    [sender resignFirstResponder];//放弃当前焦点
}

- (IBAction)textPasswordDone:(id)sender {
    [sender resignFirstResponder];//放弃当前焦点
}

- (IBAction)sliderChanged:(id)sender {
    UISlider *uiSlider = (UISlider*)sender;
    float size = (float)uiSlider.value;
    NSLog(@"%.2f %%", size * 100);
    NSString *sizeText = [[NSString alloc] initWithFormat:@"%.2f %%",size * 100];
    sliderLabel.text = sizeText;
}

- (IBAction)segementButton:(id)sender {
    if([sender selectedSegmentIndex] == 0)
    {
        swtichButton.hidden = NO;
        button.hidden = YES;
        
    }else {
        swtichButton.hidden = YES;
        button.hidden = NO;
    }
}

- (IBAction)switchchanged:(id)sender {
//    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"U will die!" delegate:self cancelButtonTitle:@"OK" destructiveButtonTitle:@"i know"
//                                              otherButtonTitles: nil];
//    [sheet showInView:self.view];
//    
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:@"U will die!" preferredStyle: UIAlertControllerStyleActionSheet];
    
    UIPopoverPresentationController *popover = alertController.popoverPresentationController;
    UIView* senderView = (UIView *)sender;
    if (popover){
        popover.sourceView = senderView;
        popover.sourceRect = senderView.bounds;
        popover.permittedArrowDirections = UIPopoverArrowDirectionAny;
    }
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *deleteAction = [UIAlertAction actionWithTitle:@"i know" style:UIAlertActionStyleDestructive handler:nil];
//    UIAlertAction *archiveAction = [UIAlertAction actionWithTitle:@"保存" style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:cancelAction];
    [alertController addAction:deleteAction];
//    [alertController addAction:archiveAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

- (IBAction)buttonOnclick:(id)sender {
//    [self showNamal];
//    [self showLogin];
    
    [self showSlide:sender];
}

- (void) showNamal {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"警告提示!" message:@"这个是UIAlertController的默认样式" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *resetAction = [UIAlertAction actionWithTitle:@"重置" style:UIAlertActionStyleDestructive handler:nil];
    //    [alertController addAction:resetAction];
    //    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:resetAction];
    [alertController addAction:cancelAction];
    
    //    [alertController addAction:okAction];
    [self presentViewController:alertController animated:YES completion:nil];
}


- (void) showLogin {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"文本对话框" message:@"登录和密码对话框示例" preferredStyle:UIAlertControllerStyleAlert];
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField){
        textField.placeholder = @"登录";
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(alertTextFieldDidChange:) name:UITextFieldTextDidChangeNotification object:textField];
    }];

    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"密码";
        textField.secureTextEntry = YES;
    }];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
//        UITextField *login = alertController.textFields.firstObject;
//        UITextField *password = alertController.textFields.lastObject;
        
        [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextFieldTextDidChangeNotification object:nil];
    }];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    
    okAction.enabled = NO;
    
    [alertController addAction:cancelAction];
    [alertController addAction:okAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)alertTextFieldDidChange:(NSNotification *)notification{
    UIAlertController *alertController = (UIAlertController *)self.presentedViewController;
    if (alertController) {
        UITextField *login = alertController.textFields.firstObject;
        UIAlertAction *okAction = alertController.actions.lastObject;
        okAction.enabled = login.text.length > 2;
    }
}

- (void) showSlide:(id)sender {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"保存或删除数据" message:@"删除数据将不可恢复" preferredStyle: UIAlertControllerStyleActionSheet];
    
    UIPopoverPresentationController *popover = alertController.popoverPresentationController;
    UIView* senderView = (UIView *)sender;
    if (popover){
        popover.sourceView = senderView;
        popover.sourceRect = senderView.bounds;
        popover.permittedArrowDirections = UIPopoverArrowDirectionAny;
    }
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *deleteAction = [UIAlertAction actionWithTitle:@"删除" style:UIAlertActionStyleDestructive handler:nil];
    UIAlertAction *archiveAction = [UIAlertAction actionWithTitle:@"保存" style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:cancelAction];
    [alertController addAction:deleteAction];
    [alertController addAction:archiveAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
}
@end
