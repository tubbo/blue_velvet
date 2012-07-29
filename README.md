[![Heineken? Fuck that shit!](https://sphotos-a.xx.fbcdn.net/hphotos-prn1/552344_137798096358473_725002513_n.jpg)](http://www.youtube.com/watch?v=snhiofL2Rh4)

# BlueVelvet

BlueVelvet is a content management system that uses the Facebook
platform as the data store. It allows you to map route actions to
Facebook API calls and display the results with partials in your other
ages. You can even subclass the controller and create your own actions,
using one or more of your Facebook page's plethora of properties.

[![Build Status](https://secure.travis-ci.org/tubbo/blue_velvet.png?branch=master)](http://travis-ci.org/tubbo/blue_velvet)

## In The Wild

BlueVelvet can be observed "in the wild" on <http://thewonderbars.com>.
I've also [open-sourced the
codebase](https://github.com/tubbo/thewonderbars.com/tree/develop) to
give an example as to how this gem could be/is being used.

**NOTE:** At this time, I haven't deployed the site using blue_velvet to
the server for <http://thewonderbars.com>. I've been very busy with work
and setting up gigs for the band, so I haven't gotten around to getting
all that up and running. In keeping with my philosophy of reserving the
'master' branch for the working, released version of the code, the
source tree using this gem is available in the 'develop' branch. Soon, I
will merge this branch into master and BlueVelvet will deploy on
<http://thewonderbars.com>. Until then, check out the source and if you
don't believe me, download the app and run it yourself!

## Usage

Add the gem to your Gemfile

    gem 'blue_velvet'

Then rebundle

    $ bundle install

Generate the Facebook configuration YAML file and edit it with your
Facebook App details. If you don't know how to do that, look below
in the "Configuration" section.

    $ rails generate facebook:config

It should look something like this:

```yaml
# This is your Facebook configuration file. Put your Facebook app info in this file
# and it will be read by the Rails application.

development:
  app_id:
  secret_key:
  page_id:

test:
  app_id:
  secret_key:
  page_id:

production:
  app_id:
  secret_key:
  page_id:
```

And finally, add the query to your `config/routes.rb`:

    get "/about" => "facebook/page#description"

If you start up your Rails server, you can now browse to
`http://localhost:3000/about` and expect to see the content in your
Facebook page's description!

For more information on the many properties available to you, check out
the API documentation.

## Configuration

All configuration is taken care of in a file called
`config/facebook.yml`. This is also the file used by 
[Koala](https://github.com/arsduo/koala), the gem that is actually 
communicating with the Facebook Graph API, so if you're used
to working with that configuration this should be easy for you.

In order to use blue_velvet, you must create a Facebook app on
<https://developers.facebook.com>. Once you do that, obtain the
following information from the new app page on the control panel:

- App ID/API Key
- App Secret
- Your Facebook page ID, which can be obtained by visiting your Facebook page and observing the number at the very end of the address bar, right after the "/".

Add that information into your YAML config, and you can begin using
blue_velvet in your application.

## Background

This project is the result of the work I've done on my band's website,
[TheWonderBars.com](http://thewonderbars.com). I didn't want to have to
maintain two versions of press data, and since we had an active Facebook
page that was chock full of content well before the site was designed and 
deployed, I considered using Facebook as our main "database", rather
than a locally-maintained SQL database of some kind. At this point in
time, TheWonderBars.com does not require a database in order to
function.

## Contributing

All contributions will be examined and considered. Anyone can feel free
to make their voice known by contributing to the project. Click the
"Fork" button on the top of the screen (register a GitHub account if you
don't already have one), create a feature branch, and submit the changes
back to me in the form of a pull request.

You must write tests for your feature or bug fix and they must pass.

## License

Copyright 2012 Tom Scott

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

## Extended Documentation

- [Facebook API documentation](https://developers.facebook.com)
- [Facebook Apps Control Panel](https://developers.facebook.com/apps)
- [RDoc code documentation](http://rdoc.info/github/tubbo/blue_velvet/master/frames)
- [RubyGems page](https://rubygems.org/gems/blue_velvet)
