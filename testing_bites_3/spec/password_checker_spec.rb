require "password_checker"

RSpec.describe PasswordChecker do
  it "returns true if password > 8 chars" do
    password_checker = PasswordChecker.new
    expect(password_checker.check("iamareallylongword")).to eq true
  end

  it "returns true if password is exactly 8 chars" do    
    password_checker = PasswordChecker.new
    expect(password_checker.check("password")).to eq true
  end

  it "throws error if password too short" do
    password_checker = PasswordChecker.new
    expect { password_checker.check("hello") }.to raise_error "Invalid password, must be 8+ characters."
  end

end