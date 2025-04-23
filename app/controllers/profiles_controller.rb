class ProfilesController < ApplicationController
    before_action :authenticate_user! # Asegura que el usuario esté autenticado
  
    def show
      @profile = current_user.profile || current_user.build_profile
    end
  
    def edit
      @profile = current_user.profile || current_user.build_profile
    end
  
    def update
        @profile = current_user.profile || current_user.build_profile
      if @profile.update(profile_params)
        redirect_to profile_path, notice: 'Perfil actualizado correctamente.'
      else
        render :edit
      end
    end
  
    private
  
    def profile_params
      params.require(:profile).permit(:first_name, :last_name, :age, :phone, :description, :profile_picture, :email)
    end
  end
  