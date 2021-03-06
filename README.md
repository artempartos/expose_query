[![Code Climate](https://codeclimate.com/github/chubarovNick/expose_query.png)](https://codeclimate.com/github/chubarovNick/expose_query)
[![Build Status](https://travis-ci.org/chubarovNick/expose_query.svg?branch=master)](https://travis-ci.org/chubarovNick/expose_query)
[![Dependency Status](https://gemnasium.com/chubarovNick/expose_query.svg)](https://gemnasium.com/chubarovNick/expose_query)
# ExposeQuery

Add query benefit for exposed decent_exsposure values
## Installation

Add this line to your application's Gemfile:

    gem 'expose_query'

And then execute:

    $ bundle


## Usage

Include module to controller:

```
  class PhotosController  < ApplicationController
    include ExposeQuery::ControllerDsl
    expose(:photos)

    expose_query PhotoQuery
  end
```
And define query class:
```
  class PhotoQuery < ExposeQuery::BaseQuery

    def apply source_scope
      source_scope.where(image_processing: [nil, false])
    end
  end
```

## Advanced parameters

Allow define query objects for specific expose:

```
  class PhotosController  < ApplicationController
    include ExposeQuery::ControllerDsl
    expose(:photos)
    expose(:recent_photos, model: :photo)

    expose_query PhotoQuery, PaginationQuery, only: :photos
    expose_query RecentPhotosQuery, only: :recent_photos

  end
```


## Contributing

1. Fork it ( https://github.com/[my-github-username]/expose_query/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
