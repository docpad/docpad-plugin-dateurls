# Date URLs Plugin for DocPad
Adds support for date based URLs to [DocPad](https://docpad.org)

## Install
```
npm install --save docpad-plugin-dateurls
```

## Usage
The purpose of this plugin is to enable date based url paths based on the a date metadata field within a post.

Add a date yaml header to posts you would like to have a date based url

For /documents/posts/2012-10-21-my-blog-post.html.md
```
---
name: my blog post
date: 2012-10-21
---
```

results:
```
http://yoursite.com/2012/10/21/my-blog-post.html
```

### Document Paths
By default dateurls will pickup documents within /documents/posts if you would like to process a different folder under documents add:

``` coffee
  plugins:
    dateurls:
      documentPath: 'yourpath'
```

### Clean Urls 
By default the files paths will have the file extension:
```
http://yoursite.com/2012/10/21/my-blog-post.html
```

If you would like to have clean urls such as:
```
http://yoursite.com/2012/10/21/my-blog-post
```
Pass true to the cleanurl configuration property

``` coffee
  plugins:
    dateurls:
      cleanurl: true
```


### Trailing Slashes
When using clean urls a route will be added with the forms
```
http://yoursite.com/2012/10/21/my-blog-post
http://yoursite.com/2012/10/21/my-blog-post/
```

If you wish to have links to the post use a trailing slash pass true to the trailingSlashes configuration property
``` coffee
  plugins:
    dateurls:
      trailingSlashes: true
```

### Collection Name
If you would like dateurls to process documents in a collection you defined yourself (instead of documents in a specific document path), you can tell the plugin which collection to use explicitly:

``` coffee
  plugins:
    dateurls:
      collectionName: 'myCollection'
```

## License
See license.md file
