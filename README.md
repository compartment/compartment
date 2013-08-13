<!--
# Compartment CMS

## Installation

### Option 1: As a standalone application (recommended)

1. Install the Compartment CMS gem: `gem install compartment`
2. Create a new application: `compartment new my_site`
3. Change into the new directory and start the application:
    cd my_site
    bundle exec rackup
4. Open your browser to `localhost:3000`
5. Complete the setup wizard to create your first site.

### Option 2: As a Rails Engine (for existing applications)

1. Add `gem "compartment"` to your Gemfile and `bundle`
2. Mount the engine in your routes.rb: `mount Compartment::Engine => "/"`
3. Install the migrations: `bundle exec rake compartment:install:migrations`
4. Run the migrations: `bundle exec rake db:migrate`
4. Start the `rails server` and open the application in your browser.
5. Complete the setup wizard to create your first site.
-->