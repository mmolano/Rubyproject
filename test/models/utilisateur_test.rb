require 'test_helper'

class UtilisateurTest < ActiveSupport::TestCase
  def setup
    @utilisateur = Utilisateur.new(nom: "Mike", email: "ok@gmail.com")
  end

  test "test user" do
    assert @utilisateur.valid?
  end  

  test "test nom user" do
    @utilisateur.nom = "  "
    assert_not @utilisateur.valid?
  end 

  test "test email user" do
    @utilisateur.email = "  "
    assert_not @utilisateur.valid?
  end 

  test "test user limit " do
    @utilisateur.nom = "a" * 51
    assert_not @utilisateur.valid?
  end 

  test "test email limit" do
    @utilisateur.email = "a" * 244 + "@exemple.com"
    assert_not @utilisateur.valid?
  end 

  test "email validation should accept valid addresses" do
    adresses_valides = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                          first.last@foo.jp justine+jean@baz.cn]
    adresses_valides.each do |adresse_valide|
      @utilisateur.email = adresse_valide
      assert @utilisateur.valid?, "#{adresse_valide.inspect} doit être valide."
    end
  end
  
  test "email validation should reject invalid addresses" do
    adresses_invalides = %w[user@example,com user_at_foo.org user.name@example.
                            foo@bar_baz.com foo@bar+baz.com]
    adresses_invalides.each do |adresse_invalide|
      @utilisateur.email = adresse_invalide
      assert_not @utilisateur.valid?, "#{adresse_invalide.inspect} doit être invalide."
    end
  end

  test "email validation should be unique" do
    utilisateur_duplicated = @utilisateur.dup
    utilisateur_duplicated.email = @utilisateur.email.upcase
    @utilisateur.save
    assert_not utilisateur_duplicated.valid?
  end



end
