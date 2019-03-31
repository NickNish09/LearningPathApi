# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )


Rails.application.config.assets.precompile += %w(img/fav.png)
Rails.application.config.assets.precompile += %w(css/linearicons.css)
Rails.application.config.assets.precompile += %w(css/font-awesome.min.css)
Rails.application.config.assets.precompile += %w(css/bootstrap.css)
Rails.application.config.assets.precompile += %w(css/owl.carousel.css)
Rails.application.config.assets.precompile += %w(css/main.css)
Rails.application.config.assets.precompile += %w(js/vendor/jquery-2.2.4.min.js)
Rails.application.config.assets.precompile += %w(js/vendor/bootstrap.min.js)
Rails.application.config.assets.precompile += %w(js/jquery.ajaxchimp.min.js)
Rails.application.config.assets.precompile += %w(js/parallax.min.js)
Rails.application.config.assets.precompile += %w(js/owl.carousel.min.js)
Rails.application.config.assets.precompile += %w(js/jquery.magnific-popup.min.js)
Rails.application.config.assets.precompile += %w(js/jquery.sticky.js)
Rails.application.config.assets.precompile += %w(js/main.js)
Rails.application.config.assets.precompile += %w(*.jpg *.png)
