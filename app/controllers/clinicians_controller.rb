class CliniciansController < ApplicationController
  before_action :authenticate_clinician!
  
  
  def clinician_params    
    params.require(:clinician).permit(:name, :email, :specialty)
  end
    
  def new
    @clinician = Clinician.new
    render '/clinicians/sign_up'
  end
  
  def create
    @clinician = Clinician.new(clinician_params)
    if @clinician.save
      flash[:success] = "Clinician was succesfully created"
      redirect_to clinician_path(@clinician)
    else
      flash[:notice] = "There was a problem creating the clinician"
      render :new
    end
  end
    
  def show
    @clinician = Clinician.find(params[:id])
  end

end
