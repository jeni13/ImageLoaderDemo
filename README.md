# ImageLoaderDemo

This is demo app using ImageLoaderSDK for image downloading.
Language: Swift 5
Xcode version: 11.3
iOS deployment target: 13.2 
Architecture used: MVP
Third party library used: Alamofire (API call helper)
API provider: unsplash.com

App Description: 
This app uses unsplash.com to get images. As we open app it will make api call to get data from unsplash.com. Once we get the image urls, ImageLoaderSDK is used to get images from urls. Images will be cached in UserDefaults for first time. If image is already cached it will load from cached data.

ImageLoader SDK:
- This SDK is for downloading and caching image from string.

How to use:
    import ImageLoaderSDK
    
    ImageLoaderSDK.instance.getImageWith(imgString) { (data) in
        completion(data)
    }

Future scope for SDK:
- Add Placeholder images 
- Add activity indicator 
- Core data for saving image data
- Different image type support 
- Methods for modification of images 
- Compression of images in background 

Future scope for Demo app:
- More attractive UI with animations 
- Once user scrolls make another api call to fetch next page data
