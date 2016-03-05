class User < ActiveRecord::Base
  has_many :publications, :dependent => :delete_all
  attr_accessor :password
  before_save :encrypt_new_password
  validates :email, uniqueness: {case_sensitive: false, message: "Ya existe un usuario registrado con esa direccion de correo"}, length: {in: 6..40, message: "Correo inválido"}, format: {with: /\A(\S+)@(.+)\.(\S+)\z/, message: "Introduzca una direccion de correo válida"}
  validates :password, confirmation: {message: "Las contraseñas no coindicen"}, length: {within: 8..20, message: "La contraseña debe tener una longitud mínima de 8 caracteres"}, presence: {if: :password_required?, message: "La contraseña no puede estar en blanco"}
  validates :password_confirmation, presence: {message: "Es necesario que confirme la contraseña"}
  validates :username, uniqueness: {case_sensitive: false, message: "El username está ocupado"}, length: {in: 4..20, message: "El nombre de usuario debe tener al menos cuatro caracteres"}

  def self.authenticate(username, password)
    user = find_by_username(username)
    return user if user && user.authenticated?(password)
  end

  def authenticated?(password)
    self.hashed_password == encrypt(password)
  end

  protected
  def encrypt_new_password
    return if password.blank?
    self.hashed_password = encrypt(password)
  end

  def password_required?
    hashed_password.blank? || password.present?
  end

  def encrypt(string)
    Digest::SHA1.hexdigest(string)
  end

end
