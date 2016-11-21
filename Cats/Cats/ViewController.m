//
//  ViewController.m
//  Cats
//
//  Created by Carl Udren on 11/21/16.
//  Copyright © 2016 Carl Udren. All rights reserved.
//

#import "ViewController.h"
#import "DataHelper.h"
#import "PhotoCollectionViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (strong, nonatomic) NSArray* photoDataArray;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonWasPressed:(id)sender {
    //submit tag and fetch photos
    [DataHelper fetchPhotosFromTag:self.textField.text completion:^(NSArray *array) {
        [self.navigationController performSegueWithIdentifier:@"showCollectionView" sender:self];
    }];
    //networking code
    //completion
    //launch collection view
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier  isEqual: @"showCollectionView"] && self.photoDataArray != nil) {
        PhotoCollectionViewController* collectionVC = (PhotoCollectionViewController*)segue.destinationViewController;
        collectionVC.photoDataArray = self.photoDataArray;
    }
}


@end
