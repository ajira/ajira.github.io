###
# Compass
###

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (https://middlemanapp.com/advanced/dynamic_pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'
set :bind_address, '0.0.0.0'

activate :autoprefixer

# Build-specific configuration
configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :minify_html
  activate :asset_hash
  activate :gzip
end

# Reload the browser automatically whenever files change
configure :development do
  # activate :livereload, host: '0.0.0.0', no_swf: true
end

helpers do
  def svg_data(path)
    data = File.read(File.join('source', 'images', path))
    data.gsub(/<svg[^>]*>/, '').gsub(/<\/svg>/, '').gsub(/<\?xml[^>]*>/, '')
  end

  def javascript_embed_tag(path)
    data = File.read(File.join('source', 'javascripts', path))
    "<script type='text/javascript'>\n#{data}\n</script>"
  end
end

data.store :upcoming_events, data.events.select{ |e| e.date > DateTime.now-10 }.sort_by(&:date)
data.store :latest_posts, data.blog.sort_by{ |p| -p.date.to_i }[0..5]
data.store :publications, data.publications
data.store :random_team, Hash[data.team.to_a.shuffle]

set :url_root, 'http://www.ajira.tech'
activate :search_engine_sitemap, default_priority: 0.5, default_change_frequency: "daily"
