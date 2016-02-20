//
//  WebserviceViewController.h
//  Minifm
//
//  Created by Samosys on 16/09/15.
//  Copyright (c) 2015 Samosys. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WebserviceViewController : NSObject{
    
    
    NSURLConnection *l_theConnection;
    NSMutableData *m_mutResponseData;
    int m_intResponseCode;
    
    id              callBackTarget;
    SEL				callBackSelector;
    
}
/*
 This method called to Registration*/
-(void)Registration:(SEL)tempSelector tempTarget:(id)tempTarget  : (NSString *)email : (NSString *)password : (NSString *)username : (NSString *)gender  : (NSString *)dob : (NSString *)deviceid :(NSData *)imageData ;
//http://103.15.67.74/pro1/dressconnect/webservice/dressconnect_webservice.php?method=registration&email=irshad123@gmail.com&password=1234&username=irshad&name=Irshadkhan&gender=male&dob=01-01-01&deviceid=11111111

/*
 This method called to Registration*/
-(void)Login:(SEL)tempSelector tempTarget:(id)tempTarget : (NSString *)email : (NSString *)password :(NSString *)deviceid;
//http://103.15.67.74/pro1/dressconnect/webservice/dressconnect_webservice.php?method=login&email=kalyan1@gmail.com&password=1234
//
//This Method Called to create event
-(void)InsertEvent:(SEL)tempSelector tempTarget:(id)tempTarget :(NSString *)user_id :(NSString *)title :(NSString *)location :(NSString *)dressCode;
     //http://103.15.67.74/pro1/dressconnect/webservice/dressconnect_webservice.php?method=insert_event&userid=1&title=abc&location=aaaa&dresscode=any/*

// this method Called to  get event detail & userid*/
-(void)GetEventDetail:(SEL)tempSelector tempTarget:(id)tempTarget : (NSString *)userID;
     //http://103.15.67.74/pro1/dressconnect/webservice/dressconnect_webservice.php?method=get_event_detail&userid=1
 //This method called to add_new_product*/
//

-(void)CheckEmail:(SEL)tempSelector tempTarget:(id)tempTarget : (NSString *)email ;
//http://103.15.67.74/pro1/dressconnect/webservice/dressconnect_webservice.php?method=check_email&email=irshad.khan@samosys.com

//http://103.15.67.74/pro1/twot/webservice/webservice.php?method=add_new_product&product_name=test product&description=test desc&price=12&user_id=1&category_id=1&brand_id=1&size_id=1&image_name=test.jpg

/*
 This method called to Forget Password*/
//
-(void)ForgetPassword:(SEL)tempSelector tempTarget:(id)tempTarget:(NSString*)Email ;
//http://103.15.67.74/pro1/dressconnect/webservice/dressconnect_webservice.php?method=forgot_password&email=irshad.khan@samosys.com
/*
 This method called to Brand*/
//
-(void)Brand:(SEL)tempSelector tempTarget:(id)tempTarget ;
//http://103.15.67.74/pro1/twot/webservice/webservice.php?method=select_brand
/*
 This method called to Size*/
//
-(void)Size:(SEL)tempSelector tempTarget:(id)tempTarget ;
//http://103.15.67.74/pro1/twot/webservice/webservice.php?method=select_size

//This Method called for Product Listing
-(void)ProductList:(SEL)tempSelector tempTarget:(id)tempTarget :(NSString *)userId ;
//http://103.15.67.74/pro1/twot/webservice/webservice.php?method=show_product_listing

//This Method called for Show Product Detail by Product ID
-(void)Product_Detail_id:(SEL)tempSelector tempTarget:(id)tempTarget :(NSString *)product_id ;
//http://103.15.67.74/pro1/twot/webservice/webservice.php?method=show_product_listing

//this methode for product list by id
-(void)Product_List_By_UserID:(SEL)tempSelector tempTarget:(id)tempTarget : (NSString *)user_Id ;
//http://103.15.67.74/pro1/twot/webservice/webservice.php?method=product_list_by_id&id=4

//this methode for Profile of user
-(void)Profile_By_User_Id:(SEL)tempSelector tempTarget:(id)tempTarget : (NSString *)user_Id ;
//http://103.15.67.74/pro1/twot/webservice/webservice.php?method=profile&id=4

//this methode for Update User Profile
-(void)Update_User_Profile:(SEL)tempSelector tempTarget:(id)tempTarget : (NSString *)user_Id : (NSString *)firstName : (NSString *)lastName : (NSString *)currentPassword : (NSString *)newPassword :(NSData *)imageData ;
//http://103.15.67.74/pro1/twot/webservice/webservice.php?method=profile&id=4
//this mwthode for like product
-(void)Like_Product:(SEL)tempSelector tempTarget:(id)tempTarget : (NSString *)user_Id  : (NSString *)product_id ;
//http://103.15.67.74/pro1/twot/webservice/webservice.php?method=add_likes&user_id=1&product_id=1

//This methode calling for show all like of product
-(void)Show_Likes:(SEL)tempSelector tempTarget:(id)tempTarget : (NSString *)product_id :(NSString *)type ;
//http://103.15.67.74/pro1/twot/webservice/webservice.php?method=show_likes&product_id=1

//This methode calling for show all comment of product
-(void)Show_Comment:(SEL)tempSelector tempTarget:(id)tempTarget : (NSString *)product_id :(NSString *)type ;
//http://103.15.67.74/pro1/twot/webservice/webservice.php?method=show_comments&product_id=1&type=service


//this methode for Comment any product
-(void)Add_Comment:(SEL)tempSelector tempTarget:(id)tempTarget : (NSString *)user_Id  : (NSString *)product_id : (NSString *)comment ;
//http://103.15.67.74/pro1/twot/webservice/webservice.php?method=add_comments&product_id=1&user_id=1&comment=nice%20product

//this methode for Category of services
-(void)CategoryofService:(SEL)tempSelector tempTarget:(id)tempTarget ;
//http://103.15.67.74/pro1/twot/webservice/webservice.php?method=select_category_services

//this methode for Add Services 
-(void)Add_Services:(SEL)tempSelector tempTarget:(id)tempTarget : (NSString *)serviceName : (NSString *)description : (NSString *)charges : (NSString *)user_Id  : (NSString *)category_id  ;
// http://103.15.67.74/pro1/twot/webservice/webservice.php?method=add_new_service&service_name=driving&description=i%20can%20drive%20for%204%20hours%20in%20eve&charge=40&user_id=1&category_id=1

//this methode for Show all services
-(void)Show_serivce:(SEL)tempSelector tempTarget:(id)tempTarget  ;
//http://103.15.67.74/pro1/twot/webservice/webservice.php?method=show_service

//this methode for Show Detail of services
-(void)Show_Detail_serivce:(SEL)tempSelector tempTarget:(id)tempTarget : (NSString *)serviceid;
//http://103.15.67.74/pro1/twot/webservice/webservice.php?method=show_service_details&service_id=1

//this methode for Trading
-(void)Trade:(SEL)tempSelector tempTarget:(id)tempTarget : (NSString *)user_id : (NSString *)type;
//http://103.15.67.74/pro1/twot/webservice/webservice.php?method=user_product_services&user_id=1&type=product

//this methode for Trading
-(void)Add_Order:(SEL)tempSelector tempTarget:(id)tempTarget : (NSString *)product_id : (NSString *)brand_id : (NSString *)category_id : (NSString *)size_id : (NSString *)user_id;
//http://103.15.67.74/pro1/twot/webservice/webservice.php?method=add_order&product_id=6&id=1&brand_id=1&user_id=7&category_id=1&size_id=1&payment_method=services&payment_status=pending&order_status=process&payment_date=2015-10-05

//this methode for Order Lis
-(void)Order_Listing:(SEL)tempSelector tempTarget:(id)tempTarget : (NSString *)user_id ;
//http://103.15.67.74/pro1/twot/webservice/webservice.php?method=order_listing&user_id=7

//this methode for Order remove from cart
-(void)Order_Remove:(SEL)tempSelector tempTarget:(id)tempTarget : (NSString *)user_id : (NSString *)product_id ;
//http://103.15.67.74/pro1/twot/webservice/webservice.php?method=order_remove&user_id=7&product_id=2

//this methode for Order remove from cart
-(void)place_order:(SEL)tempSelector tempTarget:(id)tempTarget : (NSString *)order_id : (NSString *)paymentMethode : (NSString *)payment_status : (NSString *)order_status : (NSString *)fname : (NSString *)lname :(NSString *)phonenumber :(NSString *)street : (NSString *)city : (NSString *)state  : (NSString *)country  :(NSString *)zipcode ;
//http://103.15.67.74/pro1/twot/webservice/webservice.php?method=place_order&order_id=4&user_id=11&product_id=14&category_id=5&payment_method=pending&payment_statuts=1&order_statuts=1&order_place_fname=ramesh&order_place_lname=patidar&order_place_city=indore&order_place_state=mp&order_place_country=india

//this methode forTRADE
-(void)trade_deal:(SEL)tempSelector tempTarget:(id)tempTarget : (NSString *)user_id : (NSString *)trate_Type : (NSString *)User_Product_id : (NSString *)seller_Product_ID : (NSString *)seller_ID ;
//http://103.15.67.74/pro1/twot/webservice/webservice.php?method=trade_deal&user_id=7&trad_type=product%20to%20service&user_product_id=2&trade_user_id=11&trade_u_product_id=14

//this methode forTRADE
-(void)Service_trade_deal:(SEL)tempSelector tempTarget:(id)tempTarget : (NSString *)user_id : (NSString *)trate_Type : (NSString *)User_Product_id : (NSString *)seller_Product_ID : (NSString *)seller_ID ;
//http://103.15.67.74/pro1/twot/webservice/webservice.php?method=trade_deal_service&user_id=7&trad_type=SWP&user_product_id=2&trade_user_id=11&trade_u_service_id=14

// This methode for show Notification
-(void)Show_Notification: (SEL) tempSelector tempTarget:(id)tempTarget :(NSString *)user_id;
//http://103.15.67.74/pro1/twot/webservice/webservice.php?method=notification&user_id=11

// This Mehode for like for services
-(void)service_likes: (SEL) tempSelector tempTarget:(id)tempTarget :(NSString *)user_id :(NSString *)service_id;
//http://103.15.67.74/pro1/twot/webservice/webservice.php?method=service_likes&user_id=5&service_id=5

// This Mehode for comment for services
-(void)Add_service_Comment: (SEL) tempSelector tempTarget:(id)tempTarget :(NSString *)user_id :(NSString *)service_id :(NSString *)comment;
//http://103.15.67.74/pro1/twot/webservice/webservice.php?method=service_comment&user_id=6&service_id=5&comment=ss


// This methode for accept Exchange request
-(void)Accept_Request: (SEL) tempSelector tempTarget:(id)tempTarget :(NSString *)trade_type :(NSString *)trade_id :(NSString *)status :(NSString *)noti_id ;
//103.15.67.74/pro1/twot/webservice/webservice.php?method=trade_status&trade_type=PWP&trade_id=32&status=Accept&noti_id=

// This Methode called for add new category
-(void)Add_Nea_Category: (SEL) tempSelector tempTarget:(id)tempTarget :(NSString *)Cate_Name :(NSString *)Type;
@end
