//
//  WebserviceViewController.m
//  Minifm
//
//  Created by Samosys on 16/09/15.
//  Copyright (c) 2015 Samosys. All rights reserved.
//

#import "WebserviceViewController.h"
#import "AppDelegate.h"
#import "Utilities.h"
#import "SBJSON.h"
#import "MBProgressHUD.h"
#define WEBURL @"http://103.15.67.74/pro1/dressconnect/webservice/dressconnect_webservice.php?method="
@implementation WebserviceViewController{

MBProgressHUD *activityIndicator;

}
//@synthesize callBackSelector;
//@synthesize callBackTarget;

AppDelegate *l_appDelegate;
#pragma mark getVINinfo API (get data related VIN Number)3

-(void)Registration:(SEL)tempSelector tempTarget:(id)tempTarget :(NSString *)email :(NSString *)password :(NSString *)username :(NSString *)gender :(NSString *)dob :(NSString *)deviceid :(NSData *)imageData
{
    http://103.15.67.74/pro1/dressconnect/webservice/dressconnect_webservice.php?method=registration&email=irshad123@gmail.com&password=1234&username=irshad&name=Irshadkhan&gender=male&dob=01-01-01&deviceid=11111111


    l_appDelegate=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    callBackSelector=tempSelector;
    callBackTarget=tempTarget;
    if([Utilities CheckInternetConnection])//0: internet working
    {
        //http://103.15.67.74/pro1/twot/webservice/webservice.php?method=add_new_product&product_name=test product&description=test desc&price=12&user_id=1&category_id=1&brand_id=1&size_id=1&image_name=test.jpg
        
        NSString  *urlStr=[NSMutableString stringWithFormat:@"%@registration",WEBURL];
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init] ;
        
        [request setURL:[NSURL URLWithString:urlStr]];
        [request setHTTPMethod:@"POST"];
        
        NSString *boundary = @"---------------------------14737809831466499882746641449";
        NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",boundary];
        [request addValue:contentType forHTTPHeaderField: @"Content-Type"];
        
        NSMutableData *body = [NSMutableData data];
        
        //parameter1
        [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"email\"\r\n\r\n%@", email] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        
        [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"password\"\r\n\r\n%@", password] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        
        //parameter1
        [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"name\"\r\n\r\n%@", username] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        
        //parameter1
        [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"gender\"\r\n\r\n%@", gender] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        
        
        //parameter1
        [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"dob\"\r\n\r\n%@", dob] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        
        //parameter1
        [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"deviceid\"\r\n\r\n%@", deviceid] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        
        
        //parameter2
        NSDate *sendimgename=[NSDate date];
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"ddMMyyyy:hh:mm:ss"];
        
        NSString *stringFromDate = [formatter stringFromDate:sendimgename];
        
        //NSLog(@"%@",stringFromDate);
        
        
        
        
        [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithString:[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"image\"; filename=\"%@.jpeg\"\r\n",stringFromDate]] dataUsingEncoding:NSUTF8StringEncoding]];
        
        [body appendData:[@"Content-Type: image/png\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[NSData dataWithData:imageData]];
        [body appendData:[[NSString stringWithFormat:@"\r\n--%@--\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        NSLog(@"PIC NAME IS %@",stringFromDate);
        [request setHTTPBody:body];
        
        l_theConnection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
        
        [l_theConnection start];
        
        if(l_theConnection)
        {
            NSLog(@"Request sent to get data");
        }
        //[temp_strJson release];
        
        request = nil;
        
        
    }
    else if(![Utilities CheckInternetConnection])
    {
        
    }
}
-(void)Login:(SEL)tempSelector tempTarget:(id)tempTarget : (NSString *)email : (NSString *)password :(NSString *)deviceid
{
  
    //http://103.15.67.74/pro1/dressconnect/webservice/dressconnect_webservice.php?method=login&email=kalyan1@gmail.com&password=1234

    l_appDelegate=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    callBackSelector=tempSelector;
    callBackTarget=tempTarget;
    if([Utilities CheckInternetConnection])//0: internet working
    {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
        NSMutableString *temp_url;
            temp_url=[NSMutableString stringWithFormat:@"%@login&email=%@&password=%@",WEBURL,email,password];
            temp_url=(NSMutableString *)[temp_url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
            NSLog(@"%@",temp_url);
        
       
        
        NSMutableURLRequest *theRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:temp_url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20.0];
        
        
        NSDictionary *headerFieldsDict = [[NSDictionary alloc] initWithObjectsAndKeys:@"application/x-www-form-urlencoded", @"Content-Type", nil];
        
        //[theRequest setHTTPBody:[temp_strJson dataUsingEncoding:NSUTF8StringEncoding]];
        [theRequest setAllHTTPHeaderFields:headerFieldsDict];
        [theRequest setHTTPMethod:@"GET"];
        
        l_theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
        
        [l_theConnection start];
        
        if(l_theConnection)
        {
            NSLog(@"Request sent to get data");
        }
        //[temp_strJson release];
        
    }
    else
    {
        
    }
}
-(void)CheckEmail:(SEL)tempSelector tempTarget:(id)tempTarget : (NSString *)email
{
    //http://103.15.67.74/pro1/dressconnect/webservice/dressconnect_webservice.php?method=check_email&email=irshad.khan@samosys.com
    
    l_appDelegate=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    callBackSelector=tempSelector;
    callBackTarget=tempTarget;
    if([Utilities CheckInternetConnection])//0: internet working
    {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
        NSMutableString *temp_url;
        temp_url=[NSMutableString stringWithFormat:@"%@check_email&email=%@",WEBURL,email];
        temp_url=(NSMutableString *)[temp_url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSLog(@"%@",temp_url);
        
        
        
        NSMutableURLRequest *theRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:temp_url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20.0];
        
        
        NSDictionary *headerFieldsDict = [[NSDictionary alloc] initWithObjectsAndKeys:@"application/x-www-form-urlencoded", @"Content-Type", nil];
        
        //[theRequest setHTTPBody:[temp_strJson dataUsingEncoding:NSUTF8StringEncoding]];
        [theRequest setAllHTTPHeaderFields:headerFieldsDict];
        [theRequest setHTTPMethod:@"GET"];
        
        l_theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
        
        [l_theConnection start];
        
        if(l_theConnection)
        {
            NSLog(@"Request sent to get data");
        }
        //[temp_strJson release];
        
    }
    else
    {
        
    }
    
}

-(void)InsertEvent:(SEL)tempSelector tempTarget:(id)tempTarget :(NSString *)user_id :(NSString *)title :(NSString *)location :(NSString *)dressCode
{
    
    l_appDelegate=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    callBackSelector=tempSelector;
    callBackTarget=tempTarget;
    if([Utilities CheckInternetConnection])//0: internet working
    {
        //http://103.15.67.74/pro1/twot/webservice/webservice.php?method=add_new_product&product_name=test product&description=test desc&price=12&user_id=1&category_id=1&brand_id=1&size_id=1&image_name=test.jpg
       // http://103.15.67.74/pro1/dressconnect/webservice/dressconnect_webservice.php?method=insert_event&userid=1&title=abc&location=aaaa&dresscode=any
        NSString  *urlStr=[NSMutableString stringWithFormat:@"%@insert_event",WEBURL];
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init] ;
        
        [request setURL:[NSURL URLWithString:urlStr]];
        [request setHTTPMethod:@"POST"];
        
        NSString *boundary = @"---------------------------14737809831466499882746641449";
        NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",boundary];
        [request addValue:contentType forHTTPHeaderField: @"Content-Type"];
        
        NSMutableData *body = [NSMutableData data];
        
        //parameter1
        [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"userid\"\r\n\r\n%@", user_id] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        
        [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"title\"\r\n\r\n%@", title] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        
        //parameter1
        [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"location\"\r\n\r\n%@", location] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        
        //parameter1
        [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"dresscode\"\r\n\r\n%@", dressCode] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        
        
//        //parameter1
//        [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
//        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"category_id\"\r\n\r\n%@", category_Id] dataUsingEncoding:NSUTF8StringEncoding]];
//        [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
//        
//        //parameter1
//        [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
//        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"brand_id\"\r\n\r\n%@", brand_id] dataUsingEncoding:NSUTF8StringEncoding]];
//        [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
//        
//        //parameter1
//        [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
//        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"size_id\"\r\n\r\n%@", size_Id] dataUsingEncoding:NSUTF8StringEncoding]];
//        [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
//        
////        //parameter1
////        [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
////        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"mobile_no\"\r\n\r\n%@", mobile_no] dataUsingEncoding:NSUTF8StringEncoding]];
////        [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
//        
//        //parameter2
//        NSDate *sendimgename=[NSDate date];
//        
//        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//        [formatter setDateFormat:@"ddMMyyyy:hh:mm:ss"];
//        
//        NSString *stringFromDate = [formatter stringFromDate:sendimgename];
//        
//        //NSLog(@"%@",stringFromDate);
//        
//        
        
//        
//        [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
//        [body appendData:[[NSString stringWithString:[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"image_name\"; filename=\"%@.jpeg\"\r\n",stringFromDate]] dataUsingEncoding:NSUTF8StringEncoding]];
//        
//        [body appendData:[@"Content-Type: image/png\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
//        [body appendData:[NSData dataWithData:imageData]];
//        [body appendData:[[NSString stringWithFormat:@"\r\n--%@--\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
//        NSLog(@"PIC NAME IS %@",stringFromDate);
        [request setHTTPBody:body];
        
        l_theConnection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
        
        [l_theConnection start];
        
        if(l_theConnection)
        {
            NSLog(@"Request sent to get data");
        }
        //[temp_strJson release];
        
        request = nil;
        
        
    }
    else if(![Utilities CheckInternetConnection])
    {
        
    }

}
-(void)ForgetPassword:(SEL)tempSelector tempTarget:(id)tempTarget :(NSString *)Email

{
    
   //http://103.15.67.74/pro1/dressconnect/webservice/dressconnect_webservice.php?method=forgot_password&email=irshad.khan@samosys.com
    
    l_appDelegate=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    callBackSelector=tempSelector;
    callBackTarget=tempTarget;
    if([Utilities CheckInternetConnection])//0: internet working
    {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
        NSMutableString *temp_url;
        temp_url=[NSMutableString stringWithFormat:@"%@forgot_password&email=%@",WEBURL,Email];
        temp_url=(NSMutableString *)[temp_url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSLog(@"%@",temp_url);
        
        
        
        NSMutableURLRequest *theRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:temp_url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20.0];
        
        
        NSDictionary *headerFieldsDict = [[NSDictionary alloc] initWithObjectsAndKeys:@"application/x-www-form-urlencoded", @"Content-Type", nil];
        
        //[theRequest setHTTPBody:[temp_strJson dataUsingEncoding:NSUTF8StringEncoding]];
        [theRequest setAllHTTPHeaderFields:headerFieldsDict];
        [theRequest setHTTPMethod:@"GET"];
        
        l_theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
        
        [l_theConnection start];
        
        if(l_theConnection)
        {
            NSLog(@"Request sent to get data");
        }
        //[temp_strJson release];
        
    }
    else
    {
        
    }
}
-(void)GetEventDetail:(SEL)tempSelector tempTarget:(id)tempTarget : (NSString *)userID

{
    
    //http://103.15.67.74/pro1/twot/webservice/webservice.php?method=select_brand
    //http://103.15.67.74/pro1/dressconnect/webservice/dressconnect_webservice.php?method=get_event_detail&userid=1
    
    
    l_appDelegate=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    callBackSelector=tempSelector;
    callBackTarget=tempTarget;
    if([Utilities CheckInternetConnection])//0: internet working
    {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
        NSMutableString *temp_url;
        temp_url=[NSMutableString stringWithFormat:@"%@get_event_detail&userid=%@",WEBURL,userID];
        temp_url=(NSMutableString *)[temp_url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSLog(@"%@",temp_url);
        
        
        
        NSMutableURLRequest *theRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:temp_url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20.0];
        
        
        NSDictionary *headerFieldsDict = [[NSDictionary alloc] initWithObjectsAndKeys:@"application/x-www-form-urlencoded", @"Content-Type", nil];
        
        //[theRequest setHTTPBody:[temp_strJson dataUsingEncoding:NSUTF8StringEncoding]];
        [theRequest setAllHTTPHeaderFields:headerFieldsDict];
        [theRequest setHTTPMethod:@"GET"];
        
        l_theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
        
        [l_theConnection start];
        
        if(l_theConnection)
        {
            NSLog(@"Request sent to get data");
        }
        //[temp_strJson release];
        
    }
    else
    {
        
    }
}
-(void)Size:(SEL)tempSelector tempTarget:(id)tempTarget

{
    
    //http://103.15.67.74/pro1/twot/webservice/webservice.php?method=select_size
    
    
    l_appDelegate=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    callBackSelector=tempSelector;
    callBackTarget=tempTarget;
    if([Utilities CheckInternetConnection])//0: internet working
    {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
        NSMutableString *temp_url;
        temp_url=[NSMutableString stringWithFormat:@"%@select_size",WEBURL];
        temp_url=(NSMutableString *)[temp_url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSLog(@"%@",temp_url);
        
        
        
        NSMutableURLRequest *theRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:temp_url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20.0];
        
        
        NSDictionary *headerFieldsDict = [[NSDictionary alloc] initWithObjectsAndKeys:@"application/x-www-form-urlencoded", @"Content-Type", nil];
        
        //[theRequest setHTTPBody:[temp_strJson dataUsingEncoding:NSUTF8StringEncoding]];
        [theRequest setAllHTTPHeaderFields:headerFieldsDict];
        [theRequest setHTTPMethod:@"GET"];
        
        l_theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
        
        [l_theConnection start];
        
        if(l_theConnection)
        {
            NSLog(@"Request sent to get data");
        }
        //[temp_strJson release];
        
    }
    else
    {
        
    }
}
-(void)ProductList:(SEL)tempSelector tempTarget:(id)tempTarget :(NSString *)userId

{
    
    ///http://103.15.67.74/pro1/twot/webservice/webservice.php?method=show_product_listing&user_id=11


    
    
    l_appDelegate=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    callBackSelector=tempSelector;
    callBackTarget=tempTarget;
    if([Utilities CheckInternetConnection])//0: internet working
    {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
        NSMutableString *temp_url;
        temp_url=[NSMutableString stringWithFormat:@"%@show_product_listing&user_id=%@",WEBURL,userId];
        temp_url=(NSMutableString *)[temp_url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSLog(@"%@",temp_url);
        
        
        
        NSMutableURLRequest *theRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:temp_url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20.0];
        
        
        NSDictionary *headerFieldsDict = [[NSDictionary alloc] initWithObjectsAndKeys:@"application/x-www-form-urlencoded", @"Content-Type", nil];
        
        //[theRequest setHTTPBody:[temp_strJson dataUsingEncoding:NSUTF8StringEncoding]];
        [theRequest setAllHTTPHeaderFields:headerFieldsDict];
        [theRequest setHTTPMethod:@"GET"];
        
        l_theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
        
        [l_theConnection start];
        
        if(l_theConnection)
        {
            NSLog(@"Request sent to get data");
        }
        //[temp_strJson release];
        
    }
    else
    {
        
    }
}

//This Method called for Show Product Detail by Product ID
-(void)Product_Detail_id:(SEL)tempSelector tempTarget:(id)tempTarget :(NSString *)product_id
{
    
// http://103.15.67.74/pro1/twot/webservice/webservice.php?method=product_by_id&id=1


l_appDelegate=(AppDelegate *)[[UIApplication sharedApplication]delegate];

callBackSelector=tempSelector;
callBackTarget=tempTarget;
if([Utilities CheckInternetConnection])//0: internet working
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    NSMutableString *temp_url;
    temp_url=[NSMutableString stringWithFormat:@"%@product_by_id&id=%@",WEBURL,product_id];
    temp_url=(NSMutableString *)[temp_url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"%@",temp_url);
    
    
    
    NSMutableURLRequest *theRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:temp_url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20.0];
    
    
    NSDictionary *headerFieldsDict = [[NSDictionary alloc] initWithObjectsAndKeys:@"application/x-www-form-urlencoded", @"Content-Type", nil];
    
    //[theRequest setHTTPBody:[temp_strJson dataUsingEncoding:NSUTF8StringEncoding]];
    [theRequest setAllHTTPHeaderFields:headerFieldsDict];
    [theRequest setHTTPMethod:@"GET"];
    
    l_theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
    
    [l_theConnection start];
    
    if(l_theConnection)
    {
        NSLog(@"Request sent to get data");
    }
    //[temp_strJson release];
    
}
else
{
    
}
}


-(void)Product_List_By_UserID:(SEL)tempSelector tempTarget:(id)tempTarget :(NSString *)user_Id

{
    
       //http://103.15.67.74/pro1/twot/webservice/webservice.php?method=product_list_by_id&id=4
    
    
    
    l_appDelegate=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    callBackSelector=tempSelector;
    callBackTarget=tempTarget;
    if([Utilities CheckInternetConnection])//0: internet working
    {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
        NSMutableString *temp_url;
        temp_url=[NSMutableString stringWithFormat:@"%@product_list_by_id&id=%@",WEBURL,user_Id];
        temp_url=(NSMutableString *)[temp_url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSLog(@"%@",temp_url);
        
        
        
        NSMutableURLRequest *theRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:temp_url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20.0];
        
        
        NSDictionary *headerFieldsDict = [[NSDictionary alloc] initWithObjectsAndKeys:@"application/x-www-form-urlencoded", @"Content-Type", nil];
        
        //[theRequest setHTTPBody:[temp_strJson dataUsingEncoding:NSUTF8StringEncoding]];
        [theRequest setAllHTTPHeaderFields:headerFieldsDict];
        [theRequest setHTTPMethod:@"GET"];
        
        l_theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
        
        [l_theConnection start];
        
        if(l_theConnection)
        {
            NSLog(@"Request sent to get data");
        }
        //[temp_strJson release];
        
    }
    else
    {
        
    }
}
-(void)Profile_By_User_Id:(SEL)tempSelector tempTarget:(id)tempTarget :(NSString *)user_Id
{
    //http://103.15.67.74/pro1/twot/webservice/webservice.php?method=profile&id=4
    
    
    
    l_appDelegate=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    callBackSelector=tempSelector;
    callBackTarget=tempTarget;
    if([Utilities CheckInternetConnection])//0: internet working
    {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
        NSMutableString *temp_url;
        temp_url=[NSMutableString stringWithFormat:@"%@profile&id=%@",WEBURL,user_Id];
        temp_url=(NSMutableString *)[temp_url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSLog(@"%@",temp_url);
        
        
        
        NSMutableURLRequest *theRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:temp_url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20.0];
        
        
        NSDictionary *headerFieldsDict = [[NSDictionary alloc] initWithObjectsAndKeys:@"application/x-www-form-urlencoded", @"Content-Type", nil];
        
        //[theRequest setHTTPBody:[temp_strJson dataUsingEncoding:NSUTF8StringEncoding]];
        [theRequest setAllHTTPHeaderFields:headerFieldsDict];
        [theRequest setHTTPMethod:@"GET"];
        
        l_theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
        
        [l_theConnection start];
        
        if(l_theConnection)
        {
            NSLog(@"Request sent to get data");
        }
        //[temp_strJson release];
        
    }
    else
    {
        
    }

}
-(void)Update_User_Profile:(SEL)tempSelector tempTarget:(id)tempTarget :(NSString *)user_Id :(NSString *)firstName :(NSString *)lastName :(NSString *)currentPassword :(NSString *)newPassword :(NSData *)imageData
{
    //http://103.15.67.74/pro1/twot/webservice/webservice.php?method=update_profile&id=4
    
    
    
//    l_appDelegate=(AppDelegate *)[[UIApplication sharedApplication]delegate];
//    
//    callBackSelector=tempSelector;
//    callBackTarget=tempTarget;
//    if([Utilities CheckInternetConnection])//0: internet working
//    {
//        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
//        NSMutableString *temp_url;
//        temp_url=[NSMutableString stringWithFormat:@"%@update_profile&id=%@&firstname=%@&lastname=%@&currentpassword=%@&newpassword=%@",WEBURL,user_Id,firstName,lastName,currentPassword,newPassword];
//        temp_url=(NSMutableString *)[temp_url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//        NSLog(@"%@",temp_url);
//        
//        
//        
//        NSMutableURLRequest *theRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:temp_url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20.0];
//        
//        
//        NSDictionary *headerFieldsDict = [[NSDictionary alloc] initWithObjectsAndKeys:@"application/x-www-form-urlencoded", @"Content-Type", nil];
//        
//        //[theRequest setHTTPBody:[temp_strJson dataUsingEncoding:NSUTF8StringEncoding]];
//        [theRequest setAllHTTPHeaderFields:headerFieldsDict];
//        [theRequest setHTTPMethod:@"GET"];
//        
//        l_theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
//        
//        [l_theConnection start];
//        
//        if(l_theConnection)
//        {
//            NSLog(@"Request sent to get data");
//        }
//        //[temp_strJson release];
//        
//    }
//    else
//    {
//        
//    }
    l_appDelegate=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    callBackSelector=tempSelector;
    callBackTarget=tempTarget;
    if([Utilities CheckInternetConnection])//0: internet working
    {
       //http://103.15.67.74/pro1/twot/webservice/webservice.php?method=update_profile
        
        NSString  *urlStr=[NSMutableString stringWithFormat:@"%@update_profile",WEBURL];
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init] ;
        
        [request setURL:[NSURL URLWithString:urlStr]];
        [request setHTTPMethod:@"POST"];
        
        NSString *boundary = @"---------------------------14737809831466499882746641449";
        NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",boundary];
        [request addValue:contentType forHTTPHeaderField: @"Content-Type"];
        
        NSMutableData *body = [NSMutableData data];
        
        //parameter1
        [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"id\"\r\n\r\n%@", user_Id] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        
        [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"firstname\"\r\n\r\n%@", firstName] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        
        //parameter1
        [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"lastname\"\r\n\r\n%@", lastName] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        
        //parameter1
        [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"current_password\"\r\n\r\n%@", currentPassword] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        
        
        //parameter1
        [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"new_password\"\r\n\r\n%@", newPassword] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];

        NSDate *sendimgename=[NSDate date];
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"ddMMyyyy:hh:mm:ss"];
        
        NSString *stringFromDate = [formatter stringFromDate:sendimgename];
        
        //NSLog(@"%@",stringFromDate);
        [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithString:[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"image_name\"; filename=\"%@.jpeg\"\r\n",stringFromDate]] dataUsingEncoding:NSUTF8StringEncoding]];
        
        [body appendData:[@"Content-Type: image/png\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[NSData dataWithData:imageData]];
        [body appendData:[[NSString stringWithFormat:@"\r\n--%@--\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        NSLog(@"PIC NAME IS %@",stringFromDate);
        [request setHTTPBody:body];
        
        l_theConnection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
        
        [l_theConnection start];
        
        if(l_theConnection)
        {
            NSLog(@"Request sent to get data");
        }
        //[temp_strJson release];
        
        request = nil;
        
        
    }
    else if(![Utilities CheckInternetConnection])
    {
        
    }

}
-(void)Like_Product:(SEL)tempSelector tempTarget:(id)tempTarget :(NSString *)user_Id :(NSString *)product_id
{
    //http://103.15.67.74/pro1/twot/webservice/webservice.php?method=add_likes&user_id=1&product_id=1
    
    
    
    l_appDelegate=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    callBackSelector=tempSelector;
    callBackTarget=tempTarget;
    if([Utilities CheckInternetConnection])//0: internet working
    {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
        NSMutableString *temp_url;
        temp_url=[NSMutableString stringWithFormat:@"%@add_likes&user_id=%@&product_id=%@",WEBURL,user_Id,product_id];
        temp_url=(NSMutableString *)[temp_url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSLog(@"%@",temp_url);
        
        
        
        NSMutableURLRequest *theRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:temp_url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20.0];
        
        
        NSDictionary *headerFieldsDict = [[NSDictionary alloc] initWithObjectsAndKeys:@"application/x-www-form-urlencoded", @"Content-Type", nil];
        
        //[theRequest setHTTPBody:[temp_strJson dataUsingEncoding:NSUTF8StringEncoding]];
        [theRequest setAllHTTPHeaderFields:headerFieldsDict];
        [theRequest setHTTPMethod:@"GET"];
        
        l_theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
        
        [l_theConnection start];
        
        if(l_theConnection)
        {
            NSLog(@"Request sent to get data");
        }
        //[temp_strJson release];
        
    }
    else
    {
        
    }
    
}
-(void)Show_Likes:(SEL)tempSelector tempTarget:(id)tempTarget :(NSString *)product_id :(NSString *)type
{
    
    
    //http://103.15.67.74/pro1/twot/webservice/webservice.php?method=show_likes&product_id=1
    
    
    l_appDelegate=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    callBackSelector=tempSelector;
    callBackTarget=tempTarget;
    if([Utilities CheckInternetConnection])//0: internet working
    {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
        NSMutableString *temp_url;
        temp_url=[NSMutableString stringWithFormat:@"%@show_likes&product_id=%@&type=%@",WEBURL,product_id,type];
        temp_url=(NSMutableString *)[temp_url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSLog(@"%@",temp_url);
        
        
        
        NSMutableURLRequest *theRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:temp_url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20.0];
        
        
        NSDictionary *headerFieldsDict = [[NSDictionary alloc] initWithObjectsAndKeys:@"application/x-www-form-urlencoded", @"Content-Type", nil];
        
        //[theRequest setHTTPBody:[temp_strJson dataUsingEncoding:NSUTF8StringEncoding]];
        [theRequest setAllHTTPHeaderFields:headerFieldsDict];
        [theRequest setHTTPMethod:@"GET"];
        
        l_theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
        
        [l_theConnection start];
        
        if(l_theConnection)
        {
            NSLog(@"Request sent to get data");
        }
        //[temp_strJson release];
        
    }
    else
    {
        
    }
    
}
//this methode for Comment any product
-(void)Add_Comment:(SEL)tempSelector tempTarget:(id)tempTarget :(NSString *)user_Id  :(NSString *)product_id :(NSString *)comment 
{
//http://103.15.67.74/pro1/twot/webservice/webservice.php?method=add_comments&product_id=1&user_id=1&comment=nice%20product



l_appDelegate=(AppDelegate *)[[UIApplication sharedApplication]delegate];

callBackSelector=tempSelector;
callBackTarget=tempTarget;
if([Utilities CheckInternetConnection])//0: internet working
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    NSMutableString *temp_url;
    temp_url=[NSMutableString stringWithFormat:@"%@add_comments&user_id=%@&product_id=%@&comment=%@",WEBURL,user_Id,product_id,comment];
    temp_url=(NSMutableString *)[temp_url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"%@",temp_url);
    
    
    
    NSMutableURLRequest *theRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:temp_url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20.0];
    
    
    NSDictionary *headerFieldsDict = [[NSDictionary alloc] initWithObjectsAndKeys:@"application/x-www-form-urlencoded", @"Content-Type", nil];
    
    //[theRequest setHTTPBody:[temp_strJson dataUsingEncoding:NSUTF8StringEncoding]];
    [theRequest setAllHTTPHeaderFields:headerFieldsDict];
    [theRequest setHTTPMethod:@"GET"];
    
    l_theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
    
    [l_theConnection start];
    
    if(l_theConnection)
    {
        NSLog(@"Request sent to get data");
    }
    //[temp_strJson release];
    
}
else
{
    
}

}

//This methode calling for show all comment of product
-(void)Show_Comment:(SEL)tempSelector tempTarget:(id)tempTarget : (NSString *)product_id :(NSString *)type
{
    //http://103.15.67.74/pro1/twot/webservice/webservice.php?method=show_comments&product_id=1
    
    l_appDelegate=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    callBackSelector=tempSelector;
    callBackTarget=tempTarget;
    if([Utilities CheckInternetConnection])//0: internet working
    {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
        NSMutableString *temp_url;
        temp_url=[NSMutableString stringWithFormat:@"%@show_comments&product_id=%@&type=%@",WEBURL,product_id,type];
        temp_url=(NSMutableString *)[temp_url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSLog(@"%@",temp_url);
        
        
        
        NSMutableURLRequest *theRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:temp_url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20.0];
        
        
        NSDictionary *headerFieldsDict = [[NSDictionary alloc] initWithObjectsAndKeys:@"application/x-www-form-urlencoded", @"Content-Type", nil];
        
        //[theRequest setHTTPBody:[temp_strJson dataUsingEncoding:NSUTF8StringEncoding]];
        [theRequest setAllHTTPHeaderFields:headerFieldsDict];
        [theRequest setHTTPMethod:@"GET"];
        
        l_theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
        
        [l_theConnection start];
        
        if(l_theConnection)
        {
            NSLog(@"Request sent to get data");
        }
        //[temp_strJson release];
        
    }
    else
    {
        
    }
    
}
//this methode for Category of services
-(void)CategoryofService:(SEL)tempSelector tempTarget:(id)tempTarget
{
    //http://103.15.67.74/pro1/twot/webservice/webservice.php?method=select_category_services
    
    
    l_appDelegate=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    callBackSelector=tempSelector;
    callBackTarget=tempTarget;
    if([Utilities CheckInternetConnection])//0: internet working
    {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
        NSMutableString *temp_url;
        temp_url=[NSMutableString stringWithFormat:@"%@select_category_services",WEBURL];
        temp_url=(NSMutableString *)[temp_url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSLog(@"%@",temp_url);
        
        
        
        NSMutableURLRequest *theRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:temp_url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20.0];
        
        
        NSDictionary *headerFieldsDict = [[NSDictionary alloc] initWithObjectsAndKeys:@"application/x-www-form-urlencoded", @"Content-Type", nil];
        
        //[theRequest setHTTPBody:[temp_strJson dataUsingEncoding:NSUTF8StringEncoding]];
        [theRequest setAllHTTPHeaderFields:headerFieldsDict];
        [theRequest setHTTPMethod:@"GET"];
        
        l_theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
        
        [l_theConnection start];
        
        if(l_theConnection)
        {
            NSLog(@"Request sent to get data");
        }
        //[temp_strJson release];
        
    }
    else
    {
        
    }
}

//this methode for Add Services
-(void)Add_Services:(SEL)tempSelector tempTarget:(id)tempTarget : (NSString *)serviceName : (NSString *)description : (NSString *)charges : (NSString *)user_Id  : (NSString *)category_id
{
// http://103.15.67.74/pro1/twot/webservice/webservice.php?method=add_new_service&service_name=driving&description=i%20can%20drive%20for%204%20hours%20in%20eve&charge=40&user_id=1&category_id=1



l_appDelegate=(AppDelegate *)[[UIApplication sharedApplication]delegate];

callBackSelector=tempSelector;
callBackTarget=tempTarget;
if([Utilities CheckInternetConnection])//0: internet working
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    NSMutableString *temp_url;
    temp_url=[NSMutableString stringWithFormat:@"%@add_new_service&service_name=%@&description=%@&charge=%@&user_id=%@&&category_id=%@",WEBURL,serviceName,description,charges ,user_Id,category_id];
    temp_url=(NSMutableString *)[temp_url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"%@",temp_url);
    
    
    
    NSMutableURLRequest *theRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:temp_url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20.0];
    
    
    NSDictionary *headerFieldsDict = [[NSDictionary alloc] initWithObjectsAndKeys:@"application/x-www-form-urlencoded", @"Content-Type", nil];
    
    //[theRequest setHTTPBody:[temp_strJson dataUsingEncoding:NSUTF8StringEncoding]];
    [theRequest setAllHTTPHeaderFields:headerFieldsDict];
    [theRequest setHTTPMethod:@"GET"];
    
    l_theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
    
    [l_theConnection start];
    
    if(l_theConnection)
    {
        NSLog(@"Request sent to get data");
    }
    //[temp_strJson release];
    
}
else
{
    
}

}
//this methode for Category of services
-(void)Show_serivce:(SEL)tempSelector tempTarget:(id)tempTarget
{
    //http://103.15.67.74/pro1/twot/webservice/webservice.php?method=show_service
    
    l_appDelegate=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    callBackSelector=tempSelector;
    callBackTarget=tempTarget;
    if([Utilities CheckInternetConnection])//0: internet working
    {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
        NSMutableString *temp_url;
        temp_url=[NSMutableString stringWithFormat:@"%@show_service",WEBURL];
        temp_url=(NSMutableString *)[temp_url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSLog(@"%@",temp_url);
        
        
        
        NSMutableURLRequest *theRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:temp_url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20.0];
        
        
        NSDictionary *headerFieldsDict = [[NSDictionary alloc] initWithObjectsAndKeys:@"application/x-www-form-urlencoded", @"Content-Type", nil];
        
        //[theRequest setHTTPBody:[temp_strJson dataUsingEncoding:NSUTF8StringEncoding]];
        [theRequest setAllHTTPHeaderFields:headerFieldsDict];
        [theRequest setHTTPMethod:@"GET"];
        
        l_theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
        
        [l_theConnection start];
        
        if(l_theConnection)
        {
            NSLog(@"Request sent to get data");
        }
        //[temp_strJson release];
        
    }
    else
    {
        
    }
}
//this methode for Show Detail of services
-(void)Show_Detail_serivce:(SEL)tempSelector tempTarget:(id)tempTarget : (NSString *)serviceid
{
//http://103.15.67.74/pro1/twot/webservice/webservice.php?method=show_service_details&service_id=1
l_appDelegate=(AppDelegate *)[[UIApplication sharedApplication]delegate];

callBackSelector=tempSelector;
callBackTarget=tempTarget;
if([Utilities CheckInternetConnection])//0: internet working
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    NSMutableString *temp_url;
    temp_url=[NSMutableString stringWithFormat:@"%@show_service_details&service_id=%@",WEBURL,serviceid];
    temp_url=(NSMutableString *)[temp_url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"%@",temp_url);
    
    
    
    NSMutableURLRequest *theRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:temp_url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20.0];
    
    
    NSDictionary *headerFieldsDict = [[NSDictionary alloc] initWithObjectsAndKeys:@"application/x-www-form-urlencoded", @"Content-Type", nil];
    
    //[theRequest setHTTPBody:[temp_strJson dataUsingEncoding:NSUTF8StringEncoding]];
    [theRequest setAllHTTPHeaderFields:headerFieldsDict];
    [theRequest setHTTPMethod:@"GET"];
    
    l_theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
    
    [l_theConnection start];
    
    if(l_theConnection)
    {
        NSLog(@"Request sent to get data");
    }
    //[temp_strJson release];
    
}
else
{
    
}
}
///this methode for Trading
-(void)Trade:(SEL)tempSelector tempTarget:(id)tempTarget : (NSString *)user_id : (NSString *)type
{
//http://103.15.67.74/pro1/twot/webservice/webservice.php?method=user_product_services&user_id=1&type=product

    l_appDelegate=(AppDelegate *)[[UIApplication sharedApplication]delegate];

    callBackSelector=tempSelector;
    callBackTarget=tempTarget;
    if([Utilities CheckInternetConnection])//0: internet working
    {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
        NSMutableString *temp_url;
        temp_url=[NSMutableString stringWithFormat:@"%@user_product_services&user_id=%@&type=%@",WEBURL,user_id,type];
        temp_url=(NSMutableString *)[temp_url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSLog(@"%@",temp_url);
    
    
    
        NSMutableURLRequest *theRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:temp_url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20.0];
    
        
        NSDictionary *headerFieldsDict = [[NSDictionary alloc] initWithObjectsAndKeys:@"application/x-www-form-urlencoded", @"Content-Type", nil];
    
        //[theRequest setHTTPBody:[temp_strJson dataUsingEncoding:NSUTF8StringEncoding]];
        [theRequest setAllHTTPHeaderFields:headerFieldsDict];
        [theRequest setHTTPMethod:@"GET"];
    
        l_theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
    
        [l_theConnection start];
    
        if(l_theConnection)
        {
            NSLog(@"Request sent to get data");
        }
        //[temp_strJson release];
    
    }
    else
    {
    
    }
}
//this methode for Add to Cart
-(void)Add_Order:(SEL)tempSelector tempTarget:(id)tempTarget : (NSString *)product_id : (NSString *)brand_id : (NSString *)category_id : (NSString *)size_id : (NSString *)user_id
{
    //http://103.15.67.74/pro1/twot/webservice/webservice.php?method=add_order&product_id=6&id=1&brand_id=1&user_id=7&category_id=1&size_id=1&payment_method=services&payment_status=pending&order_status=process&payment_date=2015-10-05
    
    l_appDelegate=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    callBackSelector=tempSelector;
    callBackTarget=tempTarget;
    if([Utilities CheckInternetConnection])//0: internet working
    {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
        NSMutableString *temp_url;
        temp_url=[NSMutableString stringWithFormat:@"%@add_order&product_id=%@&brand_id=%@&user_id=%@&category_id=%@&size_id=%@",WEBURL,product_id,brand_id,user_id,category_id,size_id];
        temp_url=(NSMutableString *)[temp_url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSLog(@"%@",temp_url);
        
        
        
        NSMutableURLRequest *theRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:temp_url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20.0];
        
        
        NSDictionary *headerFieldsDict = [[NSDictionary alloc] initWithObjectsAndKeys:@"application/x-www-form-urlencoded", @"Content-Type", nil];
        
        //[theRequest setHTTPBody:[temp_strJson dataUsingEncoding:NSUTF8StringEncoding]];
        [theRequest setAllHTTPHeaderFields:headerFieldsDict];
        [theRequest setHTTPMethod:@"GET"];
        
        l_theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
        
        [l_theConnection start];
        
        if(l_theConnection)
        {
            NSLog(@"Request sent to get data");
        }
        //[temp_strJson release];
        
    }
    else
    {
        
    }
}
//this methode for Order Lis
-(void)Order_Listing:(SEL)tempSelector tempTarget:(id)tempTarget : (NSString *)user_id
{
//http://103.15.67.74/pro1/twot/webservice/webservice.php?method=order_listing&user_id=7
    
    l_appDelegate=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    callBackSelector=tempSelector;
    callBackTarget=tempTarget;
    if([Utilities CheckInternetConnection])//0: internet working
    {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
        NSMutableString *temp_url;
        temp_url=[NSMutableString stringWithFormat:@"%@order_listing&user_id=%@",WEBURL,user_id];
        temp_url=(NSMutableString *)[temp_url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSLog(@"%@",temp_url);
        
        
        
        NSMutableURLRequest *theRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:temp_url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20.0];
        
        
        NSDictionary *headerFieldsDict = [[NSDictionary alloc] initWithObjectsAndKeys:@"application/x-www-form-urlencoded", @"Content-Type", nil];
        
        //[theRequest setHTTPBody:[temp_strJson dataUsingEncoding:NSUTF8StringEncoding]];
        [theRequest setAllHTTPHeaderFields:headerFieldsDict];
        [theRequest setHTTPMethod:@"GET"];
        
        l_theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
        
        [l_theConnection start];
        
        if(l_theConnection)
        {
            NSLog(@"Request sent to get data");
        }
        //[temp_strJson release];
        
    }
    else
    {
        
    }

}
//this methode for Order remove from cart
-(void)Order_Remove:(SEL)tempSelector tempTarget:(id)tempTarget : (NSString *)user_id : (NSString *)product_id
{
//http://103.15.67.74/pro1/twot/webservice/webservice.php?method=order_remove&user_id=7&order_id=2
    l_appDelegate=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    callBackSelector=tempSelector;
    callBackTarget=tempTarget;
    if([Utilities CheckInternetConnection])//0: internet working
    {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
        NSMutableString *temp_url;
        temp_url=[NSMutableString stringWithFormat:@"%@order_remove&user_id=%@&order_id=%@",WEBURL,user_id,product_id];
        temp_url=(NSMutableString *)[temp_url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSLog(@"%@",temp_url);
        
        
        
        NSMutableURLRequest *theRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:temp_url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20.0];
        
        
        NSDictionary *headerFieldsDict = [[NSDictionary alloc] initWithObjectsAndKeys:@"application/x-www-form-urlencoded", @"Content-Type", nil];
        
        //[theRequest setHTTPBody:[temp_strJson dataUsingEncoding:NSUTF8StringEncoding]];
        [theRequest setAllHTTPHeaderFields:headerFieldsDict];
        [theRequest setHTTPMethod:@"GET"];
        
        l_theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
        
        [l_theConnection start];
        
        if(l_theConnection)
        {
            NSLog(@"Request sent to get data");
        }
        //[temp_strJson release];
        
    }
    else
    {
        
    }

}
///this methode for Order Palce
-(void)place_order:(SEL)tempSelector tempTarget:(id)tempTarget : (NSString *)order_id : (NSString *)paymentMethode : (NSString *)payment_status : (NSString *)order_status : (NSString *)fname : (NSString *)lname :(NSString *)phonenumber :(NSString *)street : (NSString *)city : (NSString *)state  : (NSString *)country  :(NSString *)zipcode
//http://103.15.67.74/pro1/twot/webservice/webservice.php?method=place_order&order_id=4&user_id=11&product_id=14&category_id=5&payment_method=pending&payment_statuts=1&order_statuts=1&order_place_fname=ramesh&order_place_lname=patidar&order_place_city=indore&order_place_state=mp&order_place_country=india
{
    l_appDelegate=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    callBackSelector=tempSelector;
    callBackTarget=tempTarget;
    if([Utilities CheckInternetConnection])//0: internet working
    {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
        NSMutableString *temp_url;
        temp_url=[NSMutableString stringWithFormat:@"%@place_order&order_id=%@&payment_method=%@&payment_statuts=%@&order_statuts=%@&order_place_fname=%@&order_place_lname=%@&phonenumer=%@&street=%@&order_place_city=%@&order_place_state=%@&order_place_country=%@&zipcode=%@",WEBURL,order_status,paymentMethode,payment_status,order_status,fname,lname,phonenumber,street,city,state,country,zipcode];
        temp_url=(NSMutableString *)[temp_url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSLog(@"%@",temp_url);
        
        
        
        NSMutableURLRequest *theRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:temp_url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20.0];
        
        
        NSDictionary *headerFieldsDict = [[NSDictionary alloc] initWithObjectsAndKeys:@"application/x-www-form-urlencoded", @"Content-Type", nil];
        
        //[theRequest setHTTPBody:[temp_strJson dataUsingEncoding:NSUTF8StringEncoding]];
        [theRequest setAllHTTPHeaderFields:headerFieldsDict];
        [theRequest setHTTPMethod:@"GET"];
        
        l_theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
        
        [l_theConnection start];
        
        if(l_theConnection)
        {
            NSLog(@"Request sent to get data");
        }
        //[temp_strJson release];
        
    }
    else
    {
        
    }
  
}
//this methode for Order remove from cart
-(void)trade_deal:(SEL)tempSelector tempTarget:(id)tempTarget :(NSString *)user_id :(NSString *)trate_Type :(NSString *)User_Product_id :(NSString *)seller_Product_ID :(NSString *)seller_ID
{
    //http://103.15.67.74/pro1/twot/webservice/webservice.php?method=trade_deal&user_id=7&trad_type=product%20to%20service&user_product_id=2&trade_user_id=11&trade_u_product_id=14
    l_appDelegate=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    callBackSelector=tempSelector;
    callBackTarget=tempTarget;
    if([Utilities CheckInternetConnection])//0: internet working
    {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
        NSMutableString *temp_url;
        if ([trate_Type isEqualToString:@"PWP"]) {
            temp_url=[NSMutableString stringWithFormat:@"%@trade_deal&user_id=%@&user_product_id=%@&trad_type=%@&trade_user_id=%@&trade_u_product_id=%@",WEBURL,user_id,User_Product_id,trate_Type,seller_ID,seller_Product_ID];
        }
        else
            temp_url=[NSMutableString stringWithFormat:@"%@trade_deal&user_id=%@&user_service_id=%@&trad_type=%@&trade_user_id=%@&trade_u_product_id=%@",WEBURL,user_id,User_Product_id,trate_Type,seller_ID,seller_Product_ID];
        
        temp_url=(NSMutableString *)[temp_url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSLog(@"%@",temp_url);
        
        
        
        NSMutableURLRequest *theRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:temp_url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20.0];
        
        
        NSDictionary *headerFieldsDict = [[NSDictionary alloc] initWithObjectsAndKeys:@"application/x-www-form-urlencoded", @"Content-Type", nil];
        
        //[theRequest setHTTPBody:[temp_strJson dataUsingEncoding:NSUTF8StringEncoding]];
        [theRequest setAllHTTPHeaderFields:headerFieldsDict];
        [theRequest setHTTPMethod:@"GET"];
        
        l_theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
        
        [l_theConnection start];
        
        if(l_theConnection)
        {
            NSLog(@"Request sent to get data");
        }
        //[temp_strJson release];
        
    }
    else
    {
        
    }
    
}
//this methode for Service Trade
-(void)Service_trade_deal:(SEL)tempSelector tempTarget:(id)tempTarget : (NSString *)user_id : (NSString *)trate_Type : (NSString *)User_Product_id : (NSString *)seller_Product_ID : (NSString *)seller_ID
{
    //http://103.15.67.74/pro1/twot/webservice/webservice.php?method=trade_deal_service&user_id=7&trad_type=SWP&user_product_id=2&trade_user_id=11&trade_u_service_id=14    l_appDelegate=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    callBackSelector=tempSelector;
    callBackTarget=tempTarget;
    if([Utilities CheckInternetConnection])//0: internet working
    {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
        NSMutableString *temp_url;
        if ([trate_Type isEqualToString:@"SWS"]) {
            temp_url=[NSMutableString stringWithFormat:@"%@trade_deal_service&user_id=%@&user_service_id=%@&trad_type=%@&trade_user_id=%@&trade_u_service_id=%@",WEBURL,user_id,User_Product_id,trate_Type,seller_ID,seller_Product_ID];
        }
        else
            temp_url=[NSMutableString stringWithFormat:@"%@trade_deal_service&user_id=%@&user_product_id=%@&trad_type=%@&trade_user_id=%@&trade_u_service_id=%@",WEBURL,user_id,User_Product_id,trate_Type,seller_ID,seller_Product_ID];
        
        temp_url=(NSMutableString *)[temp_url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSLog(@"%@",temp_url);
        
        
        
        NSMutableURLRequest *theRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:temp_url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20.0];
        
        
        NSDictionary *headerFieldsDict = [[NSDictionary alloc] initWithObjectsAndKeys:@"application/x-www-form-urlencoded", @"Content-Type", nil];
        
        //[theRequest setHTTPBody:[temp_strJson dataUsingEncoding:NSUTF8StringEncoding]];
        [theRequest setAllHTTPHeaderFields:headerFieldsDict];
        [theRequest setHTTPMethod:@"GET"];
        
        l_theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
        
        [l_theConnection start];
        
        if(l_theConnection)
        {
            NSLog(@"Request sent to get data");
        }
        //[temp_strJson release];
        
    }
    else
    {
        
    }
    
}

// This methode for show Notification
-(void)Show_Notification: (SEL) tempSelector tempTarget:(id)tempTarget :(NSString *)user_id
{
    //http://103.15.67.74/pro1/twot/webservice/webservice.php?method=notification&user_id=11
    l_appDelegate=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    callBackSelector=tempSelector;
    callBackTarget=tempTarget;
    if([Utilities CheckInternetConnection])//0: internet working
    {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
        NSMutableString *temp_url;
        temp_url=[NSMutableString stringWithFormat:@"%@notification&user_id=%@",WEBURL,user_id];
        temp_url=(NSMutableString *)[temp_url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSLog(@"%@",temp_url);
        
        
        
        NSMutableURLRequest *theRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:temp_url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20.0];
        
        
        NSDictionary *headerFieldsDict = [[NSDictionary alloc] initWithObjectsAndKeys:@"application/x-www-form-urlencoded", @"Content-Type", nil];
        
        //[theRequest setHTTPBody:[temp_strJson dataUsingEncoding:NSUTF8StringEncoding]];
        [theRequest setAllHTTPHeaderFields:headerFieldsDict];
        [theRequest setHTTPMethod:@"GET"];
        
        l_theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
        
        [l_theConnection start];
        
        if(l_theConnection)
        {
            NSLog(@"Request sent to get data");
        }
        //[temp_strJson release];
        
    }
    else
    {
        
    }

}
// This Mehode for like for services
-(void)service_likes: (SEL) tempSelector tempTarget:(id)tempTarget :(NSString *)user_id :(NSString *)service_id
{
    //http://103.15.67.74/pro1/twot/webservice/webservice.php?method=service_likes&user_id=5&service_id=5
    l_appDelegate=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    callBackSelector=tempSelector;
    callBackTarget=tempTarget;
    if([Utilities CheckInternetConnection])//0: internet working
    {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
        NSMutableString *temp_url;
        temp_url=[NSMutableString stringWithFormat:@"%@service_likes&user_id=%@&service_id=%@",WEBURL,user_id,service_id];
        temp_url=(NSMutableString *)[temp_url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSLog(@"%@",temp_url);
        
        
        
        NSMutableURLRequest *theRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:temp_url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20.0];
        
        
        NSDictionary *headerFieldsDict = [[NSDictionary alloc] initWithObjectsAndKeys:@"application/x-www-form-urlencoded", @"Content-Type", nil];
        
        //[theRequest setHTTPBody:[temp_strJson dataUsingEncoding:NSUTF8StringEncoding]];
        [theRequest setAllHTTPHeaderFields:headerFieldsDict];
        [theRequest setHTTPMethod:@"GET"];
        
        l_theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
        
        [l_theConnection start];
        
        if(l_theConnection)
        {
            NSLog(@"Request sent to get data");
        }
        //[temp_strJson release];
        
    }
    else
    {
        
    }

}
-(void)Add_service_Comment: (SEL) tempSelector tempTarget:(id)tempTarget :(NSString *)user_id :(NSString *)service_id :(NSString *)comment
{
    //http://103.15.67.74/pro1/twot/webservice/webservice.php?method=service_comment&user_id=6&service_id=5&comment=ss
    l_appDelegate=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    callBackSelector=tempSelector;
    callBackTarget=tempTarget;
    if([Utilities CheckInternetConnection])//0: internet working
    {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
        NSMutableString *temp_url;
        temp_url=[NSMutableString stringWithFormat:@"%@service_comment&user_id=%@&service_id=%@&comment=%@",WEBURL,user_id,service_id,comment];
        temp_url=(NSMutableString *)[temp_url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSLog(@"%@",temp_url);
        
        
        
        NSMutableURLRequest *theRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:temp_url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20.0];
        
        
        NSDictionary *headerFieldsDict = [[NSDictionary alloc] initWithObjectsAndKeys:@"application/x-www-form-urlencoded", @"Content-Type", nil];
        
        //[theRequest setHTTPBody:[temp_strJson dataUsingEncoding:NSUTF8StringEncoding]];
        [theRequest setAllHTTPHeaderFields:headerFieldsDict];
        [theRequest setHTTPMethod:@"GET"];
        
        l_theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
        
        [l_theConnection start];
        
        if(l_theConnection)
        {
            NSLog(@"Request sent to get data");
        }
        //[temp_strJson release];
        
    }
    else
    {
        
    }

}
// This methode for accept Exchange request
-(void)Accept_Request: (SEL) tempSelector tempTarget:(id)tempTarget :(NSString *)trade_type :(NSString *)trade_id :(NSString *)status :(NSString *)noti_id
{
    //103.15.67.74/pro1/twot/webservice/webservice.php?method=trade_status&trade_type=PWP&trade_id=32&status=Accept&noti_id=

    l_appDelegate=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    callBackSelector=tempSelector;
    callBackTarget=tempTarget;
    if([Utilities CheckInternetConnection])//0: internet working
    {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
        NSMutableString *temp_url;
        temp_url=[NSMutableString stringWithFormat:@"%@trade_status&trade_type=%@&trade_id=%@&status=%@&noti_id=%@",WEBURL,trade_type,trade_id,status,noti_id];
        temp_url=(NSMutableString *)[temp_url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSLog(@"%@",temp_url);
        
        NSMutableURLRequest *theRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:temp_url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20.0];
        
        
        NSDictionary *headerFieldsDict = [[NSDictionary alloc] initWithObjectsAndKeys:@"application/x-www-form-urlencoded", @"Content-Type", nil];
        
        //[theRequest setHTTPBody:[temp_strJson dataUsingEncoding:NSUTF8StringEncoding]];
        [theRequest setAllHTTPHeaderFields:headerFieldsDict];
        [theRequest setHTTPMethod:@"GET"];
        
        l_theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
        
        [l_theConnection start];
        
        if(l_theConnection)
        {
            NSLog(@"Request sent to get data");
        }
        //[temp_strJson release];
        
    }
    else
    {
        
    }
    
}
// This Methode called for add new category
-(void)Add_Nea_Category: (SEL) tempSelector tempTarget:(id)tempTarget :(NSString *)Cate_Name :(NSString *)Type;
{
    
    l_appDelegate=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    callBackSelector=tempSelector;
    callBackTarget=tempTarget;
    if([Utilities CheckInternetConnection])//0: internet working
    {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
        NSMutableString *temp_url;
        temp_url=[NSMutableString stringWithFormat:@"%@save_category&name=%@&type=%@",WEBURL,Cate_Name,Type];
        temp_url=(NSMutableString *)[temp_url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSLog(@"%@",temp_url);
        
        
        
        NSMutableURLRequest *theRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:temp_url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20.0];
        
        
        NSDictionary *headerFieldsDict = [[NSDictionary alloc] initWithObjectsAndKeys:@"application/x-www-form-urlencoded", @"Content-Type", nil];
        
        //[theRequest setHTTPBody:[temp_strJson dataUsingEncoding:NSUTF8StringEncoding]];
        [theRequest setAllHTTPHeaderFields:headerFieldsDict];
        [theRequest setHTTPMethod:@"GET"];
        
        l_theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
        
        [l_theConnection start];
        
        if(l_theConnection)
        {
            NSLog(@"Request sent to get data");
        }
        //[temp_strJson release];
        
    }
    else
    {
        
    }
}


- (void)makeConnection : (NSString *) post1 url:(NSString *)url1
{
    
    NSLog(@"hello");
    NSString *post = post1;
    NSData *postData = [post dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    NSString *postLength = [NSString stringWithFormat:@"%lu",(unsigned long)[postData length]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]init];
    
    [request setURL:[NSURL URLWithString:url1]];
    
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:postData];
    l_theConnection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    [l_theConnection start];
    
    if(l_theConnection)
    {
        NSLog(@"Request sent to get data");
    }
    //[temp_strJson release];
    
    request = nil;
    
    
}

/*
 This method called to show the alertView
 */
+(void)alertViewMethod: (NSString*) alertString :(int)tag
{
    UIAlertView *al=[[UIAlertView alloc]initWithTitle:@"" message:alertString delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [al show];
    al.tag=tag;
    NSLog(@"%d",tag);
    
}




#pragma mark -
#pragma mark Connection response methods

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    NSHTTPURLResponse* httpResponse = (NSHTTPURLResponse*)response;
    m_intResponseCode = (int)[httpResponse statusCode];
    NSLog(@"%d",m_intResponseCode);
    
    if(m_mutResponseData!=nil)
    {
        
        m_mutResponseData=nil;
    }
    m_mutResponseData=[[NSMutableData alloc]init];
    [m_mutResponseData setLength:0];
    
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [m_mutResponseData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSString *str_response = [[NSString alloc] initWithData:m_mutResponseData encoding:NSUTF8StringEncoding] ;
    
    str_response = [str_response stringByReplacingOccurrencesOfString:@":)" withString:@""];
    ///str_response = [str_response stringByReplacingOccurrencesOfString:@" "  withString:@""];
    str_response = [str_response stringByReplacingOccurrencesOfString:@";)" withString:@""];
    
    if(m_mutResponseData)
        m_mutResponseData = nil;
        
        NSLog(@"connection :-%@",[connection description]);
        
        if (connection)
            [connection cancel];
    
    NSLog(@"%@",str_response);
    
    SBJSON *objJson = [SBJSON new];
    NSDictionary *dict = [objJson objectWithString:str_response];
    
    if (callBackTarget != nil && callBackSelector != nil) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [callBackTarget performSelector:callBackSelector withObject:dict];
        
#pragma clang diagnostic pop
    }
    else {
        NSLog(@"call back API calls called");
    }
    
    //[str_response release],str_response=nil;
    
    if (dict) {
        dict = nil;
    }
    
    objJson=nil;
    
}
@end