# Spree Blogs | Shopify Style Blogs For Spree
![CI](https://github.com/MatthewKennedy/spree_blogs/workflows/CI/badge.svg)

Helps Shopify users move to Spree, bringing their existing Blogs, Posts and URL paths with them.


## Features
- Multiple blogs like Shopify
- Multi-Store support
- Draft Mode editing
- Action Text - TRIX rich text editor ready.


## Installation

1. Add the following lines to your Gemfile:

    ```ruby
    gem 'spree_blogs', github: 'matthewkennedy/spree_blogs', branch: 'main'
    ```

2. Install the gems using Bundler

    ```ruby
    bundle install
    ```

3. Copy & run migration.

    ```ruby
    bundle exec rails g spree_blogs:install
    ```

4. Restart your server

  If your server was running, restart it so that it can find the assets properly.


## Configuration

To use Action Text TRIX rich text editor install and set up Action Text via the Rails guides, and then set the following config to true:

```ruby
# in initilizers/spree.rb
config.blogs_use_action_text = true
```

## Usage

1. Set up Author's

Visit **Configurations/Roles** and add a new Role named `blogger`, then assign the new role to any user you wish to appear in the author list.


2. Create A Blog

Click **Blog Posts** from the main menu, and then click **Manage Blogs** in the contextual menu, once you are in the Manage Blogs area click **New Blog** to create your first blog and assign it to one or more of your stores.


3. Create A Post

Navigate to Blog Posts area and click the New **Post butto** to create your first blog post, assign your post to your new Blog and your done.


## Testing

First bundle your dependencies, then run `rake`. `rake` will default to building the dummy app if it does not exist, then it will run specs. The dummy app can be regenerated by using `rake test_app`.

```shell
bundle
bundle exec rake
```

When testing your applications integration with this extension you may use it's factories.
Simply add this require statement to your spec_helper:

```ruby
require 'spree_blogs/factories'
```


## ToDo

- Add page caching
- Write tests
- Set lazyloading images to be more efficient
- Have a good tidy up
- Write more tests


## Contributing

If you'd like to contribute, please take a look at the
[instructions](CONTRIBUTING.md) for installing dependencies and crafting a good
pull request.

Copyright (c) 2020 Matthew Kennedy, released under the New BSD License
