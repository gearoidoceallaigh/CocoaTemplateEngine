CCTemplate
----------
A lightweight Template Engine for Objective-C (with ARC feature required).

[![Build Status](https://travis-ci.org/xhan/CocoaTemplateEngine.png?branch=master)](https://travis-ci.org/xhan/CocoaTemplateEngine)

Template ->
```
hello {{ name }},
you have just won {{ value}} !
please visit {{ site }} immediately.
```

with given hash ->
``` json
{
   "name":  "steve",
   "value": "$100000",
   "site":  "www.cheatyouforever.com"
}
```

will produce ->
```
hello steve,
you have just won $100000 !
please visit www.cheatyouforever.com immediately.
```

That's all. No other features are supported.

### Acts with [CocoaPod](http://cocoapods.org)   
Add `pod 'CCTemplate'` on your Podfile to get CCTemplate up-to-date.