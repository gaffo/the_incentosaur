class Test::Unit::TestCase
  def self.should_have_link_to_admin_home
    should 'have a link to the admin home' do
      assert_tag :tag => 'a', :attributes => {:href => admin_path}
    end
  end
end