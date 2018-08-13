require 'rails_helper'
# ============================================================ /
# Product unit testing
# ============================================================ /
describe Product do
  # ------------------------------------------------------------ /
  # Field validations
  # ------------------------------------------------------------ /
  context "Field validations" do
    # name
    it "ensures name presence" do
      product = Product.new(description: "Widget description...", price: 0.50)
      expect(product).not_to be_valid
    end
    # description
    it "ensures description presence" do
      product = Product.new(name: "Widget", price: 0.50)
      expect(product).not_to be_valid
    end
    # price
    it "ensures price presence" do
      product = Product.new(name: "Widget", description: "Widget description...")
      expect(product).not_to be_valid
    end
    # commit
    it "should save successfully" do
      product = Product.new(name: "Widget", description: "Widget description...", price: 0.50)
      expect(product).to be_valid
    end
  end
  # ------------------------------------------------------------ /
  # Verify aggregation of average product rating
  # ------------------------------------------------------------ /
  context "Aggregations" do
    # Create test product satisfying all existing validations :
    let(:product) { Product.create!(name: "Widget", description: "Widget description...", price: 0.50) }
    # Create test user...
    let(:user) { User.create!( email: "user1@mail.app", first_name: "User", last_name: "Persona", password: "abc123" ) }
    # Create product comments...
    before do
      product.comments.create!(rating: 1, user: user, body: "Low")
      product.comments.create!(rating: 3, user: user, body: "Mid")
      product.comments.create!(rating: 5, user: user, body: "High")
    end
    # test of average product rating
    it "returns the average rating of all comments" do
      expect(product.average_rating).to eq(3)
    end
  end
end
