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
activate :blog do |blog|
  # This will add a prefix to all links, template references and source paths
  # blog.prefix = "blog"

  # blog.permalink = "{year}/{month}/{day}/{title}.html"
  # Matcher for blog source files
   blog.sources = "articles/article{article_num}-section{section_num}.html"
  # blog.taglink = "tags/{tag}.html"
  # blog.layout = "layout"
  # blog.summary_separator = /(READMORE)/
  # blog.summary_length = 250
  # blog.year_link = "{year}.html"
  # blog.month_link = "{year}/{month}.html"
  # blog.day_link = "{year}/{month}/{day}.html"
  # blog.default_extension = ".markdown"

  blog.tag_template = "tag.html"
  blog.calendar_template = "calendar.html"

  # Enable pagination
  # blog.paginate = true
  # blog.per_page = 10
  # blog.page_link = "page/{num}"
end

page "/feed.xml", layout: false

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


# Google Analytics configuration
activate :google_analytics do |ga|
  ga.tracking_id = 'UA-XXXXXXX-X' # Replace with your property ID.
  # Removing the last octet of the IP address (default = false)
  # ga.anonymize_ip = false

  # Tracking across a domain and its subdomains (default = nil)
  # ga.domain_name = 'example.com'

  # Tracking across multiple domains and subdomains (default = false)
  # ga.allow_linker = false

  # Enhanced Link Attribution (default = false)
  # ga.enhanced_link_attribution = false

  # Log detail messages to the console (default = false)
  # ga.debug = false

  # Trace debugging will output more verbose information to the console (default = false)
  # ga.debug_trace = false

  # Disable extension (default = false)
  # ga.disable = true

  # Testing your implementation without sending hits (default = true) in development
  # ga.test = true

  # Compress the JavaScript code (default = false)
  # ga.minify = false

  # Output style - :html includes <script> tag (default = :html)
  # ga.output = :js
end