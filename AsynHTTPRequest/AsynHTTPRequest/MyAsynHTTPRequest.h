//
//  MyAsynHTTPRequest.h
//  AsynHTTPRequest
//
//  Created by 紫冬 on 13-7-30.
//  Copyright (c) 2013年 qsji. All rights reserved.
//

/*
 网络异步请求的一般步骤：
 实现协议
 第一：创建一个NSURL对象，也即是请求网址，网址必须加http://
 第二：创建讲一个ASIHTTPRequest对象，并设置url
 第三：添加头信息，设置cookies，缓存等，比如addRequestHeader:，setCachePolicy:
 第四：设置get，post,put方法  requestMethod：
 第五：设置要提交的时候所带的数据 setValue:，setPostBody:，setValue一般用来设置属性，setPostBody：用来设置数据域，当然也可以将属性和数据打包在一起，作为要发送（post）的body
 第五：调用startSynchronous方法，开始请求数据
 第六：返回头信息，比如responseHeaders：返回的response的Headers
 第七：判断是否返回错误[request error];
 第八：根据是否返回错误，看是否返回数据responseString,responseData这是一个方法，获得返回的结果
 */

#import <Foundation/Foundation.h>
#import "ASIHTTPRequest.h"

@interface MyAsynHTTPRequest : NSObject<ASIHTTPRequestDelegate>

//发送异步请求
-(void)startAsynRequest;

@end
