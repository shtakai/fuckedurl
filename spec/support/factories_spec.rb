# /spec/support/factories_spec.rb

# If using RSpec 2.x (or if not using Rails), require `spec_helper` instead
require 'rails_helper'

# If using RSpec 2.x, remove `RSpec.`
RSpec.describe "Factory Bot" do
  FactoryBot.factories.map(&:name).each do |factory_name|
    describe "#{factory_name} factory" do

      # # Test each factory
      # it "is valid" do
      #   factory = FactoryBot.build(factory_name)
      #   if factory.respond_to?(:valid?)
      #     # the lambda syntax only works with rspec 2.14 or newer;  for earlier versions, you have to call #valid? before calling the matcher, otherwise the errors will be empty
      #     expect(factory).to be_valid, lambda { factory.errors.full_messages.join("\n") }
      #   end
      # end
      #
      # # Test each trait
      # FactoryBot.factories[factory_name].definition.defined_traits.map(&:name).each do |trait_name|
      #   context "with trait #{trait_name}" do
      #     it "is valid" do
      #       factory = FactoryBot.build(factory_name, trait_name)
      #       if factory.respond_to?(:valid?)
      #         expect(factory).to be_valid, lambda { factory.errors.full_messages.join("\n") }
      #       end
      #     end
      #   end
      # end

    end
  end
end