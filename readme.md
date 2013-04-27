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

I don't believe this will currently do anything for static environments.

## License
See license.md file
