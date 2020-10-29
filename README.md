# Spree Blogs | Shopify Style Blogs For Spree

Helps Shopify users move to Spree, bringing their existing Blogs, Posts and URL paths with them.

This Spree Extension requires the acts-as-taggable-on gem to provide the same tagging (catagories) support as you find in Shopify blogs.

## Installation

1. Add the following lines to your Gemfile:

    ```ruby
    gem 'acts-as-taggable-on', '~> 6.0'
    gem 'spree_blogs', github: 'matthewkennedy/spree_blogs'
    ```

2. Install the gems using Bundler

    ```ruby
    bundle install
    ```

3. Copy & run migrations: (only run the acts_as_taggable_on install command if you are not already using acts-as-taggable-on in your project).

    ```ruby
    bundle exec rails acts_as_taggable_on_engine:install:migrations
    bundle exec rails g spree_blogs:install
    ```

4. Restart your server

  If your server was running, restart it so that it can find the assets properly.


5. Set up Authors

Visit **Configurations/Roles** and add a new roll named `blogger`, then assign the new role to any user you wish to appear in the authors list when creating your blog posts.


6. Set up A Blog

Click **Blog Posts** from the main menu, and then click **Manage Blogs**, to creat your first blog.


7. Create A Blog Posts

Navigate to Blog Posts and create your posts as needed.

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

- Add ability for admin to view yet unpublished pages
- Add page caching
- Write tests
- Move some logic from views to helpers.
- Have a good tidy up.

## Contributing

If you'd like to contribute, please take a look at the
[instructions](CONTRIBUTING.md) for installing dependencies and crafting a good
pull request.

Copyright (c) 2020 Matthew Kennedy, released under the New BSD License
