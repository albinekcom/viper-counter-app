//
// Created by vipergen on 2014.
// Copyright (c) 2014 DB Best. All rights reserved.
//

#import "CNTSettingsWireframe.h"
#import "CNTSettingsViewController.h"
#import "CNTSettingsInteractor.h"
#import "CNTSettingsPresenter.h"
#import "CNTSettingsWireframe.h"
#import "CNTSettingsDataManager.h"


@interface CNTSettingsWireframe()
@property (nonatomic, strong) CNTSettingsPresenter *presenter;
@property (nonatomic, strong) CNTSettingsViewController *view;
@end

@implementation CNTSettingsWireframe

- (id)init {
    self = [super init];
    if (self) {
        [self connectDependencies];
    }
    return self;
}

- (void)connectDependencies {
    
    // Generating module components
    self.view = [[CNTSettingsViewController alloc] init];
    CNTSettingsPresenter *presenter = [CNTSettingsPresenter new];
    CNTSettingsInteractor *interactor = [CNTSettingsInteractor new];
    CNTSettingsDataManager *dataManager = [CNTSettingsDataManager sharedManager];
    
    // Connecting
    self.view.presenter = presenter;
    
    presenter.view = self.view;
    presenter.wireframe = self;
    presenter.interactor = interactor;
    
    interactor.output = presenter;
    interactor.dataManager = dataManager;
    
    self.presenter = presenter;
}

- (void)presentFromViewController:(UIViewController *)viewController
{
    //TOODO - New view controller presentation (present, push, pop, .. )
    [viewController presentViewController:self.view animated:YES completion:^{
        //
    }];
    
}

- (void)dismiss {
    [self.view dismissViewControllerAnimated:YES completion:^{
        //
    }];
}

@end
