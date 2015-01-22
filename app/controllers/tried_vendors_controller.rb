class TriedVendorsController < ApplicationController
respond_to :html, :js

  def create
    @company = current_user.companies.where(id: params[:tried_vendor][:company_id])
    #if @company.tried_vendors.create(tried_vendor_params)
      # do something
   # else
      # show error 
    #end
  end

  private
  def tried_vendor_params
    permit.params(:tried_vendor)
  end
end
