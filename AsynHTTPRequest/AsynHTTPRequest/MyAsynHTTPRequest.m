//
//  MyAsynHTTPRequest.m
//  AsynHTTPRequest
//
//  Created by 紫冬 on 13-7-30.
//  Copyright (c) 2013年 qsji. All rights reserved.
//

#import "MyAsynHTTPRequest.h"

@implementation MyAsynHTTPRequest

//发送一个异步请求
-(void)startAsynRequest
{
    //第一：创建一个NSURL对象
    NSURL *url = [NSURL URLWithString:@"http://www.baidu.com"];
    
    //第二：创建一个request对象
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    
    //第三：由于是异步请求，所以我们需要设置request的代理
    [request setDelegate:self];
    
    //第四：设置相关的属性和数据
    [request setRequestMethod:@"POST"];
    [request addRequestHeader:@"cookie" value:@"cookies"];
    
    /*
     设置cookies，headers，和返回编码
     [request setRequestCookies:nil];
     [request setRequestHeaders:nil];
     [request setResponseEncoding:nil];
     */
    
    //设置相关的属性数据
    /*
     [request setValue:@"JSON" forKey:@"type"];
     [request setValue:@"query" forKey:@"action"];
     */
    
    //设置发送请求时候携带的数据，下面是设置发送数据的相关函数
    /*
    [request setPostBody:nil];
    [request setPostBodyFilePath:nil];
    [request setPostLength:0];
     */
    
    //第五：发送请求
    [request startAsynchronous];  //由于我们发送的是异步请求，所以结果什么时候返回，我们不知道，我们只能在回调函数里获得
    
}

//异步请求的回调函数中的参数request，就包含了已经返回的信息数据

//当开始发出请求的时候，调用
-(void)requestStarted:(ASIHTTPRequest *)request
{
    NSLog(@"requestStarted:(ASIHTTPRequest *)request");
}

//收到一个http的head以后，被调用
-(void)request:(ASIHTTPRequest *)request didReceiveResponseHeaders:(NSDictionary *)responseHeaders
{
    NSLog(@"request:(ASIHTTPRequest *)request didReceiveResponseHeaders:(NSDictionary *)responseHeaders");
}

//接收到数据以后，被调用
-(void)request:(ASIHTTPRequest *)request didReceiveData:(NSData *)data
{
    NSLog(@"request:(ASIHTTPRequest *)request didReceiveData:(NSData *)data");
    //我们请求获取的数据，可能是字符串，也可能是xml，也可能是json，这取决于我们所
    //请求的服务器返回的内容，比如上面的是http://www.baidu.com,那么返回的就是xml
    
    
    //将返回的data转化为nsstring
    NSString *mstr = [[NSString alloc] initWithData:data encoding:kCFStringEncodingGB_18030_2000];
    NSLog(@"mstr is: %@", mstr);
    /*     
     
     有时候，发现将data转化后String是Null，有可能是字符编码不兼容，于是去打印了下请求返回的一些参数，显示的是GB2312，所以我们就需要要用GB2312或者是兼容GB2312的字符编码
     NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
     NSString *mystr = [[NSString alloc] initWithData:data encoding:enc];
     
     也可以获取data以后，解序列化
     如果请求的数据是字典的话，那么解序列化的结果就是字典：
     
     NSDictionary *resDict = [NSJSONSerialization JSONObjectWithData:data
     
     options:NSJSONReadingAllowFragments error:nil];
     */
    
    //然后我们再解析xml文件
    //因为上面我们请求的是百度首页，所以我们获取的将会是xml的字符串输出形式
}

//当连接将要跳转到其他的url时候，被调用
-(void)request:(ASIHTTPRequest *)request willRedirectToURL:(NSURL *)newURL
{
    NSLog(@"request:(ASIHTTPRequest *)request willRedirectToURL:(NSURL *)newURL");
}

//请求失败时候调用
-(void)requestFailed:(ASIHTTPRequest *)request
{
    NSLog(@"requestFailed:(ASIHTTPRequest *)request");
}

//请求结束以后调用
-(void)requestFinished:(ASIHTTPRequest *)request
{
    NSLog(@"requestFinished:(ASIHTTPRequest *)request");
    //第六步：接收数据
    NSString *mstr = [request responseString];
    /*
     或者是先获取返回的data，然后再将data转化为nsstring
     NSData *data = [request responseData];
     NSString *mstr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
     
     有时候，发现将data转化后String是Null，有可能是字符编码不兼容，于是去打印了下请求返回的一些参数，显示的是GB2312，所以我们就需要要用GB2312或者是兼容GB2312的字符编码
     NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
     NSString *mystr = [[NSString alloc] initWithData:_data encoding:enc];
     
     也可以获取data以后，解序列化
     如果请求的数据是字典的话，那么解序列化的结果就是字典：
     NSData *data  = [request responseData];
     
     NSDictionary *resDict = [NSJSONSerialization JSONObjectWithData:data
     
     options:NSJSONReadingAllowFragments error:nil];
     */
    NSLog(@"mstr is: %@", mstr);
    
    //然后我们再解析xml文件
    //因为上面我们请求的是百度首页，所以我们获取的将会是xml的字符串输出形式
}

//当重新请求时候
-(void)requestRedirected:(ASIHTTPRequest *)request
{
    NSLog(@"requestRedirected:(ASIHTTPRequest *)request");
}



@end
