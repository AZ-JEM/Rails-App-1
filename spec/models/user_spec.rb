require 'rails_helper'

RSpec.describe User, type: :model do
  context "Field validations" do
    # email
    it "ensures presense of e-mail" do
      user = User.new(first_name: "User", last_name: "Persona", password: "abc123")
      expect(user).not_to be_valid
    end
    # first name
    it "ensures presense of first name" do
      user = User.new(email: "user1@mail.app", last_name: "Persona", password: "abc123")
      expect(user).not_to be_valid
    end
    # last name
    it "ensures presense of last name" do
      user = User.new(email: "user1@mail.app", first_name: "User", password: "abc123")
      expect(user).not_to be_valid
    end
    # password
    it "ensures presense of password" do
      user = User.new(email: "user1@mail.app", first_name: "User", last_name: "Persona")
      expect(user).not_to be_valid
    end
    # commit
    it "should commit successfully" do
      user = User.new(email: "user1@mail.app", first_name: "User", last_name: "Persona", password: "abc123")
      expect(user).to be_valid
    end
  end
end
