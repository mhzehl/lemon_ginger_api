require 'rails_helper'

describe Photo do
  it { is_expected.to belong_to(:recipe) }
end
