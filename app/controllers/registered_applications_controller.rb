class RegisteredApplicationsController < ApplicationController
  before_action :find_app, :except => [:create, :index, :new]
  before_filter :authenticate_user!
  
  def index
    @apps = current_user.registered_applications
  end

  def show
    @events = @app.events.all
  end

  def new
    @app = RegisteredApplication.new
  end

  def create
    @app = current_user.registered_applications.build(app_params)
    @app.user = @user

    if @app.save
      flash[:notice] = "Application was successfully registered"
      redirect_to @app
    else
      render :new
      end
    end

    def destroy
      name = @app.name

      if @app.destroy
        flash[:notice] = "\"#{name}\" successfully unregistered."
        redirect_to registered_applications_path
      else
        flash[:error] = "There was an erroe unregistering the application. Please try again."
        render :show
      end
    end







    private

    def find_app
      @app = RegisteredApplication.find(params[:id])
    end

    def app_params
      params.require(:registered_application).permit(:name, :url)
    end
  end
