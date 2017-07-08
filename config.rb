# Activate and configure extensions
# https://middlemanapp.com/advanced/configuration/#configuring-extensions

# Layouts
# https://middlemanapp.com/basics/layouts/


# Per-page layout changes
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false


# With alternative layout
# page '/path/to/file.html', layout: 'other_layout'


# Proxy pages
# https://middlemanapp.com/advanced/dynamic-pages/


# proxy(
#   '/this-page-has-no-template.html',
#   '/template-file.html',
#   locals: {
#     which_fake_page: 'Rendering a fake page with a local variable'
#   },
# )


# Helpers
# Methods defined in the helpers block are available in templates
# https://middlemanapp.com/basics/helper-methods/

# helpers do
#   def some_helper
#     'Helping'
#   end
# end


# External Asset Pipeline
activate :external_pipeline,
  name: :webpack,
  command: build? ? "npm run build" : "npm run start",
  source: ".tmp/dist",
  latency: 1

set :css_dir, 'assets/css'
set :js_dir, 'assets/js'
set :images_dir, 'images'

# Build-specific configuration
# https://middlemanapp.com/advanced/configuration/#environment-specific-settings
configure :development do
  activate :livereload, no_swf: true, livereload_css_target: 'assets/css/app.css'
end
# configure :build do
#   activate :minify_css
#   activate :minify_javascript
# end


# CDN configuration
# configure :build do
#  activate :minify_css
#  activate :minify_javascript

# Append a hash to asset urls (make sure to use the url helpers)
#  activate :asset_hash

#  activate :asset_host, :host => '//YOURDOMAIN.cloudfront.net'
# end
