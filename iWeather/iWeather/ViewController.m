//
//  ViewController.m
//  iWeather
//
//  Created by thanh tung on 11/11/15.
//  Copyright © 2015 thanh tung. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *location;
@property (weak, nonatomic) IBOutlet UIButton *temperature;
@property (weak, nonatomic) IBOutlet UIImageView *weatherIcon;
@property (weak, nonatomic) IBOutlet UILabel *quote;
@property (weak, nonatomic) IBOutlet UILabel *labelCF;

@end

@implementation ViewController
{
    NSArray* quotes;
    NSArray* locations;
    NSArray* temperatures;
    NSArray* weatherIcons;
    BOOL _statusCF; // bien tam luu trang thai hien thi do C/F
    float _valueTemperature; // bien tam luu gia tri nhiet do
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    quotes = @[@"Một con ngựa đau cả tàu bỏ cỏ", @"Có công mài sắt có ngày nên kim", @"Chớ thấy sóng cả mà ngã tay chèo", @"Không có gì quý hơn độc lập tự do", @"Đi một ngày đàng học một sàng khôn"];
    locations = @[@"Hanoi, Vietnam",@"Newyork, US",@"Sysney, France",@"Manchester, Eng"];
    weatherIcons = @[@"rain",@"sunny",@"thunder",@"windy"];
    
    _statusCF = true;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)updateWeather:(id)sender {
    int quoteIndex = arc4random_uniform((int)quotes.count);
    //NSLog(@"%d", quoteIndex);
    self.quote.text = quotes[quoteIndex];
    int locationIndex =  arc4random_uniform((int)locations.count);
    self.location.text = locations[locationIndex];
    int photoIndex = arc4random_uniform((int)weatherIcons.count);
    self.weatherIcon.image = [UIImage imageNamed:weatherIcons[photoIndex]];
    _valueTemperature = [self getTemperature]; // set nhiet do C lay duoc vao bien tam
    [self settitlelabeCF];
    [self setTitleTemperature];


    
}

-(void) setTitleTemperature{
    if(_statusCF==true){ // do C
        NSString* string = [NSString stringWithFormat:@"%2.1f",_valueTemperature];
        [self.temperature setTitle:string forState:UIControlStateNormal];
        
    }
    else{ // do F
        NSString* string = [NSString stringWithFormat:@"%3.1f",[self converCtoF]];
        [self.temperature setTitle:string forState:UIControlStateNormal];
    }
}

-(void) settitlelabeCF{
    if(_statusCF == true){
        _labelCF.text = @"C";
    }else{
        _labelCF.text = @"F";
    }
}

-(float) getTemperature {
        float _valueC = 14.0 + arc4random_uniform(18) + (float)arc4random()/(float) INT32_MAX;
    if(_statusCF==true){
        return _valueC;
    }else{
        return _valueC*1.8+32;
    }
    
}

-(float) converCtoF{
    return _valueTemperature*1.8+32;
}


- (IBAction)temperatureTap:(id)sender {
    if(_statusCF == true){
        _statusCF = false;
    }else{
        _statusCF = true;
    }
    [self setTitleTemperature];
    NSLog(@"%f",_valueTemperature);
    NSLog(@"%f",_valueTemperature*1.8+32);
    [self settitlelabeCF];
    
    
}

@end
