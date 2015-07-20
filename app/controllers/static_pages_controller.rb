class StaticPagesController < ApplicationController
  Person = Struct.new(:name, :phone)
  STAFF = [Person.new("Joe Boggs", "541-555-1111"),
           Person.new("Mary Johnson", "641-161-6132"),
           Person.new("Gary Neal", "613-771-5177"),
           Person.new("Chris Jackson", "152-678-0192"),
           Person.new("Betsy Powell", "610-326-1663"),
           Person.new("Chris Newman", "131-662-9329"),
         ]

  def home
    render :home
  end

  def contact
    @staff = STAFF
    render :contact
  end

  def about
    @staff = STAFF
    render :about
  end
end
