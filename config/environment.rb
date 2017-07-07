# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

require 'will_paginate'
# will_paginate custom label
WillPaginate::ViewHelpers.pagination_options[:previous_label] = '<<'
WillPaginate::ViewHelpers.pagination_options[:next_label] = '>>'
