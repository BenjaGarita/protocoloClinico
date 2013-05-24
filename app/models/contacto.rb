class Contacto < ActiveRecord::Base
  attr_accessible :Edo_Civil, :ciudad, :colonia, :domicilio, :edad, :email, :fecha_alta, :foto, :matricula, :motivo_consulta, :nombre, :sexo, :telefono
  validates_presence_of :Edo_Civil, :ciudad, :colonia, :domicilio, :edad, :email, :fecha_alta, :foto, :matricula, :motivo_consulta, :nombre, :sexo, :telefono
  validates_numericality_of :matricula
  validate :price_must_be_at_least_a_cent

  validates_uniqueness_of :matricula
  validates_format_of :foto,
                      :with => %r{\.(gif|jpg|png|)$}i,
                      :message => 'must be a URL for GIF, JPG' +
                          'or PNG image.'
  protected
  def price_must_be_at_least_a_cent
    errors.add(:matricula, 'should be at least 3512120---' ) if matricula.nil? ||
        matricula < 3512120
  end



end
